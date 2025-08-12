package com.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.domain.BoardDTO;
import com.board.menus.domain.MenuDTO;

@Mapper
public interface BoardMapper {
	
	//보드 리스트
	List<BoardDTO> getBoardList(MenuDTO menuDTO);
	
	
	//글번호불러오기
	BoardDTO getBoard(int idx);
		
	//게시글 작성
	void insertBoard(BoardDTO boardDTO);

	//조회수 증가
	void incHit(BoardDTO boardDTO);

	//보드삭제
	void delete(int idx);

	//게시글수정
	void boardUpdate(BoardDTO boardDTO);

}
