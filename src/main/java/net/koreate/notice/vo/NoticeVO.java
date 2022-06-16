package net.koreate.notice.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeVO {

	private int nno;
	private String title;
	private String content;
	private String userNickname;
	private String deleted;
	private Date regdate;
	private Date updatedate;
	private int viewcnt;
	private String filename;
	private String filepath;
	
	private MultipartFile uploadFile;
}
