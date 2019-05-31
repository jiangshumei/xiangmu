package com.oracle.web.bean;


import java.io.Serializable;
import java.util.List;

public class pageBean<T> implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int pageNow;
	
	private int counts;
	
	private int pages;
	
	private int pageSize;
	
	private List<T> beanList;

	

	public pageBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public pageBean(int pageNow, int counts, int pages, int pageSize, List<T> beanList) {
		super();
		this.pageNow = pageNow;
		this.counts = counts;
		this.pages = pages;
		this.pageSize = pageSize;
		this.beanList = beanList;
	}
	
	

	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getCounts() {
		return counts;
	}

	public void setCounts(int counts) {
		this.counts = counts;
	}

	public int getPages() {
		
		int pages=this.counts/this.pageSize;
		return (this.counts%this.pageSize==0?pages:pages+1);
	}

//	public void setPages(int pages) {
//		this.pages = pages;
//	}

	public int getpageSize() {
		return pageSize;
	}

	public void setpageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List<T> getBeanList() {
		return beanList;
	}

	public void setBeanList(List<T> beanList) {
		this.beanList = beanList;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "pageBean [pageNow=" + pageNow + ", counts=" + counts + ", pages=" + pages + ", pageSize=" + pageSize
				+ ", beanList=" + beanList + "]";
	}
	
	
}
