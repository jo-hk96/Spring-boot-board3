package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.board.domain.BoardDTO;
import com.board.mapper.BoardMapper;
import com.board.menus.domain.MenuDTO;
import com.board.menus.mapper.MenuMapper;

import jakarta.servlet.http.HttpSession;


@Controller
public class boardController {

	@Autowired
	private BoardMapper boardMapper;
	@Autowired
	private MenuMapper menuMapper;
	//게시판 메뉴 목록
	@RequestMapping("Board/Blist")
	public ModelAndView list(MenuDTO menuDTO){
		ModelAndView  mv  = new ModelAndView();
		//메뉴 리스트
		List<MenuDTO>  menuList  =  menuMapper.getMenuList();
		// 게시물 목록처리
		List<BoardDTO> boardList =  boardMapper.getBoardList( menuDTO ); 
		// System.out.println( boardList );
		menuDTO  =  menuMapper.getMenu( menuDTO );
		mv.addObject("menuList",  menuList);		
		//mv.addObject("menu_id",   menu_id );		
		mv.addObject("menuDTO",   menuDTO );		
		mv.addObject("boardList", boardList );
		mv.setViewName( "board/list" );
		return mv;
		
	}
	
	
		@RequestMapping("/Board/WriteForm")
		public ModelAndView writeForm(MenuDTO menuDTO , HttpSession session) {
			ModelAndView mv = new ModelAndView();
			String login_id = (String) session.getAttribute("login_id");
			
			
			
			//메뉴 목록을 조회
			
			if(login_id != null) { //로그인했을경우 정보 담기
			mv.addObject("login_id",login_id);
			List<MenuDTO> menuList = menuMapper.getMenuList();
			menuDTO = menuMapper.getMenu(menuDTO);
			mv.addObject("menuList", menuList);
			mv.addObject("menuDTO",menuDTO);			
			}
			mv.setViewName("board/write");
			
			return mv;
		}
		
		
		
		//게시글 쓰기
		@RequestMapping("/Board/Write")
		public ModelAndView write(BoardDTO boardDTO , HttpSession session) {
			String login_id = (String) session.getAttribute("login_id");
			
			ModelAndView mv = new ModelAndView();	
			
			
			if(login_id != null) {
			
			boardDTO.setWriter(login_id);
			boardMapper.insertBoard(boardDTO);
			String menu_id = boardDTO.getMenu_id();
			mv.addObject("login_id" ,login_id);
			mv.setViewName("redirect:/Board/Blist?menu_id=" + menu_id + "&login_id=" + login_id);
			}else {
				mv.setViewName("redirect:/");
			}	
			return mv;
			
		}
		
		
		//게시글 보기
		@RequestMapping("/Board/View")
		public ModelAndView View(BoardDTO boardDTO) {
			ModelAndView mv = new ModelAndView();
			//idx에 해당하는 글 번호 조회수 1증가
			boardMapper.incHit(boardDTO);
			
			//menu_id로 메뉴 조회
			String menu_id = boardDTO.getMenu_id();
			MenuDTO menuDTO = new MenuDTO(menu_id ,null,0);
			menuDTO = menuMapper.getMenu(menuDTO);
			
			
			
			int idx = boardDTO.getIdx();
			BoardDTO boardview = boardMapper.getBoard(idx);
			mv.addObject("boardview", boardview);
			mv.addObject("menuDTO", menuDTO);
			mv.setViewName("board/view");
			return mv;
			
			
		}
	
		//Board/delete?idx=${boardview.idx}&menu_id=${menuDTO.menu_id}
		@RequestMapping("/Board/delete")
		public ModelAndView delete(BoardDTO boardDTO) {
			String menu_id = boardDTO.getMenu_id(); //DTO 메뉴아이디 들고옴
			boardMapper.delete(boardDTO.getIdx());
			
			
			//삭제 후 이동
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/Board/Blist?menu_id=" + menu_id);
			return mv;
		}
		
		@RequestMapping("/Board/UpdateForm")
		public ModelAndView updateForm(BoardDTO boardDTO) {
		
			//메뉴목록
			List<MenuDTO> menuList = menuMapper.getMenuList();

			
			//메뉴이름 조회
			String menu_id = boardDTO.getMenu_id();
			MenuDTO menuDTO = new MenuDTO(menu_id ,null , 0);
			menuDTO = menuMapper.getMenu(menuDTO);
			
			
			//수정할 게시글 정보를 idx로 조회
			//boardDTO의 getIdx()하나만 넘겨주기
			BoardDTO board = boardMapper.getBoard(boardDTO.getIdx());
			
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("menuList",menuList);
			mv.addObject("menuDTO",menuDTO);
			mv.addObject("board",board);
			mv.setViewName("/board/update");
			
			return mv;
		}
		
		
		@RequestMapping("/Board/Update")
		public ModelAndView update(BoardDTO boardDTO) {
			
			
			//받은 정보를 수정
			boardMapper.boardUpdate(boardDTO);
			String menu_id = boardDTO.getMenu_id();
			
			//돌아가기
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/Board/Blist?menu_id=" + menu_id);
			return mv;
			
			
			
		}
		
		
		
		
		
	
}
