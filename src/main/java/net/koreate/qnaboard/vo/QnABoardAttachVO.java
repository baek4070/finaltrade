package net.koreate.qnaboard.vo;

import lombok.Data;

@Data
public class QnABoardAttachVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private int bno;
}
