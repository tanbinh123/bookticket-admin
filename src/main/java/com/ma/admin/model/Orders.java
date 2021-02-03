package com.ma.admin.model;

import lombok.*;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
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
 * 订单管理
 *
 * @author yong
 * @date 2021/2/3 15:05
 */
@Erupt( name = "订单",
        primaryKeyCol = "order_id",
        power= @Power(add = false,delete = true,
                edit = true,query = true
        )
)
@Table(name = "orders")
@Entity
@Data
@DynamicUpdate
public class Orders implements Serializable {

    @EruptField
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "order_id")
    private Integer order_id;

    @EruptField(
            views = @View(
                    title = "用户编号", sortable = true
            ),
            edit = @Edit(
                    search = @Search,
                    title = "用户编号",
                    notNull = true,
                    type = EditType.CHOICE,
                    desc = "获取已有的用户编号",
                    choiceType = @ChoiceType(
                            fetchHandler = SqlChoiceFetchHandler.class,
                            fetchHandlerParams = "select user_id from user"
                    )
            )
    )
    @Column(name = "order_user_id")
    private Integer order_user_id;

    @EruptField(
            views = @View(
                    title = "车次编号", sortable = true
            ),
            edit = @Edit(
                    search = @Search,
                    title = "车次编号",
                    notNull = true,
                    type = EditType.CHOICE,
                    desc = "获取已有的车次编号",
                    choiceType = @ChoiceType(
                            fetchHandler = SqlChoiceFetchHandler.class,
                            fetchHandlerParams = "select trips_id from trips"
                )
            )
    )
    @Column(name = "order_trips_id")
    private Integer order_trips_id;

    @EruptField(
            views = @View(
                    title = "创建时间", sortable = true
            ),
            edit = @Edit(
                    title = "创建时间",
                    type = EditType.DATE, notNull = true,search = @Search(vague = true),
                    dateType = @DateType(type = DateType.Type.DATE_TIME)
            )
    )
    private Date order_create_time;

    @EruptField(
            views = @View(
                    title = "修改时间", sortable = true
            ),
            edit = @Edit(
                    title = "修改时间",
                    type = EditType.DATE,search = @Search(vague = true),
                    dateType = @DateType(type = DateType.Type.DATE_TIME)
            )
    )
    private Date order_update_time;

    @EruptField(
            views = @View(
                    title = "状态", sortable = true
            ),
            edit = @Edit(
                    title = "状态",search = @Search,
                    type = EditType.NUMBER, notNull = true,
                    numberType = @NumberType
            )
    )
    private Integer order_status;

    @EruptField(
            views = @View(
                    title = "乘车人姓名"
            ),
            edit = @Edit(
                    title = "乘车人姓名",search = @Search,
                    type = EditType.INPUT, notNull = true,
                    inputType = @InputType
            )
    )
    private String order_passenger_name;

    @EruptField(
            views = @View(
                    title = "乘车人身份证号码"
            ),
            edit = @Edit(
                    title = "乘车人身份证号码",search = @Search,
                    type = EditType.INPUT, notNull = true,
                    inputType = @InputType
            )
    )
    private String order_passenger_identity_num;

    @EruptField(
            views = @View(
                    title = "联系人姓名"
            ),
            edit = @Edit(
                    title = "联系人姓名",search = @Search,
                    type = EditType.INPUT,
                    inputType = @InputType
            )
    )
    private String order_linkman_name;

    @EruptField(
            views = @View(
                    title = "联系人手机号"
            ),
            edit = @Edit(
                    title = "联系人手机号",search = @Search,
                    type = EditType.INPUT,
                    inputType = @InputType
            )
    )
    private String order_linkman_phone;

    @EruptField(
            views = @View(
                    title = "坐席"
            ),
            edit = @Edit(
                    title = "坐席",
                    type = EditType.NUMBER, notNull = true,search = @Search,
                    numberType = @NumberType
            )
    )
    private Integer order_seat_level;

    @EruptField(
            views = @View(
                    title = "订单金额", sortable = true
            ),
            edit = @Edit(
                    title = "订单金额",
                    type = EditType.NUMBER, notNull = true,search = @Search(vague = true),
                    numberType = @NumberType
            )
    )
    private Integer order_price;

}
