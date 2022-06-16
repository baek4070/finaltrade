package net.koreate.board.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BoardCommentVO {
	private int bno;
	private int rno;
	private String content;
	private String writer;
	private String writerId;
	private Date regdate;
}
