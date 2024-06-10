package com.hyunah.box.model;

public class SearchVO {
	// 페이지 개수 
	private int pageunit = 10;
	
	// 페이지 사이즈
	private int pagesize = 10;
	
	// 페이지 당 레코드 개수
	private int cntperpage = 10;
	
	// 검색어
	private String keyword;

	
	public int getPageunit() {
		return pageunit;
	}

	public void setPageunit(int pageunit) {
		this.pageunit = pageunit;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public int getCntperpage() {
		return cntperpage;
	}

	public void setCntperpage(int cntperpage) {
		this.cntperpage = cntperpage;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	
}
