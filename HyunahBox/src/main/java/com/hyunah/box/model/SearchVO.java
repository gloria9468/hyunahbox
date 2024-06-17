package com.hyunah.box.model;

public class SearchVO{
	

	// 현재페이지
	private int pageindex = 1;
	
	// 페이지네이션해서 제일 끝 페이지 번호
	private int pageunit = 10;
	
	// 한번에 페이지 버튼을 몇개 보일 것인지.
	private int pagesize = 10;
	
	// 페이지 당 레코드 개수
	private int cntperpage = 3;
	
	// 총 데이터 갯수
	private int totalCnt = 0;
	
	// 검색어
	private String keyword;
	
	// 영화 리스트 타입
	private String listType = "list";
	
	private int startRowNum = 0;
	private int endRowNum = 10;
	
	

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getStartRowNum() {
		startRowNum = (pageindex-1) * cntperpage;
		return startRowNum;
	}

	public int getEndRowNum() {
		endRowNum = pageindex * cntperpage;
		return endRowNum;
	}
	

	public int getPageindex() {
		return pageindex;
	}

	public void setPageindex(int pageindex) {
		this.pageindex = pageindex;
	}
	
	public int getPageunit() {
		double pu = (double) totalCnt / cntperpage;
		pageunit = (int) Math.ceil( pu );
		return pageunit;
	}

	/*
	public void setPageunit(int pageunit) {
		this.pageunit = pageunit;
	}
	*/

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

	public String getListType() {
		return listType;
	}

	public void setListType(String listType) {
		this.listType = listType;
	}

	
	
	
	
}
