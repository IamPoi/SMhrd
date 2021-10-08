package com.model;

public class ParkDTO {
	private String dong;
	private String park_div;
	private String park_size;
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


	public ParkDTO(String dong, String park_div, String park_size, String apt_name, String price, int build_year,int year,
			int month, int day, int apt_size, int floor) {
		super();
		this.dong = dong;
		this.park_div = park_div;
		this.park_size = park_size;
		this.apt_name = apt_name;
		this.price = price;
		this.build_year = build_year;
		this.year = year;
		this.month = month;
		this.day = day;
		this.apt_size = apt_size;
		this.floor = floor;
	}


	public ParkDTO(String dong, String park_div, String park_size) {
		super();
		this.dong = dong;
		this.park_div = park_div;
		this.park_size = park_size;
	}
	
	
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getPark_div() {
		return park_div;
	}
	public void setPark_div(String park_div) {
		this.park_div = park_div;
	}
	public String getPark_size() {
		return park_size;
	}
	public void setPark_size(String park_size) {
		this.park_size = park_size;
	}
	
	

}
