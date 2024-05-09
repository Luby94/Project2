package com.green.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.company.domain.CompanyVo;
import com.green.users.domain.UserVo;
import com.green.users.mapper.UserMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	@Autowired
	private UserMapper userMapper;

	//--------------------------------------------------------------------------------------------

	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	//--------------------------------------------------------------------------------------------
	// 개인
	
	// 개인-로그인 화면
	@RequestMapping("/PLoginForm")
	public ModelAndView ploginForm() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/plogin");
		
		return mv;
	}
	
	// 개인-로그인
	@RequestMapping("/PLogin")
	public ModelAndView plogin( HttpServletRequest request ) {
		
		String user_id  = request.getParameter("user_id");
		String user_pw  = request.getParameter("user_pw");
		
		UserVo UserVo      = userMapper.pLogin( user_id, user_pw );
		String loc          = "";
		HttpSession session = request.getSession();
		
		//아이디 암호가 일치하면
		if(UserVo !=null) {
			session.setAttribute("pLogin", UserVo);
					
			// 이건 이제 30분 후에 움직임이 없으면 자동 종료한다는 소리
			//session.setMaxInactiveInterval(30 *60);
					
			loc = "redirect:/";
			
		} else {
			loc = "user/plogin";
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName(loc);
		
		return mv;
		
	}
	
	// 개인-회원가입 화면
	@RequestMapping("/PWriteForm")
	public ModelAndView pwriteForm() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/pwrite");
		return mv;
		
	}
	
	// 개인-회원가입
	@RequestMapping("/PWrite")
	public ModelAndView pwrite( UserVo userVo ) {
		
		System.out.println( "userVo: " + userVo );
		
		userMapper.insertPUser( userVo );
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/plogin");
		return mv;
		
	}
	
	//--------------------------------------------------------------------------------------------
	// 기업
	
	// 기업-로그인 화면
	@RequestMapping("/CLoginForm")
	public ModelAndView cloginForm() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("company/clogin");
		
		return mv;
	}
	
	// 기업-로그인
	@RequestMapping("/CLogin")
	public ModelAndView clogin( HttpServletRequest request ) {
			
		String com_id  = request.getParameter("com_id");
		String com_pw  = request.getParameter("com_pw");
			
		CompanyVo companyVo = userMapper.cLogin( com_id, com_pw );
		String loc          = "";
		HttpSession session = request.getSession();
			
		//아이디 암호가 일치하면
		if(companyVo !=null) {
			session.setAttribute("cLogin", companyVo);
						
			// 이건 이제 30분 후에 움직임이 없으면 자동 종료한다는 소리
			//session.setMaxInactiveInterval(30 *60);
						
			loc = "redirect:/";
				
		} else {
			loc = "company/clogin";
		}
			
		ModelAndView mv = new ModelAndView();
		mv.setViewName(loc);
			
		return mv;
			
	}
	
	// 기업-회원가입 화면
	@RequestMapping("/CWriteForm")
	public ModelAndView cwriteForm() {
			
		ModelAndView mv = new ModelAndView();
		mv.setViewName("company/cwrite");
		return mv;
		
	}
		
	// 기업-회원가입
	@RequestMapping("/CWrite")
	public ModelAndView cwrite( CompanyVo companyVo ) {
			
		System.out.println( "companyVo: " + companyVo );
			
		userMapper.insertCUser( companyVo );
			
		ModelAndView mv = new ModelAndView();
		mv.setViewName("company/clogin");
		return mv;
			
	}

	
	
}










