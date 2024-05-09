package com.green.users.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Users")
public class UserController {

	
	@RequestMapping("/Info")
	public  ModelAndView  Info( ) {
		ModelAndView   mv  =  new ModelAndView();
		mv.setViewName("user/info");
		return         mv;
	}
}
