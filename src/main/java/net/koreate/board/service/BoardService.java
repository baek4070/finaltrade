package net.koreate.board.service;

import java.util.List;
import net.koreate.board.util.Criteria;
import net.koreate.board.util.PageMaker;
import net.koreate.board.vo.BoardCommentVO;
import net.koreate.board.vo.BoardVO;
import net.koreate.home.vo.BellVO;
import net.koreate.home.vo.WishVO;

public interface BoardService {

	public List<BoardVO> list(Criteria cri) throws Exception;
	
	public PageMaker getPageMaker(Criteria cri) throws Exception;
	
	public String register(BoardVO board) throws Exception;
	
	public BoardVO get(int bno) throws Exception;
	
	public String modify(BoardVO board) throws Exception;
	
	public String delete(int bno) throws Exception;
	
	// 찜 추가
	public String addWishlist(WishVO wish) throws Exception;
	
	// 찜 삭제
	public String removeWishlist(WishVO wish) throws Exception;
	
	// 조회수 증가
	public int updateViewCnt(int bno) throws Exception;
	
	// 댓글 리스트
	public List<BoardCommentVO> getCommentList(int bno) throws Exception;
	
	// 찜 리스트
	public WishVO getWish(WishVO wish) throws Exception;
	
	// 댓글 작성
	public String registerComment(BoardVO board) throws Exception;
	
	// 댓글 수정
	public String modifyComment(BoardCommentVO board) throws Exception;
		
	// 댓글 삭제
	public String removeComment(BoardCommentVO board) throws Exception;
	
	// 알람 등록
	public void addRing(BellVO addRing);
	
}
