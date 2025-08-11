package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.BoardDTO;
import com.board.mapper.BoardMapper;
import com.board.menus.domain.MenuDTO;
import com.board.menus.mapper.MenuMapper;


@Controller
public class boardController {

	@Autowired
	private BoardMapper boardMapper;
	@Autowired
	private MenuMapper menuMapper;
	
	
	//게시판 메뉴 목록
	@RequestMapping("Board/Blist")
	public ModelAndView list(MenuDTO menuDTO){
		//메뉴 리스트
		List<MenuDTO> menulist = menuMapper.getMenuList();
		
		
		//게시글 목록처리
		List<BoardDTO> boardlist = boardMapper.getBoardList(menuDTO);
		
		menuDTO = menuMapper.getMenu(menuDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("menulist", menulist);
		mv.addObject("menuDTO", menuDTO);
		mv.addObject("boardlist", boardlist);
		mv.setViewName("board/list");
		return mv;
		
	}
	
	
		@RequestMapping("/Board/WriteForm")
		public ModelAndView writeForm(MenuDTO menuDTO) {
			//메뉴 목록을 조회
			List<MenuDTO> menuList = menuMapper.getMenuList();
			
			menuDTO = menuMapper.getMenu(menuDTO);
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("menuList", menuList);
			mv.addObject("menuDTO",menuDTO);
			mv.setViewName("board/write");
			return mv;
		}
		
		@RequestMapping("/Board/Write")
		public ModelAndView write(BoardDTO boardDTO) {
			boardMapper.insertBoard(boardDTO);
			String menu_id = boardDTO.getMenu_id();
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/Board/Blist?menu_id=" + menu_id);
			return mv;
			
			
			
		}
	
	
	
	
}
