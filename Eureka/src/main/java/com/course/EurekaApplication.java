package com.course;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;
import org.springframework.core.env.Environment;

@SpringBootApplication
@EnableEurekaServer
public class EurekaApplication {
    private static final Logger log = LoggerFactory.getLogger(EurekaApplication.class);
//    public static void main(String[] args) {
//        SpringApplication.run(EurekaApplication.class, args);
//    }

    public static void main(String[] args) {
        SpringApplication app = new SpringApplication(EurekaApplication.class);
        Environment environment = app.run(args).getEnvironment();
        log.info("启动成功！！");
        log.info("Eureka地址：\thttp://127.0.0.1:{}",environment.getProperty("server.port"));

    }
}
