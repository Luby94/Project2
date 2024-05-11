package com.green.users.apply.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.users.apply.domain.ApplyVo;
import com.green.users.domain.UserVo;
import com.green.users.post.domain.PostVo;
import com.green.users.resume.domain.ResumeVo;

@Mapper
public interface ApplyMapper {

	UserVo getInfo(String user_id);

	//	List<HashMap<String, Object>> getApplyList(UserVo userVo, ApplyVo applyVo);
	List<ApplyVo> getApplyList(ApplyVo applyVo);

	// PostController(/Post/Apply)
	//void insertResumeApply(ResumeVo resumeVo);
	//void insertResumeApply(ResumeVo resumeVo, PostVo postVo);
	void insertResumeApply(ApplyVo applyVo);
	//void insertResumeApply(Long po_num, int re_num, String re_title, String po_title, int result);
	
}
