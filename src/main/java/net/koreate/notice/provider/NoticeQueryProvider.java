package net.koreate.notice.provider;

import org.apache.ibatis.jdbc.SQL;

import net.koreate.notice.util.NoticeCriteria;


public class NoticeQueryProvider {

	public String searchSelectSql(NoticeCriteria cri) {
		
		SQL sql = new SQL();
		
		sql.SELECT("*");
		sql.FROM("notice_tbl");
		getSearchWhere(cri,sql);
		sql.ORDER_BY("nno DESC");
		sql.LIMIT(cri.getStartRow()+","+cri.getPerPageNum());
		String query =sql.toString();
		System.out.println(query);
		return query;
	}
	
	public String searchSelectCount(NoticeCriteria cri) {
		return new SQL() {
			{
				SELECT("count(*)");
				FROM("notice_tbl");
				getSearchWhere(cri,this);
			}
		}.toString();
	}
	
	// WHERE 조건 절 추가
		public void getSearchWhere(NoticeCriteria cri, SQL sql) {
			String deletedQuery = "deleted='n'";
			if(cri.getSearchType() != null 
					&& 
			   !cri.getSearchType().equals("n")) {
			   String titleQuery
			   = "title LIKE CONCAT('%','"+cri.getKeyword()+"','%')";
			   String contentQuery
			   = "content LIKE CONCAT('%','"+cri.getKeyword()+"','%')";
			   switch(cri.getSearchType()) {
				   case "t" :
					   sql.WHERE(titleQuery).AND().WHERE(deletedQuery);
					   break;
				   case "c" :
					   sql.WHERE(contentQuery).AND().WHERE(deletedQuery);
					   break;
				   case "tc" :
					   sql.WHERE(titleQuery).OR().WHERE(contentQuery).AND().WHERE(deletedQuery);
					   break;
			   }
			  
			}
			sql.WHERE(deletedQuery);
		}
}
