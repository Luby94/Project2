package com.green.users.post.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.users.post.domain.PostVo;

@Mapper
public interface PostMapper {

	//Map<String, Object> getPostList(PostVo postVo);

	List<PostVo> getPostList(PostVo postVo);

	
}
