package com.wangs.DataTransferAppBackend.config;


import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {


    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/api/**")
                .allowedOrigins("*") // 允许所有源，可以替换为特定的前端地址
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS");
    }
}
