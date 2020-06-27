package com.service;

import com.dao.WatcherMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WatcherService {

    @Autowired
    private WatcherMapper watcherMapper;
}
