package com.ma.admin.dao;

import com.ma.admin.model.Trips;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

/**
 * 车次数据操作接口
 *
 * @author yong
 * @date 2021/2/7 19:31
 */
public interface TripsRepository  extends JpaRepository<Trips,Integer> {

    /**
     * 通过id获得车次信息
     *
     * @param id 车次编号
     * @author yong
     * @date 2021/2/7 20:03
     * @return java.util.Optional<com.ma.admin.model.Trips>
     */

    @Override
    Optional<Trips> findById(Integer id);
}
