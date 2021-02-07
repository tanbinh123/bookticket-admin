package com.ma.admin.handler;

import com.ma.admin.model.Line;
import org.springframework.stereotype.Component;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.core.exception.EruptWebApiRuntimeException;

/**
 * 线路管理插入和修改进行一些数据验证，通过才能执行操作
 *
 * @author yong
 * @date 2021/2/7 14:33
 */
@Component
public class LineDataProxy implements DataProxy<Line> {

    /**
     * 插入前检验起始站点和达到站点是否相同
     *
     * @param line 线路
     * @author yong
     * @date 2021/2/7 14:36
     * @return void
     */

    @Override
    public void beforeAdd(Line line) {
        String line_start_station_name = line.getLine_start_station_name();
        String line_end_station_name = line.getLine_end_station_name();
        if(line_start_station_name.equals(line_end_station_name))
            throw new EruptWebApiRuntimeException("起始站点和达到站点不能相同");
    }

    /**
     * 修改前检验起始站点和达到站点是否相同
     *
     * @param line 线路
     * @author yong
     * @date 2021/2/7 14:36
     * @return void
     */
    @Override
    public void beforeUpdate(Line line) {
        String line_start_station_name = line.getLine_start_station_name();
        String line_end_station_name = line.getLine_end_station_name();
        if(line_start_station_name.equals(line_end_station_name))
            throw new EruptWebApiRuntimeException("起始站点和达到站点不能相同");
    }
}
