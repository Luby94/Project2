package com.green.users.resume.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.users.apply.domain.ApplyVo;
import com.green.users.domain.UserVo;
import com.green.users.resume.domain.ResumeVo;

@Mapper
public interface ResumeMapper {

	List<ResumeVo> LgetResumeList(ResumeVo resumeVo2);

	void LinsertResume(ResumeVo resumeVo);

	ResumeVo LgetResumes(ResumeVo resumeVo);

	void LResumeUpdate(ResumeVo resumeVo);

	// PostController(/Post/GoApply)
	List<ResumeVo> getResumeList(UserVo sessionPUser);
	//List<ApplyVo> getResumeList(UserVo sessionPUser);

}
