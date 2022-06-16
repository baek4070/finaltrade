package net.koreate.notice.service;

import java.util.List;

import net.koreate.notice.util.NoticeCriteria;
import net.koreate.notice.util.NoticePageMaker;
import net.koreate.notice.vo.NoticeVO;


public interface NoticeService {

	void regist(NoticeVO vo) throws Exception;
	
	List<NoticeVO> list(NoticeCriteria cri) throws Exception;
	
	NoticeVO detail(int nno) throws Exception;
	
	public NoticePageMaker getPageMaker(NoticeCriteria cri) throws Exception;
	
	void update(NoticeVO vo) throws Exception;
	
	void delete(int nno) throws Exception;
	
	void updateViewCnt(int nno) throws Exception;
}
