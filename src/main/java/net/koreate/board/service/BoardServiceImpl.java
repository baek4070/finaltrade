package net.koreate.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.board.dao.BoardCommentDAO;
import net.koreate.board.dao.BoardDAO;
import net.koreate.board.util.Criteria;
import net.koreate.board.util.PageMaker;
import net.koreate.board.vo.BoardCommentVO;
import net.koreate.board.vo.BoardVO;
import net.koreate.home.vo.BellVO;
import net.koreate.home.vo.WishVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject 
	BoardDAO dao;
	
	@Inject
	BoardCommentDAO commentDao;
	
	@Override
	public List<BoardVO> list(Criteria cri) throws Exception {
		List<BoardVO> list = dao.list(cri);
		return list;
	}

	@Override
	public PageMaker getPageMaker(Criteria cri) throws Exception {
		int totalCount = dao.listCount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		System.out.println(pageMaker);
		return pageMaker;
	}

	@Override
	public String register(BoardVO board) throws Exception {
		int result = dao.insert(board);
		return getMessage(result, "등록");
	}

	@Override
	public BoardVO get(int bno) throws Exception {
		return dao.read(bno);
	}

	@Override
	public String modify(BoardVO board) throws Exception {
		int result = dao.update(board);
		return getMessage(result, "수정");
	}

	@Override
	public String delete(int bno) throws Exception {
		int result = dao.delete(bno);
		return getMessage(result, "삭제");
	}
	
	private String getMessage(int result, String type) {
		return (result > 0) ? type + " 성공" : type + " 실패";
	}

	@Override
	public String addWishlist(WishVO wish) throws Exception {
		int result = dao.addWishlist(wish);
		return getMessage(result, "찜 추가");
	}

	@Override
	public String removeWishlist(WishVO wish) throws Exception {
		int result = dao.deleteWishlist(wish);
		return getMessage(result, "찜 삭제");
	}

	@Override
	public int updateViewCnt(int bno) throws Exception {
		int result = dao.updateViewCount(bno);
		return result;
	}
	
	// 댓글 리스트
	@Override
	public List<BoardCommentVO> getCommentList(int bno) throws Exception {
		return commentDao.getCommentList(bno);
	}
	
	// 댓글 추가
	@Override
	public String registerComment(BoardVO board) throws Exception {
		int result = commentDao.registerComment(board);
		return getMessage(result, "댓글 추가");
	}

	@Override
	public String modifyComment(BoardCommentVO board) throws Exception {
		int result = commentDao.modifyComment(board);
		return getMessage(result, "댓글 수정");
	}

	@Override
	public String removeComment(BoardCommentVO board) throws Exception {
		int result = commentDao.deleteComment(board);
		return getMessage(result, "댓글 삭제");
	}

	@Override
	public WishVO getWish(WishVO wish) throws Exception {
		return dao.getWish(wish);
	}

	@Override
	public void addRing(BellVO addRing) {
		dao.addRing(addRing);
		
	}

	

}
