package com.service;

import com.bean.Sort;
import com.dao.SortMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class SortService {

    @Autowired
    SortMapper sortMapper;

    /**
     * select
     */
    /**
     * 根据主键查找类别
     * @param id
     * @return
     */
    public Sort getSort(Integer id){
        return sortMapper.selectByPrimaryKey(id);
    }

    /**
     * update
     */

    /**
     * 更新申报上限
     * @param sort
     */
    public void updateSort(Sort sort){

        sortMapper.updateByPrimaryKeySelective(sort);
    }

}
