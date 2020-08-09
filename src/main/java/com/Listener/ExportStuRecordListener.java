package com.Listener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.bean.Record;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * @author hbk
 * @date 2020/7/31
 **/
@Component
@Scope("prototype")
public class ExportStuRecordListener extends AnalysisEventListener<Record> {

    // 每次读取内容都会调用invoke方法 在invoke中操作要读取的数据
    @Override
    public void invoke(Record data, AnalysisContext context) {

    }

    // 读完excel之后调用的方法
    @Override
    public void doAfterAllAnalysed(AnalysisContext context) {

    }
}
