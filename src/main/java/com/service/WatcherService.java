package com.service;

import com.bean.Teacher;
import com.bean.Watcher;
import com.dao.WatcherMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WatcherService {

    @Autowired
    private WatcherMapper watcherMapper;

    public Watcher selectUPByWatcherNumber(Integer watcherNumber){

        //通过dao层将数据进行查出
        Watcher watcher = watcherMapper.selectUPByWatcherNumber(watcherNumber);

        return watcher;
    }
}
