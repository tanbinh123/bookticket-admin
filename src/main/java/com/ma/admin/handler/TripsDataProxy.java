package com.ma.admin.handler;

import com.ma.admin.dao.TrainRepository;
import com.ma.admin.model.Train;
import com.ma.admin.model.Trips;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.core.exception.EruptWebApiRuntimeException;

import java.util.Date;

/**
 * 对车次操作时的数据校验
 *
 * @author yong
 * @date 2021/2/6 22:25
 */
@Component
public class TripsDataProxy implements DataProxy<Trips> {

    @Autowired
    private TrainRepository trainRepository;

    /**
     * 在修改数据前验证
     *
     * @param trips 车次
     * @author yong
     * @date 2021/2/6 23:02
     * @return void
     */

    @Override
    public void beforeUpdate(Trips trips) {
        //获取对应列车所允许的最大座位数量
        String train_name = trips.getTrips_train_name();
        Train train = trainRepository.findByTrainName(train_name).get(0);
        Integer train_seat_num = train.getTrain_seat_num();

        if (trips.getTrips_first_seat_num()+trips.getTrips_second_seat_num()>train_seat_num) {
            throw new EruptWebApiRuntimeException("一等座二等座数量之和大于列车能承载的数量！");
        }


        //车票数量不能小于0
        if (trips.getTrips_first_seat_num()<0||trips.getTrips_second_seat_num()<0) {
            throw new EruptWebApiRuntimeException("车票数量不能低于0");
        }
    }

    /**
     * 在插入数据前验证一等座二等座数量之和是否大于列车能承载的数量
     * 增加一条新记录删除标志初始为，依据情况初始为0或1
     * @param trips 车次
     * @author yong
     * @date 2021/2/6 23:03
     * @return void
     */

    @Override
    public void beforeAdd(Trips trips) {
        //获取对应列车所允许的最大座位数量
        String train_name = trips.getTrips_train_name();
        Train train = trainRepository.findByTrainName(train_name).get(0);
        Integer train_seat_num = train.getTrain_seat_num();

        if (trips.getTrips_first_seat_num()+trips.getTrips_second_seat_num()>train_seat_num) {
            throw new EruptWebApiRuntimeException("一等座二等座数量之和大于列车能承载的数量！");
        }

        //增加一条新记录删除标志初始为0
        trips.setTrips_delete_flag(0);

        //车票数量不能小于0
        if (trips.getTrips_first_seat_num()<0||trips.getTrips_second_seat_num()<0) {
            throw new EruptWebApiRuntimeException("车票数量不能低于0");
        }
    }
}
