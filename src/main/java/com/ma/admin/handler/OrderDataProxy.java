package com.ma.admin.handler;

import com.ma.admin.dao.TripsRepository;
import com.ma.admin.model.Orders;
import com.ma.admin.model.Trips;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.core.exception.EruptWebApiRuntimeException;

import java.util.Collection;
import java.util.Date;
import java.util.Map;
import java.util.Optional;


/**
 * 订单数据校验和处理
 *
 * @author yong
 * @date 2021/2/6 20:17
 */
@Component
public class OrderDataProxy implements DataProxy<Orders> {

    @Autowired
    private TripsRepository tripsRepository;

    /**
     * 在进行数据更新前对一些更改的字段进行数据校验
     * 因在字典里坐席的id分别为11和22，所以这里需要修改为1和2
     *
     * @param orders 订单
     * @author yong
     * @date 2021/2/6 21:57
     * @return void
     */

    @Override
    public void beforeUpdate(Orders orders) {
        //校验身份证号
        String order_passenger_identity_num = orders.getOrder_passenger_identity_num();
        String regex_identity="^\\d{15}|\\d{18}$";
        if(!order_passenger_identity_num.matches(regex_identity))
            throw new EruptWebApiRuntimeException("请请输入正确的身份证号!");

        //校验联系人手机号
        String order_linkman_phone = orders.getOrder_linkman_phone();
        String regex_phone="0?(13|14|15|18|17)[0-9]{9}";
        if(!order_linkman_phone.matches(regex_phone))
            throw new EruptWebApiRuntimeException("请请输入正确的手机号!");

        //修改坐席的值
        if(orders.getOrder_seat_level()==11)
            orders.setOrder_seat_level(1);
        else
            orders.setOrder_seat_level(2);
    }

    /**
     * 在数据更改后更改订单表的更新时间
     *
     * @param orders 订单
     * @author yong
     * @date 2021/2/6 21:57
     * @return void
     */

    @Override
    public void afterUpdate(Orders orders) {
        //更改时设置修改时间
        Date date = new Date();
        orders.setOrder_update_time(date);
    }

    /**
     * 在查询时对每个订单的状态进行更新，如果订单的车次已发车，则状态也要相应改变
     *
     * @param list 查询到订单列表
     * @author yong
     * @date 2021/2/7 20:17
     * @return void
     */

    @Override
    public void afterFetch(Collection<Map<String, Object>> list) {

        if(list!=null && list.size()!=0) {
            list.forEach(order->{
                String order_status =(String) order.get("order_status");
                if(order_status.equals("创建")) {
                    Optional<Trips> trips = tripsRepository.findById( (Integer) order.get("trips_trips_id"));
                    trips.ifPresent(t->{
                        if(t.getTrips_start_time().getTime()<new Date().getTime() )
                            order.put("order_status","已发车");            //设置为已经发车
                    });
                }
            });
        }
    }
}
