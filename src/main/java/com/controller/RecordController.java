package com.controller;

import com.bean.Credit;
import com.bean.Msg;
import com.bean.Record;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.CollegeStuService;
import com.service.CreditService;
import com.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/record")
public class RecordController {

    @Autowired
    private RecordService recordService;
    @Autowired
    private CreditService creditService;
    @Autowired
    private CollegeStuService collegeStuService;

    //存储已经审核并给了审核学分的id 存储上限为2^32-1
    List<Integer> recordHandler = new ArrayList<>();

    /**
     * 查询学生的申报信息
     *
     * @param id 学生记录的id
     * @return
     */
    @RequestMapping(value = "/studentRecord/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getStuRecord(@PathVariable("id") Integer id) {

        Record record = recordService.getStuRecord(id);

        return Msg.success().add("stuRecord", record);
    }


    /**
     * 根据申报记录的id更新申报记录的审核
     * @param record
     * @return
     */
    @RequestMapping(value = "/updateRecord/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateStuRecord(Record record) {

        //根据学号查询该学生的总学分
        double sum_credit = creditService.selectCreditByStuNumber(record.getStuNumber());

        //创建一个credit对象
        Credit credit = new Credit(record.getStuNumber(), record.getAuditCredit() + sum_credit);

        //如果这条记录在其中不存在并且给出了审核学分 并且状态修改为了已审核
        if (!recordHandler.contains(record.getId()) && record.getAuditCredit() >= 0 && record.getAuditState().equals("已审核")) {

            //将这条审核记录添加到ArrayList中
            recordHandler.add(record.getId());

            //更新申报信息
            recordService.updateRecord(record);

            //根据学号更新学生信息
            creditService.updateCreditByStuNumber(credit);

            //返回成功信息
            return Msg.success();
        }

        return Msg.fail();
    }

    /**
     * 根据学生姓名和学院id获取学生申报记录
     *
     * @param stuName
     * @return
     */
    @RequestMapping(value = "/stuRecord", method = RequestMethod.GET)
    @ResponseBody
    public Msg selectWithStuNumber(@RequestParam("stuName") String stuName, @RequestParam("collegeId") Integer collegeId) {

        List<String> stuNames = collegeStuService.selectStuNameWithCollegeId(collegeId);

        if (stuNames.contains(stuName)) {
            //设置起始页码以及每页的记录条数
            PageHelper.startPage(1, 5);

            List<Record> records = recordService.getRecordsBystuName(stuName);

            //使用pageInfo包装查询后的结果
            PageInfo page = new PageInfo(records, 5);

            return Msg.success().add("pageInfo", page);
        }

        return Msg.fail();
    }
}
