package net.koreate.board.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardVO {
	private int bno;
	private int uno;
	private String title;
	private String content;
	private String writer;
	private String writerId;
	private Date regdate;
	private Date updateDate;
	private String tradeType;
	private String category;
	private String fileName;
	private String filePath;
	private int viewcnt;
	private MultipartFile uploadFile;
}
