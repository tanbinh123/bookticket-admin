package com.ma.admin.model;

import lombok.*;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.InputType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 站点管理
 *
 * @author yong
 * @date 2021/2/3 14:15
 */
@Erupt( name = "站点",
        primaryKeyCol = "station_id"
)
@Table( name = "station")
@Data
@Entity
@DynamicUpdate
@DynamicInsert
public class Station implements Serializable {

    @EruptField
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "station_id")
    private Integer station_id;

    @EruptField(
            views = @View(
                    title = "站点名称", sortable = true
            ),
            edit = @Edit(
                    title = "站点名称",
                    type = EditType.INPUT, notNull = true,search = @Search,
                    inputType = @InputType
            )
    )
    @Column(name = "station_name")
    private String station_name;

    @EruptField(
            views = @View(
                    title = "站点所在地"
            ),
            edit = @Edit(
                    title = "站点所在地",
                    type = EditType.INPUT,search = @Search,
                    inputType = @InputType
            )
    )
    @Column(name = "station_adress")
    private String station_adress;
}
