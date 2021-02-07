package com.ma.admin.dao;

import com.ma.admin.model.Train;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


import java.util.List;


/**
 * 提供列车的一些数据操作接口
 *
 * @author yong
 * @date 2021/2/6 22:17
 */
@Repository
public interface TrainRepository extends JpaRepository<Train,Integer> {

    /**
     * 通过列车名称获得对应的列车
     *
     * @param train_name 列车名称
     * @author yong
     * @date 2021/2/6 22:23
     * @return com.ma.admin.model.Train
     */
    List<Train> findByTrainName(String train_name);
}