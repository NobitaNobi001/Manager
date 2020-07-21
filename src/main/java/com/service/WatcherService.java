package com.service;

import com.bean.Watcher;
import com.dao.WatcherMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WatcherService {

    @Autowired
    private WatcherMapper watcherMapper;

    /**
     * 根据督察账号查找密码
     * @param watcherNumber
     * @return
     */
    public Watcher selectUPByWatcherNumber(Integer watcherNumber) {

        //通过dao层将数据进行查出
        Watcher watcher = watcherMapper.selectUPByWatcherNumber(watcherNumber);

        return watcher;
    }

    /**
     * 根据督察账号查找督察的信息
     *
     * @param watcherNumber
     * @return
     */
    public Watcher selectWatcherByWatcherNumber(Integer watcherNumber) {

        return watcherMapper.selectWatcherByWatcherNumber(watcherNumber);
    }

    /**
     * 根据主键查找督察信息
     *
     * @param id
     * @return
     */
    public Watcher selectByPrimaryKey(Integer id) {
        return watcherMapper.selectByPrimaryKey(id);
    }

    /**
     * 修改督察信息
     *
     * @param watcher
     */
    public void updateWatcher(Watcher watcher) {
        watcherMapper.updateByPrimaryKeySelective(watcher);
    }

    /**
     * 查找督察人数
     * @return
     */
    public Integer selectCountWatcher() {
        return watcherMapper.countByExample(null);
    }

    public List<Watcher> selectWatchers(){
        return watcherMapper.selectByExample(null);
    }
}
