package com.green.bookmark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.bookmark.domain.UserBookVo;

@Mapper
public interface BookmarkMapper {

	int checkUBNO(UserBookVo userBookVo);

	List<UserBookVo> getUserBook(String user_id, int po_num);

	int checkUBNO(String user_id, int po_num);

	void insertUserbook(String user_id, int po_num);

	void deleteUserbook(String user_id, int po_num);
    
}