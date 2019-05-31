package com.oracle.web.bean;

public class SubBook extends Book {

	
	private Fenlei fenlei;

	public Fenlei getFenlei() {
		return fenlei;
	}

	public void setFenlei(Fenlei fenlei) {
		this.fenlei = fenlei;
	}

	@Override
	public String toString() {
		return "SubBook [fenlei=" + fenlei + "]";
	}

	

}
