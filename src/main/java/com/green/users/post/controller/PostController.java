package com.green.users.post.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.company.domain.CompanyVo;
import com.green.company.mapper.CompanyMapper;
import com.green.users.apply.domain.ApplyVo;
import com.green.users.apply.mapper.ApplyMapper;
import com.green.users.domain.UserVo;
import com.green.users.post.domain.PostVo;
import com.green.users.post.mapper.PostMapper;
import com.green.users.resume.domain.ResumeVo;
import com.green.users.resume.mapper.ResumeMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Post")
public class PostController {

	@Autowired
	private PostMapper postMapper;
	@Autowired
	private CompanyMapper companyMapper;
	@Autowired
	private ResumeMapper resumeMapper;
	@Autowired
	private ApplyMapper applyMapper;
	
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
	public ModelAndView view( @RequestParam(value="po_num") int po_num, PostVo postVo ) {
		
		System.out.println( "==============postVo: " + postVo );
		
		List<PostVo> postList = postMapper.getView(postVo);
		System.out.println( "==============postList: " + postList );		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("postList", postList);
		mv.addObject("po_num", po_num);
		mv.setViewName("user/postView");
		return mv;
		
	}
	
	// postView.jsp 지원하기 클릭 시 이력서 선택화면 이동
	@RequestMapping("/GoApply")
	public ModelAndView goapply(
			HttpServletRequest request,
			ResumeVo resumeVo,
			PostVo postVo,
			ApplyVo applyVo,
			UserVo userVo,
			@RequestParam(value="com_id") String comId,
			@RequestParam(value="po_title") String poTitle,
			@RequestParam(value="po_num") int poNum
			) {
		
		System.out.println( "================================com_id: " + comId );
		System.out.println( "================================po_title: " + poTitle );
		System.out.println( "================================po_num: " + poNum );

		HttpSession session = request.getSession();
		
		UserVo sessionPUser = (UserVo) session.getAttribute("plogin");
	    if(sessionPUser == null) {
	        return new ModelAndView("redirect:/LoginForm");
	    }
	    
	    String  user_id    = resumeVo.getUser_id();
	    String  user_name  = resumeVo.getUser_name();
	    int     re_num     = resumeVo.getRe_num();
	    PostVo vo = companyMapper.getPost( postVo );
	    System.out.println( "==============vo: " + vo );
		
		List<ResumeVo> goresumeList = resumeMapper.getResumeList( sessionPUser );
		System.out.println( "==============goresumeList: " + goresumeList );
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("goresumeList", goresumeList);
		mv.addObject("user_id", user_id);
		//mv.addObject("user_name", user_name);
		mv.addObject("com_id", comId);
		mv.addObject("po_title", poTitle);
		mv.addObject("po_num", poNum);
		mv.addObject("vo", vo);
		mv.setViewName( "user/resumeChoice" );
		return mv;
		
	}
	
	// 이력서 선택화면 - 지원
	@RequestMapping("/Apply")
	public ModelAndView apply(
			HttpServletRequest request,
			ResumeVo resumeVo,
			PostVo postVo,
			ApplyVo applyVo,
			UserVo userVo,
			@RequestParam(value="po_num") int poNum
			) {
		
		System.out.println( "================================po_num: " + poNum );
		
		HttpSession session = request.getSession();
		
		UserVo sessionPUser = (UserVo) session.getAttribute("plogin");
	    if(sessionPUser == null) {
	        return new ModelAndView("redirect:/LoginForm");
	    }
	    System.out.println( "================================sessionPUser: " + sessionPUser );
	    System.out.println( "================================applyVo: " + applyVo );
	    
	    String  user_id    = resumeVo.getUser_id();
	    int     re_num     = resumeVo.getRe_num();
	    String  re_title   = resumeVo.getRe_title();
	    String  com_id     = postVo.getCom_id();
	    //int     po_num     = postVo.getPo_num();
	    String  po_title   = postVo.getPo_title();
	    int     result     = applyVo.getResult();
	    
	    postVo.setPo_num(poNum);
	    
	    //applyMapper.insertResumeApply( po_num, re_num, re_title, po_title, result );
	    applyMapper.insertResumeApply( applyVo );
	    
	    ModelAndView mv = new ModelAndView();
		mv.addObject("user_id", user_id);
		mv.addObject("applyVo", applyVo);
		mv.addObject("po_num", poNum);
		mv.addObject("re_num", re_num);
		mv.addObject("re_title", re_title);
		mv.addObject("po_title", po_title);
		mv.addObject("result", result);
		mv.setViewName( "redirect:/Post/View" );
		return mv;
	}
	
	
	
}











