package com.ma.admin.handler;

import com.ma.admin.model.User;
import org.springframework.stereotype.Component;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.core.exception.EruptWebApiRuntimeException;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 用户管理修改数据时对部分数据进行校验
 *
 * @author yong
 * @date 2021/2/6 15:51
 */
@Component
public class UserDataProxy implements DataProxy<User> {

    /**
     * 在进行数据更新前对一些更改的字段进行数据校验
     *
     * @param user 用户
     * @author yong
     * @date 2021/2/6 21:56
     * @return void
     */
    @Override
    public void beforeUpdate(User user) {

        //校验手机号
        String user_phone = user.getUser_phone();
        String regex_phone="0?(13|14|15|18|17)[0-9]{9}";
        Pattern pattern = Pattern.compile(regex_phone);
        Matcher matcher = pattern.matcher(user_phone);
        if(!matcher.matches())
            throw new EruptWebApiRuntimeException("请请输入正确的手机号!");

        //校验邮箱
        String user_email = user.getUser_email();
        String regex_email= "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
        if(!user_email.matches(regex_email))
            throw new EruptWebApiRuntimeException("请请输入正确的邮箱号!");

        //校验身份证号
        String user_identity_num = user.getUser_identity_num();
        String regex_identity="^\\d{15}|\\d{18}$";
        if(!user_identity_num.matches(regex_identity))
            throw new EruptWebApiRuntimeException("请请输入正确的身份证号!");

        //校验性别
        String user_sex = user.getUser_sex();
        if(!user_sex.equals("男") && !user_sex.equals("女"))
            throw new EruptWebApiRuntimeException("请请输入正确的性别!");
    }


}
