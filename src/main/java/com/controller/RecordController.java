package com.controller;

import com.bean.Credit;
import com.bean.Msg;
import com.bean.Record;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.CollegeStuService;
import com.service.CreditService;
import com.service.RecordService;
import com.service.SortService;
import com.utils.SortUtil;
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
    @Autowired
    private SortService sortService;

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
     *
     * @param auditCredit
     * @param auditTea
     * @param id
     * @return
     */
    @RequestMapping(value = "/updateRecord/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateStuRecord(@RequestParam("auditCredit") double auditCredit, @RequestParam("auditTea") String auditTea, @RequestParam("collegeId") Integer collegeId, @RequestParam("sort") String sort, @PathVariable("id") Integer id) {

        //根据主键查找学生的申报记录
        Record record = recordService.selectByPrimaryKey(id);

        //根据学号查询该学生的总学分
        double sum_credit = creditService.selectCreditByStuNumber(record.getStuNumber());

        //查出这个类别学生已审核的所有学分
        double sum = recordService.getHaveCredit(sort, record.getStuNumber());

        //获取此类别的学分上限
        double max = SortUtil.getMaxByName(sort, sortService.getSort(collegeId));

        //如果是第一次审核
        if (record.getAuditState().equals("未审核") && auditCredit >= 0) {

            if (auditCredit > max) {
                return Msg.fail().add("msg", "此类别学分获取最多为" + max + "分");
            }

            //修改审核状态
            record.setAuditState("已审核");
            //修改审核学分
            record.setAuditCredit(auditCredit);
            //修改审核教师
            record.setAuditTea(auditTea);

            //更新申报信息
            recordService.updateRecord(record);

            //更新总学分表
            creditService.updateCreditByStuNumber(new Credit(record.getStuNumber(), record.getAuditCredit() + sum_credit));

            return Msg.success();
        }

        //如果审核失误，要进行修改
        if (record.getAuditState().equals("已审核") && auditCredit >= 0) {

            //如果没有做审核学分的变动
            if (auditCredit == record.getAuditCredit()) {

                return Msg.fail().add("msg", "您没有对审核学分做任何变动");
            }

            //获取修改前的审核学分
            double temp = record.getAuditCredit();

            //修改本条记录的审核学分与审核教师
            if (sum - temp + auditCredit > max) {
                return Msg.fail().add("msg", (max - sum) <= 0 ? "该类别所获学分已达上限" : "该类别可获学分为" + (max - sum));
            }
            record.setAuditCredit(auditCredit);
            record.setAuditTea(auditTea);

            //更新申报信息
            recordService.updateRecord(record);

            //更新总学分表
            creditService.updateCreditByStuNumber(new Credit(record.getStuNumber(), sum_credit - temp + auditCredit));

            return Msg.success();
        }

        return Msg.fail().add("msg", "审核失败");
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

    /**
     * 获取学生的申报信息
     *
     * @param pn        页码
     * @param collegeId 学院id
     * @return
     */
    @RequestMapping(value = "/declare", method = RequestMethod.GET)
    @ResponseBody
    public Msg declareInfo(@RequestParam(value = "pn", defaultValue = "1") Integer pn, @RequestParam("collegeId") int collegeId, @RequestParam("auditGrade") String auditGrade) {

        //如果未给该教师分配审核年级
        if ("-1".equals(auditGrade)) {
            return Msg.fail();
        }

        //将对应学院的学生学号进行查出
        List<Integer> stuNumbers = collegeStuService.selectStuNumberWithCollegeIdAndGrade(collegeId, auditGrade);

        //如果学号为空
        if (stuNumbers.size() == 0) {
            return Msg.fail();
        }

        //设置起始页码以及每页的记录条数
        PageHelper.startPage(pn, 5);

        //根据学号进行申报记录的查出
        List<Record> stuRecords = recordService.getAllRecords(stuNumbers);

        if (stuRecords.size() == 0) {
            return Msg.fail();
        }

        //使用pageInfo包装查询后的结果
        PageInfo page = new PageInfo(stuRecords, 5);

        return Msg.success().add("pageInfo", page);
    }

    List<Record> stuRecords = new ArrayList<>();

    /**
     * 获取学生已审核的申报记录
     *
     * @param pn
     * @param collegeId
     * @return
     */
    @RequestMapping(value = "/auditInfo", method = RequestMethod.GET)
    @ResponseBody
    public Msg auditInfo(@RequestParam(value = "pn", defaultValue = "1") Integer pn, @RequestParam(value = "collegeId", defaultValue = "-1") int collegeId) {

        //当选择了查询的学院学生申报记录
        if (collegeId != -1) {
            //将对应学院的学生学号进行查出
            List<Integer> stuNumbers = collegeStuService.selectStuNumberWithCollegeId(collegeId);

            //如果学号为空
            if (stuNumbers.size() == 0) {
                return Msg.fail();
            }

            //设置起始页码以及每页的记录条数
            PageHelper.startPage(pn, 5);

            //根据学号进行申报记录的查出
            stuRecords = recordService.getAllAuditRecords(stuNumbers);

        } else {    //反之则全部查出

            //设置起始页码以及每页的记录条数
            PageHelper.startPage(pn, 5);

            stuRecords = recordService.selectAllRecords();
        }

        if (stuRecords.size() == 0) {
            return Msg.fail();
        }

        //使用pageInfo包装查询后的结果
        PageInfo page = new PageInfo(stuRecords, 5);

        return Msg.success().add("pageInfo", page);

    }

    @GetMapping("/allRecord")
    @ResponseBody
    public Msg getRecordByStuNumber(@RequestParam("pn") Integer pn, Integer stuNumber) {

        //设置起始页码以及每页的记录条数
        PageHelper.startPage(pn, 5);

        List<Record> stuRecords = recordService.selectAllRecordsByStuNumber(stuNumber);

        if (stuRecords.size() == 0) {
            return Msg.fail();
        }

        //使用pageInfo包装查询后的结果
        PageInfo page = new PageInfo(stuRecords, 5);

        return Msg.success().add("pageInfo", page);
    }
}
