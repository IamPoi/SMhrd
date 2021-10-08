package com.model;

public class Apt_name_searchDTO {

	private String search;
	private String apt_name;
	
	public Apt_name_searchDTO(String search) {
		super();
		this.search = search;
	}

	public Apt_name_searchDTO(String search, String apt_name) {
		super();
		this.search = search;
		this.apt_name = apt_name;	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getApt_name() {
		return apt_name;
	}

	public void setApt_name(String apt_name) {
		this.apt_name = apt_name;
	}
	
	
}
