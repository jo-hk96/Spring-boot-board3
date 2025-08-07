package com.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
	
	@RequestMapping("/")
	public  String  home() {
		return "home"; //WEB-INF/views/ + home + .jsp
					 //src/main/webapp//WEB-INF/views/home.jsp
	}
	//http://localhost:8080/
	@RequestMapping("/test")
	@ResponseBody
	public String test() {
		return"<h2>hello world</h2>";
	}
}
