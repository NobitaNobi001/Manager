package com.service;

import com.bean.Student;
import com.bean.Watcher;
import com.dao.CollegeStuMapper;
import com.dao.WatcherMapper;
import com.github.pagehelper.PageHelper;
import com.utils.CollegeName;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WatcherService {

    @Autowired
    private WatcherMapper watcherMapper;

    @Autowired
    private CollegeStuMapper collegeStuMapper;

    /**
     * 根据督察账号查找密码
     *
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
     *
     * @return
     */
    public Integer selectCountWatcher() {
        return watcherMapper.countByExample(null);
    }

    public List<Watcher> selectWatchers() {
        return watcherMapper.selectByExample(null);
    }

    /*
     * 根据督查学院名查询所有学生
     * */
    public List<Student> selectAllStuByCollegeName(int collegeId, int page, int pagesize) {
        //获取表名
        String tableName = CollegeName.getTableName(collegeId);
        PageHelper.startPage(page, pagesize);
        return collegeStuMapper.selectAllStuByCollegeName(tableName);
    }

    /*
     * 督查学院映射到学院学生表，模糊查询
     * */
    public List<Student> selectStuBycondition(int collegeId, String keyword) {
        //获取表名
        String tableName = CollegeName.getTableName(collegeId);
        return collegeStuMapper.selectStuByLikeSearch(tableName, keyword);
    }


}
