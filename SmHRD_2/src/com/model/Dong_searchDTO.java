package com.model;

public class Dong_searchDTO {

	private String search;
	private String dong;
	
	
	
	public Dong_searchDTO(String search) {
		super();
		this.search = search;
	}

	public Dong_searchDTO(String search, String dong) {
		super();
		this.search = search;
		this.dong = dong;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}
}
