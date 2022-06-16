package net.koreate.board.dao;

import java.util.List;
import net.koreate.board.util.Criteria;
import net.koreate.board.vo.BoardVO;
import net.koreate.home.vo.BellVO;
import net.koreate.home.vo.WishVO;

public interface BoardDAO {
	
	// 리스트
	public List<BoardVO> list(Criteria cri) throws Exception;

	// 리스트 갯수
	public int listCount() throws Exception;
	
	// 삽입
	public int insert(BoardVO board) throws Exception;
	
	// 읽기
	public BoardVO read(int bno) throws Exception;
	
	// 수정
	public int update(BoardVO board) throws Exception;
	
	// 삭제
	public int delete(int bno) throws Exception;
	
	// 찜 리스트
	public WishVO getWish(WishVO wish) throws Exception;
	
	// 찜 추가
	public int addWishlist(WishVO wish) throws Exception;
	
	// 찜 삭제
	public int deleteWishlist(WishVO wish) throws Exception;
	
	// 조회수 증가
	public int updateViewCount(int bno) throws Exception;

	public void addRing(BellVO addRing);
	
}
