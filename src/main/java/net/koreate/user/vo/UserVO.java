package net.koreate.user.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class UserVO {

	private int uno;
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_birth;
	private String u_addr_post;
	private String u_addr;
	private String u_addr_detail;
	private String u_phone;
	private Date u_visit_date;
	private String u_withdraw;
	private String u_info;
	
	private List<AuthVO> authList;
}
