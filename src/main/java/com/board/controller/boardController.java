package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	//게시글목록
	@RequestMapping("/Board/Blist")
		public String list(Model model) {
		List<BoardDTO> boardlist = boardMapper.getBoardList();
		
		model.addAttribute("boardlist" , boardlist);
			return "/board/list";
	}
	
	//게시글삭제
	@RequestMapping("/Board/Delete")
		public String del(@RequestParam("idx")int idx) {
			boardMapper.Bdelete(idx);
			return "redirect:/Board/Blist";
		}
	
	
	
	//게시글 메뉴 선택
	@RequestMapping("/Board/BwriteForm")
	public String writeForm(Model model) {
	    // menusMapper를 사용해 메뉴 목록을 DB에서 가져옴
	    List<MenuDTO> menu = menuMapper.getMenuList(); 
	    model.addAttribute("menu", menu);
	    return "/board/bwrite";
	}
	
	
}
