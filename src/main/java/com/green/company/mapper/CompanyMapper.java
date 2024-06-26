package com.green.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.company.domain.CompanyVo;
import com.green.users.post.domain.PostVo;

@Mapper
public interface CompanyMapper {

	PostVo getPost(PostVo postVo);

	CompanyVo LgetCom(CompanyVo companyVo);

	CompanyVo LgetCompany(CompanyVo companyVo);

	CompanyVo LgetComView(CompanyVo companyVo);

	CompanyVo Pgeteditcompany(CompanyVo companyVo);

	void PupdateCInfo(CompanyVo companyVo);

	void PCInfoDelete(CompanyVo companyVo);

	List<CompanyVo> KgetCompanyInfoList(CompanyVo companyVo);

	Integer KgetRating(String user_id, String com_id, Integer rating);

	void KaddRating(String com_id, String user_id, int rating);

	void KupdateRating(String com_id, String user_id, int rating);


}
