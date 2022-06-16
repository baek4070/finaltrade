package net.koreate.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.notice.dao.NoticeDAO;
import net.koreate.notice.util.NoticeCriteria;
import net.koreate.notice.util.NoticePageMaker;
import net.koreate.notice.vo.NoticeVO;
import net.koreate.qnaboard.util.QnAPageMaker;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	NoticeDAO dao;
	
	@Override
	public void regist(NoticeVO vo) throws Exception {
		dao.regist(vo);
	}

	@Override
	public List<NoticeVO> list(NoticeCriteria cri) throws Exception {
		return dao.list(cri);
	}

	@Override
	public NoticeVO detail(int nno) throws Exception {
		return dao.detail(nno);
	}

	@Override
	public NoticePageMaker getPageMaker(NoticeCriteria cri) throws Exception {
		NoticePageMaker pageMaker = new NoticePageMaker();
		pageMaker.setCri(cri);
		pageMaker.setDisplayPageNum(5);
		int totalCount = dao.listCount(cri);
		pageMaker.setTotalCount(totalCount);
		return pageMaker;
	}

	@Override
	public void update(NoticeVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void delete(int nno) throws Exception {
		dao.delete(nno);
	}


	@Override
	public void updateViewCnt(int nno) throws Exception {
		dao.updateViewCnt(nno);
	}

}
