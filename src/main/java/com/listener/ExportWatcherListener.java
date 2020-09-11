package com.listener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.bean.Watcher;
import com.bean.WatcherExcel;
import com.service.CollegeService;
import com.service.WatcherService;
import com.utils.CollegeNameUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * 监听批量督察excel导入
 */
@Component
@Scope("prototype")
public class ExportWatcherListener extends AnalysisEventListener<WatcherExcel> {

    @Autowired
    private WatcherService watcherService;

    @Autowired
    private CollegeService collegeService;

    List<Watcher> watchers = new ArrayList<>();

    @Override
    public void invoke(WatcherExcel watcherExcel, AnalysisContext analysisContext) {

        Watcher watcher = new Watcher();

        watcher.setWatcherNumber(watcherExcel.getWatcherNumber());

        watcher.setPassword(String.valueOf(watcherExcel.getWatcherNumber()));

        watcher.setWatcherName(watcherExcel.getWatcherName());

        watcher.setCollegeId(collegeService.getCollegeIdByName(watcherExcel.getCollegeName()));

        watcher.setGender(watcherExcel.getGender());

        watcher.setPhone(watcherExcel.getPhone());

        watcher.setEmail(watcherExcel.getEmail());

        watchers.add(watcher);

        if (watchers.size() % 25 == 0) {
            watcherService.insertBatchWatcherByExcel(watchers);
            watchers.clear();
        }
    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {
        if (watchers.size() != 0) {
            watcherService.insertBatchWatcherByExcel(watchers);
        }

        watchers.clear();
    }

    public List<Watcher> getWatchers() {
        return watchers;
    }

    public void setWatchers(List<Watcher> watchers) {
        this.watchers = watchers;
    }
}
