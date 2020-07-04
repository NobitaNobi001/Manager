package com.dao;

import com.bean.Watcher;
import com.bean.WatcherExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WatcherMapper {
    Watcher selectUPByWatcherNumber(Integer watcherNumber);

    int countByExample(WatcherExample example);

    int deleteByExample(WatcherExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Watcher record);

    int insertSelective(Watcher record);

    List<Watcher> selectByExample(WatcherExample example);

    Watcher selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Watcher record, @Param("example") WatcherExample example);

    int updateByExample(@Param("record") Watcher record, @Param("example") WatcherExample example);

    int updateByPrimaryKeySelective(Watcher record);

    int updateByPrimaryKey(Watcher record);
}