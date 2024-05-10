package com.green.users.post.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView list( PostVo postVo ) {
		
        List<PostVo> postList = postMapper.getPostList(postVo);
        
        ModelAndView   mv  =  new ModelAndView();
        mv.addObject("postList", postList);
        mv.setViewName("user/postList");
        return mv;
        
	}
	
	// /Post/View?po_num=${ po_num }
	// 공고 자세히 보기
	@RequestMapping("/View")
	public ModelAndView view( @RequestParam(value="po_num") Long po_num, PostVo postVo ) {
		
		List<PostVo> postList = postMapper.getView(postVo);
		System.out.println( "==============postList: " + postList );
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("postList", postList);
		mv.setViewName("user/postView");
		return mv;
		
	}
	
	
}
