package net.koreate.home.util;

public class MessageCriteria {
	
	private int page;	// 요청(현재) 페이지 정보
	private int perPageNum;

	private int uno;
	
	public MessageCriteria() {
		this(1,12);
	}
	
	public MessageCriteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
	}
	// 게시글 검색 시 limit 시작 인덱스 번호
	public int getStartRow() {
		return (this.page-1) * this.perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	@Override
	public String toString() {
		return "MessageCriteria [page=" + page + ", perPageNum=" + perPageNum + ", uno=" + uno + "]";
	}
	
}








