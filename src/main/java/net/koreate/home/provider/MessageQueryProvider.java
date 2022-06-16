package net.koreate.home.provider;

import org.apache.ibatis.jdbc.SQL;

import net.koreate.home.util.MessageCriteria;


public class MessageQueryProvider {

	public String searchSelectSql(MessageCriteria cri) {

		SQL sql = new SQL();
		sql.SELECT("*");
		sql.FROM("message");
		getSearchWhere(cri,sql);
		sql.ORDER_BY("mno DESC");
		sql.LIMIT(cri.getStartRow()+","+cri.getPerPageNum());
		String query =sql.toString();
		System.out.println(query);
		return query;
	}
	
	public String searchSelectSqlNon(MessageCriteria cri) {

		SQL sql = new SQL();
		sql.SELECT("*");
		sql.FROM("message");
		getSearchWhereNon(cri,sql);
		sql.ORDER_BY("mno DESC");
		sql.LIMIT(cri.getStartRow()+","+cri.getPerPageNum());
		String query =sql.toString();
		System.out.println(query);
		return query;
	}
	
	public String searchSelectSqlChecked(MessageCriteria cri) {

		SQL sql = new SQL();
		sql.SELECT("*");
		sql.FROM("message");
		getSearchWhereChecked(cri,sql);
		sql.ORDER_BY("mno DESC");
		sql.LIMIT(cri.getStartRow()+","+cri.getPerPageNum());
		String query =sql.toString();
		System.out.println(query);
		return query;
	}
	
	public String searchSelectCount(MessageCriteria cri) {
		return new SQL() {
			{
				SELECT("count(*)");
				FROM("message");
				getSearchWhere(cri,this);
			}
		}.toString();
	}
	
	public String searchSelectCountNon(MessageCriteria cri) {
		return new SQL() {
			{
				SELECT("count(*)");
				FROM("message");
				getSearchWhereNon(cri,this);
			}
		}.toString();
	}
	
	public String searchSelectCountChecked(MessageCriteria cri) {
		return new SQL() {
			{
				SELECT("count(*)");
				FROM("message");
				getSearchWhereChecked(cri,this);
			}
		}.toString();
	}
	// WHERE 조건 절 추가
		public void getSearchWhere(MessageCriteria cri, SQL sql) {
			String uno = "uno = "+ Integer.toString(cri.getUno());
			System.out.println("중요!!!:"+ uno);
			sql.WHERE(uno);
		}
		
		public void getSearchWhereNon(MessageCriteria cri, SQL sql) {
			String uno = "uno = "+ Integer.toString(cri.getUno());
			sql.WHERE(uno).AND().WHERE("checked='n'");

		}
		
		public void getSearchWhereChecked(MessageCriteria cri, SQL sql) {
			String uno = "uno = "+ Integer.toString(cri.getUno());
			sql.WHERE(uno).AND().WHERE("checked='y'");

		}
}
