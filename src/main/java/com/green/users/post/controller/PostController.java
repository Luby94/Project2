package com.green.users.post.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.company.domain.CompanyVo;
import com.green.company.mapper.CompanyMapper;
import com.green.users.apply.domain.ApplyVo;
import com.green.users.apply.mapper.ApplyMapper;
import com.green.users.domain.UserVo;
import com.green.users.post.domain.PostVo;
import com.green.users.post.domain.UserBookVo;
import com.green.users.post.mapper.BookmarkMapper;
import com.green.users.post.mapper.PostMapper;
import com.green.users.resume.domain.ResumeVo;
import com.green.users.resume.mapper.ResumeMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
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
	@RequestMapping("/Post/List")
	public ModelAndView list( PostVo postVo, CompanyVo companyVo ) {
				
        //List<PostVo> postList = postMapper.getPostList(postVo);
        List<PostVo> postList = postMapper.getPostList(postVo, companyVo);
        log.info("===============/Post/List===============");
    	log.info("postList : {}", postList);
    	log.info("========================================");
        
        ModelAndView   mv  =  new ModelAndView();
        mv.addObject("postList", postList);
        mv.setViewName("user/postList");
        return mv;
        
	}
	
	// /Post/View?po_num=${ po_num }
	// 공고 자세히 보기
	@RequestMapping("/Post/View")
	public ModelAndView view(
			@RequestParam(value="po_num") int po_num,
			PostVo postVo,
			UserBookVo userBookVo,
			CompanyVo companyVo,
			HttpServletRequest request,
			@RequestParam(value="user_id") String user_id
			) {
				
		HttpSession session = request.getSession();
		
		//List<PostVo> postList = postMapper.getView(postVo);
		List<PostVo> postList = postMapper.getView(postVo, companyVo, po_num);
		log.info("===============/Post/View===============");
    	log.info("postList : {}", postList);
    	log.info("========================================");
		
		List<UserBookVo> getBookList = bookmarkMapper.getUserBook(user_id, po_num);
		log.info("===============/Post/View===============");
    	log.info("getBookList : {}", getBookList);
    	log.info("========================================");
		
		//UserVo userVo = new UserVo();
		//String user_id = userVo.getUser_id();
    	String com_id = postVo.getCom_id();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("postList", postList);
		mv.addObject("po_num", po_num);
		mv.addObject("user_id", user_id);
		mv.addObject("com_id", com_id);
		mv.addObject("getBookList", getBookList);
		mv.setViewName("user/postListGoView2");
		return mv;
		
	}
	
	// postView.jsp 지원하기 클릭 시 이력서 선택화면 이동
	@RequestMapping("/Post/GoApply")
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
		
		log.info("===============(/Post/GoApply)===============");
		log.info("com_id : {}", comId);
		log.info("=============================================");
		log.info("===============(/Post/GoApply)===============");
		log.info("po_title : {}", poTitle);
		log.info("=============================================");
		log.info("===============(/Post/GoApply)===============");
		log.info("po_num : {}", poNum);
		log.info("=============================================");

		HttpSession session = request.getSession();
		
		UserVo sessionPUser = (UserVo) session.getAttribute("plogin");
	    if(sessionPUser == null) {
	        return new ModelAndView("redirect:/LoginForm");
	    }
	    
	    String  user_id    = resumeVo.getUser_id();
	    
	    PostVo vo = companyMapper.getPost( postVo );
	    log.info("===============(/Post/GoApply)===============");
		log.info("vo : {}", vo);
		log.info("=============================================");
		
		List<ResumeVo> goresumeList = resumeMapper.getResumeList( sessionPUser );
		log.info("===============(/Post/GoApply)===============");
		log.info("goresumeList : {}", goresumeList);
		log.info("=============================================");
		
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
	//@PostMapping("/Post/Apply")
	@RequestMapping(value = "/Post/Apply", method=RequestMethod.POST)
	public ModelAndView apply(
			HttpServletRequest request,
			ResumeVo resumeVo,
			PostVo postVo,
			ApplyVo applyVo,
			UserVo userVo,
			@RequestParam(value="po_num") int poNum
			) {
		
		log.info("===============(/Post/Apply)===============");
		log.info("po_num : {}", poNum);
		log.info("===========================================");
		
		HttpSession session = request.getSession();
		
		UserVo sessionPUser = (UserVo) session.getAttribute("plogin");
	    if(sessionPUser == null) {
	        return new ModelAndView("redirect:/LoginForm");
	    }
	    log.info("===============(/Post/Apply)===============");
		log.info("sessionPUser : {}", sessionPUser);
		log.info("===========================================");
	    
	    String  user_id    = resumeVo.getUser_id();
	    int     re_num     = resumeVo.getRe_num();
	    String  re_title   = resumeVo.getRe_title();
	    String  po_title   = postVo.getPo_title();
	    int     result     = applyVo.getResult();
	    
	    postVo.setPo_num(poNum);
		log.info("===============(/Post/Apply)===============");
		log.info("postVo : {}", postVo);
		log.info("===========================================");
		log.info("===============(/Post/Apply)===============");
		log.info("applyVo : {}", applyVo);
		log.info("===========================================");
	    
	    applyMapper.insertResumeApply( applyVo );
	    
	    ModelAndView mv = new ModelAndView();
		mv.addObject("user_id", user_id);
		mv.addObject("applyVo", applyVo);
		mv.addObject("po_num", poNum);
		mv.addObject("re_num", re_num);
		mv.addObject("re_title", re_title);
		mv.addObject("po_title", po_title);
		mv.addObject("result", result);
		mv.setViewName( "user/postSuccess" );
		return mv;
	}
	
	@GetMapping("/Post/Success")
    public ModelAndView success( String user_id ) {
		
		log.info("===============(/Post/Success)===============");
		log.info("user_id : {}", user_id);
		log.info("=============================================");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Post/List?user_id=" + user_id);
		
        return mv;
        
    }
	
}
	



