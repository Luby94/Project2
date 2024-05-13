package com.green.users.post.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.company.mapper.CompanyMapper;
import com.green.users.apply.domain.ApplyVo;
import com.green.users.apply.mapper.ApplyMapper;
import com.green.users.domain.UserVo;
import com.green.users.post.domain.PostVo;
import com.green.users.post.domain.ResponseDto;
import com.green.users.post.domain.UserBookVo;
import com.green.users.post.mapper.BookmarkMapper;
import com.green.users.post.mapper.PostMapper;
import com.green.users.post.service.BookmarkService;
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
	@Autowired
	private BookmarkMapper bookmarkMapper;
	
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
	public ModelAndView view(
			@RequestParam(value="po_num") int po_num,
			PostVo postVo,
			UserBookVo userBookVo,
			HttpServletRequest request,
			@RequestParam(value="user_id") String user_id
			) {
				
		HttpSession session = request.getSession();
		
		List<PostVo> postList = postMapper.getView(postVo);
		System.out.println( "==============postList: " + postList );
		
		List<UserBookVo> getBookList = bookmarkMapper.getUserbook( userBookVo );
		System.out.println( "==============getBookList: " + getBookList );
		
		//UserVo userVo = new UserVo();
		//String user_id = userVo.getUser_id();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("postList", postList);
		mv.addObject("po_num", po_num);
		mv.addObject("user_id", user_id);
		mv.addObject("getBookList", getBookList);
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
	    
	    PostVo vo = companyMapper.getPost( postVo );
	    System.out.println( "==============vo: " + vo );
		
		List<ResumeVo> goresumeList = resumeMapper.getResumeList( sessionPUser );
		System.out.println( "==============goresumeList: " + goresumeList );
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("goresumeList", goresumeList);
		mv.addObject("user_id", user_id);
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
	    String  po_title   = postVo.getPo_title();
	    int     result     = applyVo.getResult();
	    
	    postVo.setPo_num(poNum);
	    
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
	



