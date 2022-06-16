package net.koreate.qnaboard.util;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.ToString;


@Getter
@ToString
public class QnAPageMaker {

	private int totalCount;
	private int displayPageNum;
	private QnACriteria cri;
	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int maxPage;
	
	private void calc() {
		//Math.ceil(정수값으로 올림)
		endPage = (int)Math.ceil(
				cri.getPage()/(double)displayPageNum
				)*displayPageNum;
		startPage = (endPage - displayPageNum)+1;
		
		maxPage = (int)Math.ceil(
				totalCount/(double)cri.getPerPageNum()
			);
		if(endPage > maxPage)endPage = maxPage;
		
		prev = endPage > displayPageNum ? true : false;
		
		next = (endPage == maxPage) ? false : true;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calc();
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
		calc();
	}

	public void setCri(QnACriteria cri) {
		this.cri = cri;
		calc();
	}
	
	public String search(int page) {
		UriComponents uri 
		= UriComponentsBuilder.newInstance()
		 .queryParam("page",page)
		 .queryParam("perPageNum", cri.getPerPageNum())
		 .queryParam("searchType", cri.getSearchType())
		 .queryParam("keyword", cri.getKeyword())
		 .build();
		String queryString = uri.toUriString();
		System.out.println(queryString);
		return queryString;
	}
	
}
