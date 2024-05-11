package com.green.company.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.green.users.apply.domain.ApplyVo;
import com.green.users.post.domain.PostVo;

@Mapper
public interface CompanyMapper {

	// PostController(/GoApply)
	PostVo getPost(PostVo postVo);
	//ApplyVo getPost(ApplyVo applyVo);


}
