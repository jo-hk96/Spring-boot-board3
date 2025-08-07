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
	@RequestMapping("/Tuser/userdelete")
	public String userDelete(@RequestParam("userid") String userid) {
			
		tuserMapper.deleteUser(userid);
		return "redirect:/Tuser/Ulist";
		}
	
	
}
