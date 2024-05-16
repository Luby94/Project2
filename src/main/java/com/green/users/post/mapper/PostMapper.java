package com.green.users.post.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.company.domain.CompanyVo;
import com.green.users.domain.UserVo;
import com.green.users.post.domain.PostVo;

@Mapper
public interface PostMapper {

	List<PostVo> getPostList(PostVo postVo);
	List<PostVo> getPostList(PostVo postVo, CompanyVo companyVo);

	List<PostVo> getView(PostVo postVo);
	List<PostVo> getView(PostVo postVo, CompanyVo companyVo, int po_num);
	
	List<PostVo> getResumePostList(UserVo sessionPUser);
	
	List<PostVo> LmainPostList();

	List<PostVo> LuserMainPostList();

	void LinsertComPost(PostVo postVo);

	List<PostVo> LComPostList(PostVo postVo);

	void LPostDelete(PostVo postVo);

	PostVo LgetPost(PostVo postVo);

	void LPostUpdate(PostVo postVo);

	PostVo Lgetskill(PostVo postVo);

	List<PostVo> getpostbookList(PostVo postVo, String user_id);
	List<PostVo> getpostbookList(PostVo postVo, String user_id, CompanyVo companyVo);

	
}
