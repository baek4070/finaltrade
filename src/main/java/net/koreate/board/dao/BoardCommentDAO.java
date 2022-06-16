package net.koreate.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.board.vo.BoardCommentVO;
import net.koreate.board.vo.BoardVO;

public interface BoardCommentDAO {
	// 댓글 리스트
	@Select("SELECT * FROM board_comment WHERE bno = #{bno}")
	public List<BoardCommentVO> getCommentList(int bno) throws Exception;
	
	// 댓글 작성
	@Insert("INSERT INTO board_comment(bno, content, writer, writerId) VALUES(#{bno}, #{content}, #{writer}, #{writerId})")
	public int registerComment(BoardVO board) throws Exception;
	
	// 댓글 수정
	@Update("UPDATE board_comment SET content = #{content} WHERE rno = #{rno}")
	public int modifyComment(BoardCommentVO board) throws Exception;
	
	// 댓글 삭제
	@Delete("DELETE FROM board_comment WHERE rno = #{rno}")
	public int deleteComment(BoardCommentVO board) throws Exception;
}
