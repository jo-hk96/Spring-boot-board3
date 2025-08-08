package com.board.tuser.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.tuser.domain.TuserDTO;
import com.board.tuser.mapper.TuserMapper;

@Controller
public class TuserController {

	
	@Autowired
	private TuserMapper tuserMapper;

	@RequestMapping("/Tuser/Ulist")
	public String tuserlist(Model model) {
		List<TuserDTO> tuserList = tuserMapper.getTuserList();
		System.out.println(tuserList);
		model.addAttribute("tuserList", tuserList);
		return "tuser/ulist";
	}
	
	
	@RequestMapping("/Tuser/NewTuser")
	public String newTuser() {
		return "/tuser/tuserWrite";
	}
	
	@RequestMapping("/Tuser/TuserWrite")
	public String tuserWrite(TuserDTO tuserDTO) {
		tuserMapper.insertUser(tuserDTO);
		return "redirect:/Tuser/Ulist";
	}
	@RequestMapping("/Tuser/userDelete")
	public String userDelete(@RequestParam("userid") String userid) {
			
		tuserMapper.userdelete(userid);
		
		
		return "redirect:/Tuser/Ulist";
		}
	
	@RequestMapping("/Tuser/TuserUpdate")
	public String userUpdate(TuserDTO tuserDTO, Model model) {
		
		//id기준 한명의 회원정보 다 조회 user에 정보를 담아서 tuserUpdate파일에 들고감
		//${user.userid}등으로 화면에 출력가능
		TuserDTO user = tuserMapper.getUser(tuserDTO);
		model.addAttribute("user",user);	
		return "tuser/tuserUpdate"; //파일찾기 
		
	}
	@RequestMapping("/Tuser/update") //url 경로
	public String Update(TuserDTO tuserDTO) {
		
		tuserMapper.userUpdate(tuserDTO);
		
		return "redirect:/Tuser/Ulist"; //url경로
	}
}
