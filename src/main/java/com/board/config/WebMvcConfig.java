package com.board.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import com.board.interceptor.AuthInterceptor;


@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	
	@Autowired
	private AuthInterceptor authInterceptor;
	
	//로그인 필요한 주소를 등록한다
	// /board/** , /BoardPaging/**
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//authInterceptor를 동작시킬때 특정페이지를 대상으로한다
		// 모든 /** : http://localhost:8080 아래의 모든 페이지
		//제외 : "/css/**", "/img/**" , /js/**" 경로는 interceptor의 대상이 아님
		//addPathPatterns("/Board/**")
		// -> http://localhost:8080/Board/밑의 모든 파일
		
		
		//전체를 주석처리하면 로그인로직을 중지할 수 있다.
		registry.addInterceptor( authInterceptor).addPathPatterns("/Board**","/BoardPaging/**") // 로그인대상 모든페이지 :/** 
												 .excludePathPatterns("/css/**", "/img/**" ,"/js/**");
												//.addPathPatterns("/**") //모든 페이지 로그인
		
		WebMvcConfigurer.super.addInterceptors(registry);
	}
	
	
	
}
