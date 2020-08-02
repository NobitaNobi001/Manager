package com.service;

import com.bean.Student;
import com.bean.Watcher;
import com.bean.WatcherExample;
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
     * 查找督察数量
     *
     * @return
     */
    public Integer selectCountWatcher() {
        return watcherMapper.countByExample(null);
    }

    /**
     * 批量查询督察
     *
     * @return
     */
    public List<Watcher> selectWatchers() {
        return watcherMapper.selectByExample(null);
    }

    /**
     * 督查学院映射到学院学生表，模糊查询
     *
     * @param collegeId 学院id
     * @param keyword   关键词
     * @return
     */
    public List<Student> selectStuBycondition(int collegeId, String keyword) {

        //获取表名
        String tableName = CollegeName.getTableName(collegeId);

        return collegeStuMapper.selectStuByLikeSearch(tableName, keyword);
    }

    /**
     * 校验用户名是否已经存在
     *
     * @param watcherNumber
     * @return
     */
    public boolean checkWatcher(Integer watcherNumber) {

        //创建一个watcherExample对象
        WatcherExample watcherExample = new WatcherExample();

        WatcherExample.Criteria criteria = watcherExample.createCriteria();

        criteria.andWatcherNumberEqualTo(watcherNumber);

        return watcherMapper.countByExample(watcherExample) == 0;

    }

    /**
     * 新增单个督察
     *
     * @param watcher 单个督察信息
     */
    public void insertWatcher(Watcher watcher) {
        watcherMapper.insertSelective(watcher);
    }

    /**
     * 根据主键删除督察信息
     *
     * @param id
     */
    public void deleteWatcher(Integer id) {
        watcherMapper.deleteByPrimaryKey(id);
    }

    /**
     * 根据主键更新督察信息
     *
     * @param watcher
     */
    public void updateWatcherByPrimaryKey(Watcher watcher) {
        watcherMapper.updateByPrimaryKeySelective(watcher);
    }

    /**
     * 条件查询
     * @param collegeId
     * @param keywords
     * @return
     */
    public List<Watcher> findWathcerWithCondition(Integer collegeId, String keywords) {

        List<Watcher> watchers = watcherMapper.selectWatcherWithCondition(collegeId, keywords);

        if(watchers.size()==0){
            return null;
        }else{
            return watchers;
        }

    }
}