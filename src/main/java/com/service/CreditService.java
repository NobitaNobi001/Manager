package com.service;

import com.bean.Credit;
import com.dao.CreditMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 学生总学分相关操作的业务层
 */
@Service
public class CreditService {

    @Autowired
    private CreditMapper creditMapper;

    /**
     * 根据学号查询学生总学分
     * @param stuNumber
     * @return
     */
    public Double selectCreditByStuNumber(Integer stuNumber) {

        return creditMapper.selectBystuNumber(stuNumber);
    }

    /**
     * 根据学生学号更新学生总学分
     * @param credit
     */
    public void updateCreditByStuNumber(Credit credit) {

        creditMapper.updateByStuNumber(credit);
    }

}
