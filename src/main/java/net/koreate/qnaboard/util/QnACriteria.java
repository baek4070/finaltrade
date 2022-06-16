package net.koreate.qnaboard.util;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@ToString
public class QnACriteria {
	
	@Getter
	private int page;
	@Getter
	private int perPageNum;
	@Getter @Setter
	private String searchType;
	@Getter @Setter
	private String keyword;
	
	public QnACriteria() {
		this(1,10);
	}
	
	public QnACriteria(int page, int perPageNum) {
		this.page =page;
		this.perPageNum = perPageNum;
	}
	
	public void setPage(int page) {
		if(page <=0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getStartRow() {
		return(this.page-1) * this.perPageNum;
	}
}
