package net.koreate.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import net.koreate.notice.provider.NoticeQueryProvider;
import net.koreate.notice.util.NoticeCriteria;
import net.koreate.notice.vo.NoticeVO;

public interface NoticeDAO {

	@Insert("INSERT INTO notice_tbl(title, content, userNickname,filename,filepath  ) "
			+ " VALUES(#{title},#{content},#{userNickname},#{filename},#{filepath})")
	void regist(NoticeVO vo) throws Exception;
	
	@SelectProvider(type=NoticeQueryProvider.class,
			method="searchSelectSql")
	List<NoticeVO> list(NoticeCriteria cri) throws Exception;
	
	@Select("SELECT * FROM notice_tbl WHERE nno=#{nno} AND deleted='n'")
	NoticeVO detail(int nno) throws Exception;
	
	@SelectProvider(type=NoticeQueryProvider.class,
		 	method="searchSelectCount")
	int listCount(NoticeCriteria cri) throws Exception;
	
	@Update("UPDATE notice_tbl SET title = #{title},"
			+ "content = #{content}," 
			+ "userNickname = #{userNickname}," 
			+ "updatedate = now() "
			+ "WHERE nno = #{nno}")
	void update(NoticeVO vo) throws Exception;
	
	@Update("UPDATE notice_tbl SET deleted = 'y' WHERE nno=#{nno}")
	void delete(int nno) throws Exception;

	@Update("UPDATE notice_tbl set viewcnt = viewcnt + 1 "
			+ " WHERE nno = #{nno}")
	void updateViewCnt(int nno) throws Exception;
	
	
}
