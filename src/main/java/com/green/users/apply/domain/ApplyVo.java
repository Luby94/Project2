package com.green.users.apply.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ApplyVo {
	// apply 
	private int po_num;
	private int re_num;
	private String re_title;
	private String po_title;
	private int result;
	private String ap_date;
	private int ap_id;
	
	//  post 
	//	private Long po_num;
	private String com_id;
	//	private String po_title;
	private String skill;
	private String career;
	private String region;
	private String po_qual;
	private String po_content;
	private String po_image;
	
	// resume
	//private Long re_num;
	private String user_id;
	//	private String re_title;
	//	private String skill;
	//	private String career;
	//	private String region;
	private String user_edu;
	private String user_car;
	private String user_intro;
	private String user_img;
	
	private String com_name;

}
