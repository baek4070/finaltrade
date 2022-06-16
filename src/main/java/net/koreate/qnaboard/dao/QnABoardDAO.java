package net.koreate.qnaboard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import net.koreate.qnaboard.provider.QnABoardQueryProvider;
import net.koreate.qnaboard.util.QnACriteria;
import net.koreate.qnaboard.vo.QnABoardVO;

public interface QnABoardDAO {

	@Insert("INSERT INTO qna_tbl(userId, title, content, userNickname,filename,filepath,uno  ) "
			+ " VALUES(#{userId},#{title},#{content},#{userNickname},#{filename},#{filepath},#{uno})")
	void regist(QnABoardVO vo) throws Exception;
	
	@SelectProvider(type=QnABoardQueryProvider.class,
			method="searchSelectSql")
	List<QnABoardVO> list(QnACriteria cri) throws Exception;
	
	@Select("SELECT * FROM qna_tbl WHERE qno=#{qno} AND deleted='n'")
	QnABoardVO detail(int qno) throws Exception;
	
	@SelectProvider(type=QnABoardQueryProvider.class,
		 	method="searchSelectCount")
	int listCount(QnACriteria cri) throws Exception;
	
	@Update("UPDATE qna_tbl SET title = #{title},"
			+ "content = #{content}," 
			+ "userNickname = #{userNickname}," 
			+ "updatedate = now() "
			+ "WHERE qno = #{qno}")
	void update(QnABoardVO vo) throws Exception;
	
	@Update("UPDATE qna_tbl SET deleted = 'y' WHERE qno=#{qno}")
	void delete(int qno) throws Exception;

	@Update("UPDATE qna_tbl SET root =last_insert_id()  WHERE qno = last_insert_id()")
	void setRoot() throws Exception;
	
	@Update("UPDATE qna_tbl SET seq = seq + 1"
			+ " WHERE root = #{root} AND seq > #{seq}")
	void updateReply(QnABoardVO vo) throws Exception;
	
	@Insert("INSERT INTO qna_tbl (userId, title, content, userNickname, root, seq, depth)"
			+ " VALUES(#{userId},#{title},#{content},#{userNickname},#{root},#{seq},#{depth})")
	void registerReply(QnABoardVO vo) throws Exception;
	
	@Update("UPDATE qna_tbl set viewcnt = viewcnt + 1 "
			+ " WHERE qno = #{qno}")
	void updateViewCnt(int qno) throws Exception;
	
}
