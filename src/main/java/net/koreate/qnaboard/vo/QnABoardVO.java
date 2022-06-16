package net.koreate.qnaboard.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QnABoardVO {

	private int qno;
	private int uno;
	private String userId;
	private String title;
	private String content;
	private String userNickname;
	private String deleted;
	private Date regdate;
	private Date updatedate;
	private int viewcnt;
	private String filename;
	private String filepath;
	private int root;
	private int depth;
	private int seq;
	
	private MultipartFile uploadFile;
}
