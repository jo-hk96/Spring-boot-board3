package com.board.paging.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.board.menus.domain.MenuDTO;

@Mapper
public interface BoardPagingMapper {

	
	int count(MenuDTO menuDTO);
	
	
	
}
