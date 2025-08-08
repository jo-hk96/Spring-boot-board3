package com.board.tuser.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.tuser.domain.TuserDTO;


@Mapper
public interface TuserMapper {
	//회원조회리스트
	List<TuserDTO> getTuserList();
	
	//회원추가
	void insertUser(TuserDTO tuserDto);
	
	//회원삭제
	void userdelete(String userid);
	
	//회원수정
	void userUpdate(TuserDTO tuserDTO);
	
	
	//한명의 유저 DTO형식조회 
	TuserDTO getUser(TuserDTO tuserDTO);
}
