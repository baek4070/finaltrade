package net.koreate.home.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MessageVO {
	private int mno;
	private int uno;
	private int suno;
	private String title;
	private String sender;
	private String receiver;
	private String content;
	private String checked;
	private Date sendDate;
}
