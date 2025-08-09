package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.domain.BoardDTO;
import com.board.mapper.BoardMapper;


@Controller
public class boardController {

	@Autowired
	private BoardMapper boardMapper;
	
	@RequestMapping("/Board/Blist")
		public String list(Model model) {
		List<BoardDTO> boardlist = boardMapper.getBoardList();
		
		model.addAttribute("boardlist" , boardlist);
			return "/board/list";
		
			
			
	}
	
	
}
