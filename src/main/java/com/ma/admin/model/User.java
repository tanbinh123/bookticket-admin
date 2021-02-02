package com.ma.admin.model;

import lombok.*;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.DateType;
import xyz.erupt.annotation.sub_field.sub_edit.InputType;

import javax.persistence.*;
import java.util.Date;

/**
 * 用户管理
 *
 * @author yong
 * @date 2021/2/2 16:15
 */
@Entity
@Data
@Erupt( name = "用户",
        primaryKeyCol = "user_id",
        power= @Power(add = true,delete = true,
                edit = true,query = true
        )
)
@Table(name = "user")
public class User {

    @EruptField
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "user_id")
    private Integer user_id;

    @EruptField(
            views = @View(
                    title = "用户名", sortable = true
            ),
            edit = @Edit(
                    title = "用户名",
                    type = EditType.INPUT, notNull = true,
                    inputType = @InputType
            )
    )
    @Column(name= "user_login_name")
    private String user_login_name;

    @EruptField(
            views = @View(
                    title = "手机号"
            ),
            edit = @Edit(
                    title = "手机号",
                    type = EditType.INPUT,
                    inputType = @InputType
            )
    )
    @Column(name = "user_phone")
    private String user_phone;

    @EruptField(
            views = @View(
                    title = "性别"
            ),
            edit = @Edit(
                    title = "性别",
                    type = EditType.INPUT,
                    inputType = @InputType
            )
    )
    @Column(name = "user_sex")
    private String user_sex;

    @EruptField(
            views = @View(
                    title = "邮箱"
            ),
            edit = @Edit(
                    title = "邮箱",
                    type = EditType.INPUT, notNull = true,
                    inputType = @InputType(type = "email")
            )
    )
    @Column(name = "user_email")
    private String user_email;

    @EruptField(
            views = @View(
                    title = "生日"
            ),
            edit = @Edit(
                    title = "生日",
                    type = EditType.DATE,
                    dateType = @DateType(type = DateType.Type.DATE)
            )
    )
    @Column(name = "user_birth")
    private Date user_birth;

    @EruptField(
            views = @View(
                    title = "身份证号"
            ),
            edit = @Edit(
                    title = "身份证号",
                    type = EditType.INPUT,
                    inputType = @InputType
            )
    )
    @Column(name = "user_identity_num")
    private String user_identity_num;

    @EruptField(
            views = @View(
                    title = "密码", show = false
            ),
            edit = @Edit(
                    title = "密码",
                    type = EditType.INPUT, show = false,
                    inputType = @InputType
            )
    )
    @Column(name = "user_password")
    private String user_password;

    @EruptField(
            views = @View(
                    title = "盐值", show = false
            ),
            edit = @Edit(
                    title = "盐值",
                    type = EditType.INPUT, show = false,
                    inputType = @InputType
            )
    )
    @Column(name = "user_salt")
    private String user_salt;

}