package com.green.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.company.applyed.domain.ApplyedVo;
import com.green.company.applyed.mapper.ApplyedMapper;
import com.green.company.domain.CompanyVo;
import com.green.company.mapper.CompanyMapper;
import com.green.users.post.domain.PostVo;
import com.green.users.post.mapper.PostMapper;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Company")
public class CompanyController {
	@Autowired
	private PostMapper postMapper;
	@Autowired
	private CompanyMapper companyMapper;
	@Autowired
	private ApplyedMapper applyedMapper;

	@RequestMapping("/Chome")
	public ModelAndView uhome() {
		ModelAndView mv = new ModelAndView();
		List<PostVo> postList = postMapper.LuserMainPostList();
		mv.addObject("postList", postList);
		mv.setViewName("company/chome");
		return mv;
	}

	@RequestMapping("/CInfo")
	public ModelAndView cInfo(CompanyVo companyVo) {
		CompanyVo vo = companyMapper.LgetCom(companyVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("company/cinfo");
		return mv;
	}

	@RequestMapping("/PostForm")
	public ModelAndView PostsForm(PostVo postVo) {
		List<PostVo> postComList = postMapper.LComPostList(postVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("postList", postComList);
		mv.setViewName("company/postForm");
		return mv;
	}

	@RequestMapping("/PostMake")
	public ModelAndView SavePostForm(CompanyVo companyVo) {
		CompanyVo vo = companyMapper.LgetCompany(companyVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("company/postMake");
		return mv;
	}

	@RequestMapping("/SavePost")
	public ModelAndView PostMake(PostVo postVo) {
		postMapper.LinsertComPost(postVo);
		ModelAndView mv = new ModelAndView();
		String com_id = postVo.getCom_id();
		mv.setViewName("redirect:/Company/PostForm?com_id=" + com_id);
		return mv;
	}

	@RequestMapping("/PostDelete")
	public ModelAndView deleteResume(PostVo postVo) {
		postMapper.LPostDelete(postVo);
		ModelAndView mv = new ModelAndView();
		String com_id = postVo.getCom_id();
		mv.setViewName("redirect:/Company/PostForm?com_id=" + com_id);
		return mv;
	}

	@RequestMapping("/PostView")
	public ModelAndView PostView(PostVo postVo, CompanyVo companyVo) {
		CompanyVo uvo = companyMapper.LgetComView(companyVo);
		PostVo rvo = postMapper.LgetPost(postVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("uvo", uvo);
		mv.addObject("rvo", rvo);
		mv.setViewName("company/postView");
		return mv;
	}

	@RequestMapping("/SupportedList")
	public ModelAndView supportedList(ApplyedVo applyedVo) {
		List<ApplyedVo> applyedList = applyedMapper.getApplyedList(applyedVo);
		log.info("====================/Company/SupportedList======================");
		log.info("applyedList : {}", applyedList);
		log.info("================================================================");
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("applyedList", applyedList);
		mv.setViewName("company/supportedList");
		return mv;
	}

	@RequestMapping("/PostUpdate")
	public ModelAndView updateResume(PostVo postVo) {
		postMapper.LPostUpdate(postVo);
		ModelAndView mv = new ModelAndView();
		String user_id = postVo.getCom_id();
		mv.setViewName("redirect:/Company/PostForm?com_id=" + user_id);
		return mv;
	}

	@RequestMapping("/CInfoedit")
	public ModelAndView CInfoEdit(CompanyVo companyVo) {
		CompanyVo vo = companyMapper.Pgeteditcompany(companyVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("company/cinfoedit");
		return mv;

	}

	@RequestMapping("/CInfoUpdate")
	public ModelAndView PupdateCInfo(CompanyVo companyVo) {
		companyMapper.PupdateCInfo(companyVo);
		ModelAndView mv = new ModelAndView();
		String company_id = companyVo.getCom_id();
		mv.setViewName("redirect:/Company/CInfo?com_id=");
		return mv;
	}

	@RequestMapping("/CInfoDelete")
	public ModelAndView CInfoDelete(CompanyVo companyVo, HttpServletRequest request) {
		companyMapper.PCInfoDelete(companyVo);
		// 세션무효화
		request.getSession().invalidate();

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/");
		return mv;
	}
	
	//----------------------------------------------------------------------------------------------
	
	@GetMapping("/checkstatus")
	@ResponseBody
	public List<ApplyedVo> checkstatus(
			@RequestParam(value="user_id") String user_id,
			@RequestParam(value="re_num") int re_num,
			@RequestParam(value="result") int result,
			@RequestParam(value="com_id") String com_id,
			ApplyedVo applyedVo
			) {
		
		//List<UserBookVo> getCheckBook = bookmarkMapper.getUserBook(user_id, po_num);
		//List<ApplyedVo> applyedList = applyedMapper.getApplyedList(applyedVo);
		List<ApplyedVo> applyedList = applyedMapper.KgetCheckApplyedList(user_id, re_num, result, com_id, applyedVo);
		log.info("====================/Company/checkstatus======================");
    	log.info("applyedList : {}", applyedList);
    	log.info("==============================================================");
		
		return applyedList;
		
	}
	
	
	@PostMapping("/decision")
    @ResponseBody
    public List<ApplyedVo> resultUpdate(
    		@RequestParam("user_id") String user_id,
    		@RequestParam("re_num") int re_num,
            @RequestParam("result") int result,
            @RequestParam("com_id") String com_id,
            @RequestParam("po_num") int po_num,
            ApplyedVo applyedVo) {
		
        // 대기, 합격, 불합격 처리
		applyedMapper.KupdateStatus(re_num, result, po_num);
		
        return applyedMapper.KgetCheckApplyedList(user_id, re_num, result, com_id, applyedVo);
    }
	
	//----------------------------------------------------------------------------------------------
	
	@RequestMapping("/CompanyInfo")
	public ModelAndView companyinfo( CompanyVo companyVo ) {
		
		List<CompanyVo> companyinfoList = companyMapper.KgetCompanyInfoList( companyVo );		
		log.info("========Company/CompanyInfo=========");
		log.info("companyinfoList : {}", companyinfoList);
		log.info("====================================");
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("companyinfoList", companyinfoList);
		mv.setViewName("company/companyinfo");
		return mv;
		
	}
	
	@PostMapping("/ratings/add")
    @ResponseBody
    public String addRating(
    		@RequestParam("com_id") String com_id,
    		@RequestParam("user_id") String user_id,
    		@RequestParam("rating") int rating
    		) {
		companyMapper.addRating(com_id, user_id, rating);
        return "Rating added successfully!";
    }
	
	
}
