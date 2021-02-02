package com.ma.admin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import xyz.erupt.core.annotation.EruptScan;



@SpringBootApplication
@ComponentScan({"xyz.erupt", "com.ma.admin"}) // ↓ xyz.erupt必须有
@EntityScan({"xyz.erupt", "com.ma.admin"})    // ↓ 如果包名com.example.demo有变化
@EruptScan({"xyz.erupt", "com.ma.admin"})     // → 要修改为变化后的包名
public class AdminApplication extends SpringBootServletInitializer {

    public static void main(String[] args)  {
        SpringApplication.run(AdminApplication.class, args);
    }

    //打WAR包的配置
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(AdminApplication.class);
    }

}
