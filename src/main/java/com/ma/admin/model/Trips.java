package com.ma.admin.model;

import lombok.*;
import org.hibernate.annotations.SQLDelete;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Filter;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.*;
import xyz.erupt.upms.handler.SqlChoiceFetchHandler;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 车次管理
 *
 * @author yong
 * @date 2021/2/3 14:44
 */
@Erupt( name = "车次",
        primaryKeyCol = "trips_id",
        filter = @Filter("trips_delete_flag = 0"),
        power= @Power(add = false,delete = true,
                edit = true,query = true
        )
)
@SQLDelete(sql="update trips set trips_delete_flag = 1 where trips_id = ?")
@Table(name = "trips")
@Entity
@Data
public class Trips implements Serializable {

    @EruptField(
            views = @View(
                    title = "车次编号"
            )
    )
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "trips_id")
    private Integer trips_id;

    @EruptField(
            views = @View(
                    title = "列车编号"
            ),
            edit = @Edit(
                    search = @Search,
                    title = "列车编号",
                    notNull = true,
                    type = EditType.CHOICE,
                    desc = "获取已有的列车",
                    choiceType = @ChoiceType(
                            fetchHandler = SqlChoiceFetchHandler.class,
                            fetchHandlerParams = "select line_id from line"
                    )
            )
    )
    @Column(name = "trips_line_id")
    private Integer trips_line_id;

    @EruptField(
            views = @View(
                    title = "列车名称", sortable = true
            ),
            edit = @Edit(
                    title = "列车名称",
                    type = EditType.INPUT, notNull = true,search = @Search,
                    inputType = @InputType
            )
    )
    @Column(name= "trips_train_name")
    private String trips_train_name;

    @EruptField(
            views = @View(
                    title = "出发时间", sortable = true
            ),
            edit = @Edit(
                    title = "出发时间",
                    type = EditType.DATE, notNull = true,search = @Search(vague = true),
                    dateType = @DateType(type = DateType.Type.DATE_TIME)
            )
    )
    @Column(name= "trips_start_time")
    private Date trips_start_time;

    @EruptField(
            views = @View(
                    title = "到达时间", sortable = true
            ),
            edit = @Edit(
                    title = "到达时间",
                    type = EditType.DATE, notNull = true,search = @Search(vague = true),
                    dateType = @DateType(type = DateType.Type.DATE_TIME)
            )
    )
    @Column(name= "trips_end_time")
    private Date trips_end_time;

    @EruptField(
            views = @View(
                    title = "一等座剩余座位数量", sortable = true
            ),
            edit = @Edit(
                    title = "一等座剩余座位数量",
                    type = EditType.NUMBER, notNull = true,search = @Search(vague = true),
                    numberType = @NumberType
            )
    )
    @Column(name= "trips_first_seat_num")
    private Integer trips_first_seat_num;

    @EruptField(
            views = @View(
                    title = "二等座剩余座位数量", sortable = true
            ),
            edit = @Edit(
                    title = "二等座剩余座位数量",
                    type = EditType.NUMBER, notNull = true,search = @Search(vague = true),
                    numberType = @NumberType
            )
    )
    @Column(name= "trips_second_seat_num")
    private Integer trips_second_seat_num;

    @EruptField(
            views = @View(
                    title = "一等座票价", sortable = true
            ),
            edit = @Edit(
                    title = "一等座票价",
                    type = EditType.NUMBER, notNull = true,search = @Search(vague = true),
                    numberType = @NumberType
            )
    )
    @Column(name= "trips_first_seat_price")
    private Double trips_first_seat_price;

    @EruptField(
            views = @View(
                    title = "二等座票价", sortable = true
            ),
            edit = @Edit(
                    title = "二等座票价",
                    type = EditType.NUMBER, notNull = true,search = @Search(vague = true),
                    numberType = @NumberType
            )
    )
    @Column(name= "trips_second_seat_price")
    private Double trips_second_seat_price;

    @Column(name = "trips_delete_flag")
    private Integer trips_delete_flag;          //逻辑删除标志
}
