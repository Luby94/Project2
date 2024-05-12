package com.green.users.post.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.green.company.mapper.CompanyMapper;
import com.green.users.apply.mapper.ApplyMapper;
import com.green.users.domain.UserVo;
import com.green.users.post.domain.ResponseDto;
import com.green.users.post.domain.UserBookVo;
import com.green.users.post.mapper.BookmarkMapper;
import com.green.users.post.mapper.PostMapper;
import com.green.users.post.service.BookmarkService;
import com.green.users.resume.mapper.ResumeMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
public class BookmarkController {
	
    @Autowired
    private BookmarkService bookmarkService;

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

}
