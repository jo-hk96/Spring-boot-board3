package com.board.tuser.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.tuser.domain.TuserDTO;


@Mapper
public interface TuserMapper {
	
	void insertUser(TuserDTO tuserDto);
	void deleteUser(String userid);
	
	
	
	List<TuserDTO> getTuserList();
	
}
