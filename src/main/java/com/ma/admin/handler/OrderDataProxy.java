package com.ma.admin.handler;

import com.ma.admin.model.Orders;
import org.springframework.stereotype.Component;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.core.exception.EruptWebApiRuntimeException;

import java.util.Date;


/**
 * 订单数据校验和处理
 *
 * @author yong
 * @date 2021/2/6 20:17
 */
@Component
public class OrderDataProxy implements DataProxy<Orders> {


    /**
     * 在进行数据更新前对一些更改的字段进行数据校验
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
}
