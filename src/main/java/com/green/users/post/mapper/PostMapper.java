package com.green.users.post.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.users.post.domain.PostVo;

@Mapper
public interface PostMapper {

	//List<PostVo> getPostList(PostVo postVo);

	List<PostVo> getPostList(PostVo postVo);

	//List<PostVo> getView();

	List<PostVo> getView(PostVo postVo);

	
}
