package com.green.skill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.green.users.post.domain.PostVo;
import com.green.users.post.mapper.PostMapper;

@RestController
@RequestMapping("/Filter")
public class SkillController {
	@Autowired
	private PostMapper postMapper;
	@PostMapping("/GetSkill")
	public PostVo getskill(@RequestBody PostVo postVo) { // 수정된 부분
		System.out.println(postVo);
		PostVo skill = postMapper.Lgetskill(postVo);
		return skill;
	}
}
