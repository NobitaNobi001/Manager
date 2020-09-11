package com.service;

import com.bean.Student;
import com.bean.StudentExample;
import com.bean.Watcher;
import com.bean.WatcherExample;
import com.dao.CollegeStuMapper;
import com.dao.WatcherMapper;
import com.utils.CollegeNameUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 督察相关操作的业务层
 */
@Service
public class WatcherService {

    @Autowired
    private WatcherMapper watcherMapper;

    @Autowired
    private CollegeStuMapper collegeStuMapper;

    /**
     * select
     */

    /**
     * 查找督察数量
     *
     * @return
     */
    public Integer selectCountWatcher() {
        return watcherMapper.countByExample(null);
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
     * 批量查询所有督察
     *
     * @return
     */
    public List<Watcher> selectWatchers() {
        return watcherMapper.selectByExample(null);
    }

    /**
     * find
     */

    /**
     * 条件查询
     *
     * @param collegeId
     * @param keywords
     * @return
     */
    public List<Watcher> findWathcerWithCondition(Integer collegeId, String keywords) {

        List<Watcher> watchers = watcherMapper.selectWatcherWithCondition(collegeId, keywords);

        if (watchers.size() == 0) {
            return null;
        } else {
            return watchers;
        }

    }

    /**
     * update
     */

    /**
     * 修改督察信息
     *
     * @param watcher
     */
    public void updateWatcher(Watcher watcher) {
        watcherMapper.updateByPrimaryKeySelective(watcher);
    }

    /**
     * 根据督察工号更新密码
     *
     * @param number
     * @param password
     */
    public void updatePasswordByWatcherNumber(Integer number, String password) {
        watcherMapper.updatePasswordByWatcherNumber(number, password);
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
     * insert
     */

    /**
     * 新增单个督察
     *
     * @param watcher 单个督察信息
     */
    public void insertWatcher(Watcher watcher) {
        watcherMapper.insertSelective(watcher);
    }

    /**
     * 通过excel批量导入督察
     * @param watchers
     */
    public void insertBatchWatcherByExcel(List<Watcher> watchers) {

        try {
            watcherMapper.insertBatchWatcherByExcel(watchers);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * delete
     */

    /**
     * 根据主键删除督察信息
     *
     * @param id
     */
    public void deleteWatcher(Integer id) {
        watcherMapper.deleteByPrimaryKey(id);
    }

    /**
     * 批量删除
     *
     * @param id
     */
    public void batchDeleteWathcers(List<Integer> id) {

        WatcherExample watcherExample = new WatcherExample();

        WatcherExample.Criteria criteria = watcherExample.createCriteria();

        criteria.andIdIn(id);

        watcherMapper.deleteByExample(watcherExample);
    }

    /**
     * check
     */

    /**
     * 督查学院映射到学院学生表，模糊查询
     *
     * @param collegeId 学院id
     * @param keyword   关键词
     * @return
     */
    public List<Student> selectStuBycondition(int collegeId, String keyword) {

        //获取表名
        String tableName = CollegeNameUtil.getTableName(collegeId);

        return collegeStuMapper.selectStuByLikeSearch(tableName, keyword);
    }

    /**
     * 根据督察工号检查是否绑定此邮箱
     *
     * @param number 工号
     * @param email  邮箱
     * @return
     */
    public boolean checkEmailByWatcher(Integer number, String email) {
        return watcherMapper.selectEmailByWatcher(number, email) == 0;
    }

    /**
     * 检查学生学号是否已存在
     *
     * @param watcherNumber 学生学号
     * @return
     */
    public boolean checkWatcher(Integer watcherNumber) {

        WatcherExample watcherExample = new WatcherExample();

        WatcherExample.Criteria criteria = watcherExample.createCriteria();

        criteria.andWatcherNumberEqualTo(watcherNumber);

        return watcherMapper.countByExample(watcherExample) == 0;

    }
}