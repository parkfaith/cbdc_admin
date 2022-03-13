package com.cbdc.admin;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter {

	@Override
    public void addInterceptors(InterceptorRegistry registry) {

        LoginIntercepter loginIntercepter = new LoginIntercepter();
        registry.addInterceptor(loginIntercepter)
        .addPathPatterns("/**")
		.excludePathPatterns("/")
		.excludePathPatterns("/css/**")
		.excludePathPatterns("/fonts/**")
		.excludePathPatterns("/img/**")
		.excludePathPatterns("/js/**")
		.excludePathPatterns("/login/**")
		.excludePathPatterns("/*.ico")
		.excludePathPatterns("/*.html");
    }
}
