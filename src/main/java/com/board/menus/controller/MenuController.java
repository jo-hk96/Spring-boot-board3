package com.board.menus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.menus.domain.MenuDTO;
import com.board.menus.mapper.MenuMapper;

@Controller
public class MenuController {
	
	@Autowired
	private MenuMapper menuMapper;

	@RequestMapping("/Menus/List")
	public String list(Model model) {
		List<MenuDTO> menuList = menuMapper.getMenuList();
		System.out.println(menuList);
		//                 key(jstl)    value
		model.addAttribute("menuList", menuList);
		return "menus/list";
	}
	
	@RequestMapping("/Menus/WriteForm")
	public String writeForm() {
		return"menus/write";
		
	}
	
	@RequestMapping("/Menus/Write")
	public String write(MenuDTO menuDTO , Model model) {
		menuMapper.insertMenu(menuDTO);
		/*
			List<MenuDTO> menuList = menuMapper.getMenuList(); 
			model.addAttribute("menuList", menuList); // menuList 조회
		*/
		return "redirect:/Menus/List";
	}
	
	@RequestMapping("/Menus/WriteForm2")
	public String writeForm2() {
	
		
		return"menus/write2";	
	}
		
	@RequestMapping("/Menus/write2")
	public String write2(MenuDTO menuDTO) {
		// menu_name 메뉴이름만넘어옴 
		System.out.println(menuDTO);
		
		//메뉴추가
		menuMapper.insertMenu2(menuDTO);
		
		return "redirect:/Menus/List";
	}
	
	
	//http://localhost:8080/Menus/Delete?menu_id=menu05
	@RequestMapping("Menus/Delete")
	public String Delete(@RequestParam("menu_id") String menu_id) {
		
	menuMapper.delete(menu_id); //delete실행
		
	return "redirect:/Menus/List";
	}
	@RequestMapping("Menus/UpdateForm")
	public String UpdateForm(MenuDTO menuDTO , Model model){	
		
		
		
		//넘어온 정보(?menu_id=MENU08)로 수정할 정보를 조회
		MenuDTO menu = menuMapper.getMenu(menuDTO);
		
		
		
		//조회한 정보를 update.jsp 에 넘긴다
		//menu 객체를 menu라는 이름으로 model에 저장
		model.addAttribute("menu" , menu);
		
		return "menus/update";
		
	}
	
	
	@PostMapping("Menus/Update")
	public String Update(MenuDTO menuDTO) {
		
		menuMapper.updateMenu(menuDTO); //Update 실행 
		
		
		return "redirect:/Menus/List"; 
	}
	
	
	
}
	

