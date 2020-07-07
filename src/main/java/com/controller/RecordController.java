package com.controller;

import com.bean.Credit;
import com.bean.Msg;
import com.bean.Record;
import com.service.CreditService;
import com.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/record")
public class RecordController {

    @Autowired
    private RecordService recordService;
    @Autowired
    private CreditService creditService;

    /**
     * 查询学生的申报信息
     *
     * @param id 学生记录的id
     * @return
     */
    @RequestMapping(value = "/stuRecord/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getStuRecord(@PathVariable("id") Integer id) {

        Record record = recordService.getStuRecord(id);

        return Msg.success().add("stuRecord", record);
    }


    /**
     * @param record
     * @return
     */
    @RequestMapping(value = "/stuRecord/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateStuRecord(Record record) {

        //更新申报信息
        recordService.updateRecord(record);

        //根据学号查询该学生的总学分
        double sum_credit = creditService.selectCreditByStuNumber(record.getStuNumber());

        //创建一个credit对象
        Credit credit = new Credit(record.getStuNumber(), record.getAuditCredit() + sum_credit);

        //未审核 已成功 未成功
        if (record.getAuditState().equals("已成功") && record.getAuditCredit() != 0) {
            //根据学号更新学生信息
            creditService.updateCreditByStuNumber(credit);
        }

        return Msg.success();
    }
}
