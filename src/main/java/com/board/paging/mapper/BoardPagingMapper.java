package com.board.paging.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.domain.BoardDTO;
import com.board.menus.domain.MenuDTO;

@Mapper
public interface BoardPagingMapper {
	
	int count(MenuDTO menuDTO);

	List<BoardDTO> getBoardPagingList(String menu_id, int offset, int recordSize);
	
	List<BoardDTO> getBoardList(MenuDTO menuDTO);
	
	void insertBoard(BoardDTO boardDTO);

	BoardDTO getBoardById(int idx);
	
	void delete(int idx);
	
	void update(BoardDTO boardDTO);
}
