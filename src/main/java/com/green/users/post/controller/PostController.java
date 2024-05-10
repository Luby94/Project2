package com.green.users.post.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.users.post.domain.PostVo;
import com.green.users.post.mapper.PostMapper;

@Controller
@RequestMapping("/Post")
public class PostController {

	@Autowired
	private PostMapper postMapper;
	
	// 채용공고 목록 조회
	@RequestMapping("/List")
	public ModelAndView list() {
				
		PostVo postVo = new PostVo();
		
		List<PostVo> postList = postMapper.getPostList(postVo);
		System.out.println( "==============postList: " + postList );
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("postList", postList);
		mv.setViewName("company/postlist");
		return mv;
		
	}
	
	
}
