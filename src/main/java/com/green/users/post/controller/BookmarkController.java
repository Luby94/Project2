package com.green.users.post.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.users.domain.UserVo;
import com.green.users.post.domain.PostVo;
import com.green.users.post.domain.UserBookVo;
import com.green.users.post.mapper.BookmarkMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Bookmark")
public class BookmarkController {
	
    @Autowired
    private BookmarkMapper bookmarkMapper;
    
    @RequestMapping("/CheckBoolean")
    public ModelAndView checkBoolean( HttpServletRequest request, UserVo userVo, PostVo postVo, UserBookVo userBookVo ) {
    	
    	/*
    	HttpSession session = request.getSession();
		
		UserVo sessionPUser = (UserVo) session.getAttribute("plogin");
	    if(sessionPUser == null) {
	        return new ModelAndView("redirect:/LoginForm");
	    }
	    */
    	
    	int checkBoolean = bookmarkMapper.checkUBNO( userBookVo );
    	log.info("=========================================================");
    	log.info("checkBoolean : {}", checkBoolean);
    	log.info("=========================================================");
    	
    	ModelAndView mv = new ModelAndView();
    	mv.addObject("checkBoolean", checkBoolean);
    	mv.setViewName("user/postView");
    	return mv;
    	
    }
    
    @RequestMapping("/AddBoolean")
    public ModelAndView addBoolean( HttpServletRequest request, UserVo userVo, PostVo postVo, UserBookVo userBookVo ) {
    	
    	/*
    	HttpSession session = request.getSession();
		
		UserVo sessionPUser = (UserVo) session.getAttribute("plogin");
	    if(sessionPUser == null) {
	        return new ModelAndView("redirect:/LoginForm");
	    }
	    */
	    
    	bookmarkMapper.addBoolean( userBookVo );
    	    	
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("redirect:/Bookmark/CheckBoolean");
    	return mv;
    	
    }
    
    @RequestMapping("/RemoveBoolean")
    public ModelAndView removeBoolean( HttpServletRequest request, UserVo userVo, PostVo postVo, UserBookVo userBookVo ) {
    	
    	/*
    	HttpSession session = request.getSession();
		
		UserVo sessionPUser = (UserVo) session.getAttribute("plogin");
	    if(sessionPUser == null) {
	        return new ModelAndView("redirect:/LoginForm");
	    }
	    */
	    
    	bookmarkMapper.canclBoolean( userBookVo );
    	    	
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("redirect:/Bookmark/CheckBoolean");
    	return mv;
    	
    }
    

    /*
    @PostMapping("/api/bookmark/add")
    public ResponseEntity<String> addBookmark(@RequestParam("user_id") String user_id, @RequestParam("po_num") int po_num) {
        bookmarkService.addBookmark(user_id, po_num);
        return ResponseEntity.ok("Bookmark added successfully");
    }

    @PostMapping("/api/bookmark/remove")
    public ResponseEntity<String> removeBookmark(@RequestParam("user_id") String user_id, @RequestParam("po_num") int po_num) {
        bookmarkService.removeBookmark(user_id, po_num);
        return ResponseEntity.ok("Bookmark removed successfully");
    }
    
    @GetMapping("/api/bookmark/checkScrapStatus")
    public String checkScrapStatus(@RequestParam(value="user_id") String user_id, @RequestParam(value="po_num") int po_num) {
        boolean isScrapped = bookmarkService.checkScrapStatus(user_id, po_num);
        if (isScrapped) {
            return "해당 공고가 스크랩되었습니다.";
        } else {
            return "해당 공고가 스크랩되지 않았습니다.";
        }
        
    }
    */

}
