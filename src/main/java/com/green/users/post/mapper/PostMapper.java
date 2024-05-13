package com.green.users.post.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.users.domain.UserVo;
import com.green.users.post.domain.PostVo;
import com.green.users.post.domain.UserBookVo;

@Mapper
public interface PostMapper {

	List<PostVo> getPostList(PostVo postVo);

	List<PostVo> getView(PostVo postVo);
	
	List<PostVo> getResumePostList(UserVo sessionPUser);

	//List<UserBookVo> getView(UserBookVo userBookVo);

	
}
