package net.koreate.qnaboard.service;

import java.util.List;

import net.koreate.qnaboard.util.QnACriteria;
import net.koreate.qnaboard.util.QnAPageMaker;
import net.koreate.qnaboard.vo.QnABoardVO;

public interface QnABoardService {

	// QnA게시판 게시글 작성
	void regist(QnABoardVO vo) throws Exception;
	
	List<QnABoardVO> list(QnACriteria cri) throws Exception;
	
	QnABoardVO detail(int qno) throws Exception;
	
	public QnAPageMaker getPageMaker(QnACriteria cri) throws Exception;
	
	void update(QnABoardVO vo) throws Exception;
	
	void delete(int qno) throws Exception;
	
	void setRoot() throws Exception;
	
	void registerReply(QnABoardVO vo) throws Exception;
	
	void updateViewCnt(int qno) throws Exception;
}
