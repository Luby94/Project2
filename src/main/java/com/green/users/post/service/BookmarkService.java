package com.green.users.post.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.green.users.post.mapper.BookmarkMapper;
import com.green.users.post.domain.UserBookVo;

@Service
public class BookmarkService {

    @Autowired
    private BookmarkMapper bookmarkMapper;

    public void addBookmark(String user_id, int po_num) {
        bookmarkMapper.addBookmark(user_id, po_num);
    }

    public void removeBookmark(String user_id, int po_num) {
        bookmarkMapper.removeBookmark(user_id, po_num);
    }
    
    public boolean checkScrapStatus(String user_id, int po_num) {
        return bookmarkMapper.checkScrapStatus(user_id, po_num);
    }
    
    /*
    public boolean checkScrapStatus(String user_id, int po_num) {
		
		return true;
	}
	*/

}