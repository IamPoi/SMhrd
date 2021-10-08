package com.model;

public class Rent_searchDTO {

	private String rent_num;
	private String dong;
	private int build_year;
	private String deposit;
	private String loyer;
	private String apt_name;
	private int year;
	private int month;
	private int date;
	private int apt_size;
	private int floor;
	
	
	
	
	
	public Rent_searchDTO(String dong) {
		super();
		this.dong = dong;
	}



	public Rent_searchDTO(String rent_num, String dong, int build_year, String deposit, String loyer, String apt_name,
			int year, int month, int date, int apt_size, int floor) {

		this.rent_num = rent_num;
		this.dong = dong;
		this.build_year = build_year;
		this.deposit = deposit;
		this.loyer = loyer;
		this.apt_name = apt_name;
		this.year = year;
		this.month = month;
		this.date = date;
		this.apt_size = apt_size;
		this.floor = floor;
		
	}



	public String getRent_num() {
		return rent_num;
	}



	public void setRent_num(String rent_num) {
		this.rent_num = rent_num;
	}



	public String getDong() {
		return dong;
	}



	public void setDong(String dong) {
		this.dong = dong;
	}



	public int getBuild_year() {
		return build_year;
	}



	public void setBuild_year(int build_year) {
		this.build_year = build_year;
	}



	public String getDeposit() {
		return deposit;
	}



	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}



	public String getLoyer() {
		return loyer;
	}



	public void setLoyer(String loyer) {
		this.loyer = loyer;
	}



	public String getApt_name() {
		return apt_name;
	}



	public void setApt_name(String apt_name) {
		this.apt_name = apt_name;
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



	public int getDate() {
		return date;
	}



	public void setDate(int date) {
		this.date = date;
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
	
	
	
	
	
}
