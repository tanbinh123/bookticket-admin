package com.ma.admin.model;

import lombok.*;

import org.hibernate.annotations.GenericGenerator;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.InputType;
import xyz.erupt.annotation.sub_field.sub_edit.NumberType;

import javax.persistence.*;

/**
 * TODO
 *
 * @author yong
 * @date 2021/2/2 22:00
 */
@Entity
@Data
@Erupt( name = "火车",
        primaryKeyCol = "train_id"
)
@Table(name = "train")
public class Train {

    @EruptField
    @Id
    @GeneratedValue(
            generator = "generator"
    )
    @GenericGenerator(
            name = "generator",
            strategy = "native"
    )
    @Column(name = "train_id")
    private Integer train_id;

    @EruptField(
            views = @View(
                    title = "火车名"
            ),
            edit = @Edit(
                    title = "火车名",
                    type = EditType.INPUT, notNull = true,
                    inputType = @InputType
            )
    )
    @Column(name = "train_name")
    private String train_name;

    @EruptField(
            views = @View(
                    title = "最大速度", sortable = true
            ),
            edit = @Edit(
                    title = "最大速度",
                    type = EditType.NUMBER,
                    numberType = @NumberType
            )
    )
    @Column(name = "train_speed")
    private Integer train_speed;

    @EruptField(
            views = @View(
                    title = "座位数量"
            ),
            edit = @Edit(
                    title = "座位数量",
                    type = EditType.NUMBER, notNull = true,
                    numberType = @NumberType
            )
    )
    @Column(name = "train_seat_num")
    private Integer train_seat_num;

}
