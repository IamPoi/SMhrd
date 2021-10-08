package com.model;

public class SchoolDTO {
	
	private String school_name;
	private String scool_addr;
	private String dong;
	private String apt_name;
	private String price;
	private int build_year;
	private int year;
	private int month;
	private int day;
	private int apt_size;
	private int floor;
	
	
	public String getApt_name() {
		return apt_name;
	}


	public void setApt_name(String apt_name) {
		this.apt_name = apt_name;
	}


	public String getPrice() {
		return price;
	}


	public void setPrice(String price) {
		this.price = price;
	}


	public int getBuild_year() {
		return build_year;
	}


	public void setBuild_year(int build_year) {
		this.build_year = build_year;
	}


	public int getYear() {
		return year;
	}


	public void setYear(int year) {
		this.year = year;
	}


	public int getMonth() {
		return month;
	}


	public void setMonth(int month) {
		this.month = month;
	}


	public int getDay() {
		return day;
	}


	public void setDay(int day) {
		this.day = day;
	}


	public int getApt_size() {
		return apt_size;
	}


	public void setApt_size(int apt_size) {
		this.apt_size = apt_size;
	}


	public int getFloor() {
		return floor;
	}


	public void setFloor(int floor) {
		this.floor = floor;
	}


	public SchoolDTO(String school_name, String scool_addr, String dong, String apt_name, String price, int build_year,
			int year, int month, int day, int apt_size, int floor) {
		super();
		this.school_name = school_name;
		this.scool_addr = scool_addr;
		this.dong = dong;
		this.apt_name = apt_name;
		this.price = price;
		this.build_year = build_year;
		this.year = year;
		this.month = month;
		this.day = day;
		this.apt_size = apt_size;
		this.floor = floor;
	}
	

	public SchoolDTO(String school_name, String scool_addr, String dong) {
		super();
		this.school_name = school_name;
		this.scool_addr = scool_addr;
		this.dong = dong;
	}
	
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getSchool_name() {
		return school_name;
	}
	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}
	public String getScool_addr() {
		return scool_addr;
	}
	public void setScool_addr(String scool_addr) {
		this.scool_addr = scool_addr;
	}
	
	

}
