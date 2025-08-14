package com.board.paging.controller;

import java.util.Collections;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.BoardDTO;
import com.board.mapper.BoardMapper;
import com.board.menus.domain.MenuDTO;
import com.board.menus.mapper.MenuMapper;
import com.board.paging.domain.PageResponse;
import com.board.paging.domain.Pagination;
import com.board.paging.domain.SearchDTO;
import com.board.paging.mapper.BoardPagingMapper;

@Controller
public class BoardPagingController {
	@Autowired
	private MenuMapper menuMapper;
	@Autowired
	private BoardPagingMapper boardPagingMapper;
	
	@Autowired
	private BoardMapper boardMapper;
	
	//게시글 목록의 페이징
	@RequestMapping("/BoardPaging/Blist")
	public ModelAndView  list(int nowpage, MenuDTO menuDTO) {
		
		//메뉴목록조회
		List<MenuDTO> menuList = menuMapper.getMenuList();
		
		
		//게시글 목록조회
		//menu_id = MENU01
		//nowpage : 2
		// 11~20번까지 자료를 조회
		//해당 menu_id의 총자료수 구하기
		
		//메뉴의 해당하는 게시글수
		int count = boardPagingMapper.count(menuDTO); //menu_id
		
		
		System.out.println(count);
		
		PageResponse<BoardDTO> response = null;
		if(count < 1) { // menu_id의 자료가 없다면
			//생성자를 이용해서 초기화함
			//Collections.emptyList() : 자료가 없는 빈 리스트를 만들어서 채운다
			response = new PageResponse<>(Collections.emptyList(), null);	
		}
		//페이징을 위한 초기설정
		SearchDTO searchDTO = new SearchDTO();
		searchDTO.setPage(nowpage);
		searchDTO.setRecordSize(2); // 페이지당 10줄의 데이터
		searchDTO.setPageSize(10); // paging.jsp 출력할 페이지
		
		
		
		//Pagenation 설정
		Pagination pagination = new Pagination(count, searchDTO);
		searchDTO.setPagination(pagination);

		//-------------------------------------------------
		
		int offset     = searchDTO.getOffset(); 
		int recordSize = searchDTO.getRecordSize(); 
		String menu_id = menuDTO.getMenu_id();
		
		List<BoardDTO> list = boardPagingMapper.getBoardPagingList(
				menu_id ,offset, recordSize
				);
			System.out.println("0:" + list);
		response = new PageResponse<>(list, pagination);
		
		menuDTO = menuMapper.getMenu(menuDTO);		
		System.out.println(menuDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("response" , response);
		mv.addObject("menuList", menuList);
		mv.addObject("menuDTO",menuDTO);
		mv.addObject("menu_id",menu_id);
		mv.addObject("searchDTO",searchDTO);
		mv.addObject("nowpage",nowpage);
		mv.setViewName("boardPaging/list");
		return mv;
		
	}
	@RequestMapping("/BoardPaging/WriteForm")
	public ModelAndView writeForm(int nowpage ,String menu_id) {
		ModelAndView mv = new ModelAndView();
		List<MenuDTO> menuList = menuMapper.getMenuList();
		MenuDTO menuDTO = menuMapper.getMenuByName(menu_id);
		mv.setViewName("boardPaging/write");
		
		
		
		return mv;

	}
	
	@RequestMapping("/BoardPaging/Write")
	public ModelAndView write(int nowpage , BoardDTO boardDTO) {
		
		//넘어온 글 저장
		
		boardPagingMapper.insertBoard(boardDTO);
		
		ModelAndView mv = new ModelAndView();
		String fmt = "redirect:/boardPaging/list?menu_id=%s&nowpage=%d";
		String loc		= String.format(fmt, boardDTO.getMenu_id() ,nowpage );
		mv.setViewName(loc);
		return mv;
		
	}

	
	
	
}
