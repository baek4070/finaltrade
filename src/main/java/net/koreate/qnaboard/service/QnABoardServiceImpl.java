package net.koreate.qnaboard.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.qnaboard.dao.QnABoardDAO;
import net.koreate.qnaboard.util.QnACriteria;
import net.koreate.qnaboard.util.QnAPageMaker;
import net.koreate.qnaboard.vo.QnABoardVO;

@Service
public class QnABoardServiceImpl implements QnABoardService {

	@Inject
	QnABoardDAO dao;
	
	@Override
	public void regist(QnABoardVO vo) throws Exception {
		dao.regist(vo);
		System.out.println("QnA게시판 글쓰기 완료");
	}

	@Override
	public List<QnABoardVO> list(QnACriteria cri) throws Exception {
		
		return dao.list(cri);
	}

	@Override
	public QnABoardVO detail(int qno) throws Exception {
		
		return dao.detail(qno);
	}

	@Override
	public QnAPageMaker getPageMaker(QnACriteria cri) throws Exception {
			QnAPageMaker pageMaker = new QnAPageMaker();
			pageMaker.setCri(cri);
			pageMaker.setDisplayPageNum(5);
			int totalCount = dao.listCount(cri);
			pageMaker.setTotalCount(totalCount);
			return pageMaker;
	}

	@Override
	public void update(QnABoardVO vo) throws Exception {
		dao.update(vo);
		System.out.println("QnA게시판 글수정 완료");
	}

	@Override
	public void delete(int qno) throws Exception {
		dao.delete(qno);
		System.out.println("QnA게시판 글삭제 완료");
	}

	@Override
	public void setRoot() throws Exception {
		dao.setRoot();
	}

	@Override
	public void registerReply(QnABoardVO vo) throws Exception {
		dao.updateReply(vo);
		vo.setDepth(vo.getDepth()+1);
		vo.setSeq(vo.getSeq()+1);
		dao.registerReply(vo);
	}

	@Override
	public void updateViewCnt(int qno) throws Exception {
		dao.updateViewCnt(qno);
	}
	
	

}
