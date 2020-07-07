package com.service;

import com.bean.Credit;
import com.dao.CreditMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CreditService {

    @Autowired
    private CreditMapper creditMapper;

    public void updateCreditByStuNumber(Credit credit) {

        creditMapper.updateByStuNumber(credit);
    }

    public Double selectCreditByStuNumber(Integer stuNumber) {

        return creditMapper.selectBystuNumber(stuNumber);
    }
}
