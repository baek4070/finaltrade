package net.koreate.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.board.vo.BoardVO;
import net.koreate.home.dao.HomeDAO;
import net.koreate.home.util.MessageCriteria;
import net.koreate.home.util.MessagePageMaker;
import net.koreate.home.vo.BellVO;
import net.koreate.home.vo.MessageVO;
import net.koreate.home.vo.WishVO;
import net.koreate.notice.vo.NoticeVO;
import net.koreate.qnaboard.vo.QnABoardVO;

@Service
public class HomeServiceImpl implements HomeService {
	
	@Inject
	HomeDAO dao;

	@Override
	public List<QnABoardVO> qlist() throws Exception {
		List<QnABoardVO> qlist = dao.QnaList();
		return qlist;
	}

	@Override
	public List<BoardVO> boardBuyListSearch(BoardVO tradeType) throws Exception{
		List<BoardVO> blist = dao.BoardBuyListSearch(tradeType);
		return blist;
	}
	

	@Override
	public List<BoardVO> boardSellListSearch(BoardVO tradeType) throws Exception {
		List<BoardVO> blist = dao.BoardSellListSearch(tradeType);
		return blist;
	}

	@Override
	public List<QnABoardVO> qlistSearch(QnABoardVO qvo) throws Exception{
		List<QnABoardVO> qlist = dao.QnAListSearch(qvo);
		return qlist;
	}

	@Override
	public List<BoardVO> wish(WishVO wish) throws Exception {
		List<BoardVO> wishGet = dao.wish(wish);
		return wishGet;
	}

	@Override
	public List<BellVO> bellList(int uno) throws Exception {
		List<BellVO> bellList = dao.bellList(uno);
		return bellList;
	}

	@Override
	public void updateCheckBoard(BellVO bell) throws Exception {
		dao.updateCheckBoard(bell);
	}

	@Override
	public void updateCheckMessage(BellVO bell) throws Exception {
		dao.updateCheckMessage(bell);
	}

	@Override
	public MessageVO getMessage(MessageVO message) throws Exception {
		MessageVO mg = dao.getMessage(message);
		return mg;
	}

	@Override
	public List<MessageVO> messageList(MessageCriteria cri) throws Exception {
		List<MessageVO> msgList = dao.messageList(cri);
		return msgList;
	}

	@Override
	public MessageVO messageDetail(int mno) throws Exception {
		MessageVO msg = dao.messageDetail(mno);
		return msg;
	}

	@Override
	public void updateMessageCheck(int mno) throws Exception {
		dao.updateMessageCheck(mno);
	}

	@Override
	public boolean insertMessage(MessageVO vo) throws Exception {
		boolean tf = dao.insertMessage(vo);
		return tf;
	}

	@Override
	public MessageVO getMessageRecent() throws Exception {
		MessageVO recent = dao.getMessageRecent();
		return recent;
	}

	@Override
	public void insertBell(BellVO bell) throws Exception {
		dao.insertBell(bell);
	}

	@Override
	public MessagePageMaker getPageMaker(MessageCriteria cri) throws Exception {
		int totalCount = dao.listCount(cri);
		MessagePageMaker pageMaker = new MessagePageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		System.out.println(pageMaker);
		return pageMaker;
	}

	@Override
	public MessagePageMaker getNonCheckedPageMaker(MessageCriteria cri) throws Exception {
		int totalCount = dao.listCountNon(cri);
		MessagePageMaker pageMaker = new MessagePageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		System.out.println(pageMaker);
		return pageMaker;
	}

	@Override
	public MessagePageMaker getCheckedPageMaker(MessageCriteria cri) throws Exception {
		int totalCount = dao.listCountChecked(cri);
		MessagePageMaker pageMaker = new MessagePageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		System.out.println(pageMaker);
		return pageMaker;
	}

	@Override
	public List<MessageVO> messageNonCheckedList(MessageCriteria cri) throws Exception {
		List<MessageVO> msgList = dao.NonCheckedmessageList(cri);
		return msgList;
	}

	@Override
	public List<MessageVO> messageCheckedList(MessageCriteria cri) throws Exception {
		List<MessageVO> msgList = dao.CheckedmessageList(cri);
		return msgList;
	}

	@Override
	public List<NoticeVO> nlist() throws Exception {
		List<NoticeVO> ntList = dao.nlist();
		return ntList;
	}

	@Override
	public int getUno(int bno) throws Exception {
		int uno = dao.getUno(bno);
		return uno;
	}



	/*
	 * @Override public List<BoardVO> blist() throws Exception { List<BoardVO> blist
	 * = dao.BoardList(); return blist; }
	 */

}
