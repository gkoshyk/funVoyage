package com.src.utdhack;

public class RouteVO {
	
	private int rountno;
	private String path[];
	public int getRountno() {
		return rountno;
		
	}
	public RouteVO(int id)
	{
		rountno = id;
	}
	public void setRountno(int rountno) {
		this.rountno = rountno;
	}
	public String[] getPath() {
		return path;
	}
	public void setPath(String[] path) {
		this.path = path;
	}
	
	

}
