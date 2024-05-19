package com.green.users.resume.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.users.domain.UserVo;
import com.green.users.resume.domain.ResumeVo;
import com.green.users.resume.mapper.ResumeMapper;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Resume")
public class ResumeController {
	
	@Autowired
	private ResumeMapper resumeMapper;

	@RequestMapping("/List")
	public ModelAndView resumelist( ResumeVo resumeVo, String com_id ) {
		
		List<ResumeVo> resumeList = resumeMapper.KmakeResumeList( resumeVo, com_id );
		log.info("==============Resume/List==================");
		log.info("resumeList : {}", resumeList);
		log.info("==============Resume/List==================");
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("resumeList", resumeList);
		mv.setViewName("company/resumeList");
		return mv;
		
	}
	
	@RequestMapping("/View")
	public ModelAndView view( 
			ResumeVo resumeVo,
			UserVo userVo,
			@RequestParam(value="com_id") String com_id,
			@RequestParam(value="re_num") int re_num
			) {
		
		List<ResumeVo> resumeViewList = resumeMapper.KmakeResumeView( re_num, userVo, resumeVo);
		log.info("==============Resume/View==================");
		log.info("resumeViewList : {}", resumeViewList);
		log.info("==============Resume/View==================");
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("resumeViewList", resumeViewList);
		mv.setViewName("company/resumeListGoView");
		return mv;
		
	}
	
	@GetMapping("/getRating")
	@ResponseBody
	public Integer getRating(
    		@RequestParam("user_id") String user_id,
    		@RequestParam("com_id") String com_id,
    		@RequestParam("rating") int rating
    		) {
		
		Integer getrating = resumeMapper.KgetRating(user_id, com_id, rating);
        
        return getrating != null ? rating : -1;
    }
	
	@PostMapping("/ratings/add")
	@ResponseBody
	public String addRating(
	    	@RequestParam("com_id") String com_id,
	    	@RequestParam("user_id") String user_id,
	    	@RequestParam("rating") int rating
	    	) {
			
		Integer ratings = resumeMapper.KgetRating(user_id, com_id, rating);
		log.info("========Company/ratings/add=========");
		log.info("ratings : {}", ratings);
		log.info("====================================");
		
		if (ratings != null) {
			resumeMapper.KupdateRating(com_id, user_id, rating);
	    } else {
	    	resumeMapper.KaddRating(com_id, user_id, rating);
	    }
			
		//companyMapper.KaddRating(com_id, user_id, rating);
			
	    return "Rating added successfully!";
	        
	}
	
}
