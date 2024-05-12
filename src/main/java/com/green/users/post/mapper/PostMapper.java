package com.green.users.post.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.users.domain.UserVo;
import com.green.users.post.domain.PostVo;
import com.green.users.post.domain.UserBookVo;

@Mapper
public interface PostMapper {

	//List<PostVo> getPostList(PostVo postVo);

	List<PostVo> getPostList(PostVo postVo);

	//List<PostVo> getView();

	List<PostVo> getView(PostVo postVo);
	
	List<PostVo> getResumePostList(UserVo sessionPUser);
	List<PostVo> getResumePostList();
	List<PostVo> getResumePostList(PostVo postVo);

	//----------------------------------------------------------
	
	void insertScrap(UserBookVo scrapvo);
	//void insertScrap(int po_num, String user_id);

	void deleteScrap(int po_num);

	int countScrap(String user_id, int po_num);


	
}
