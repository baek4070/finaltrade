package net.koreate.home.service;

import java.util.List;

import net.koreate.board.vo.BoardVO;
import net.koreate.home.util.MessageCriteria;
import net.koreate.home.util.MessagePageMaker;
import net.koreate.home.vo.BellVO;
import net.koreate.home.vo.MessageVO;
import net.koreate.home.vo.WishVO;
import net.koreate.notice.vo.NoticeVO;
import net.koreate.qnaboard.vo.QnABoardVO;

public interface HomeService {

	public List<QnABoardVO> qlist() throws Exception;

	public List<BoardVO> boardBuyListSearch(BoardVO bvo) throws Exception;
	
	public List<BoardVO> boardSellListSearch(BoardVO tradeType) throws Exception;

	public List<QnABoardVO> qlistSearch(QnABoardVO qvo) throws Exception;

	public List<BoardVO> wish(WishVO wish) throws Exception;

	public List<BellVO> bellList(int uno) throws Exception;

	public void updateCheckBoard(BellVO bell) throws Exception;

	public void updateCheckMessage(BellVO bell) throws Exception;

	public MessageVO getMessage(MessageVO message) throws Exception;

	public List<MessageVO> messageList(MessageCriteria cri) throws Exception;

	public MessageVO messageDetail(int mno) throws Exception;

	public void updateMessageCheck(int mno) throws Exception;

	public boolean insertMessage(MessageVO vo) throws Exception;

	public MessageVO getMessageRecent() throws Exception;

	public void insertBell(BellVO bell) throws Exception;

	public MessagePageMaker getPageMaker(MessageCriteria cri) throws Exception;
	
	public MessagePageMaker getNonCheckedPageMaker(MessageCriteria cri) throws Exception;

	public MessagePageMaker getCheckedPageMaker(MessageCriteria cri) throws Exception;

	public List<MessageVO> messageNonCheckedList(MessageCriteria cri) throws Exception;
	
	public List<MessageVO> messageCheckedList(MessageCriteria cri) throws Exception;

	public List<NoticeVO> nlist() throws Exception;

	public int getUno(int bno) throws Exception;



	


	
}
