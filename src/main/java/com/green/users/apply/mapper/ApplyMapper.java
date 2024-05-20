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

	List<ApplyVo> getApplyList(ApplyVo applyVo);

	void insertResumeApply(ApplyVo applyVo);
	
	//----------------------------------------------------
	
	void KinsertPostApply(ApplyVo applyVo);
	
	
}
