package com.listener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.bean.WatcherExcel;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * 监听批量督察excel导入
 */
@Component
@Scope("prototype")
public class ExportWatcherListener extends AnalysisEventListener<WatcherExcel> {


    @Override
    public void invoke(WatcherExcel watcherExcel, AnalysisContext analysisContext) {

    }

    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {

    }
}
