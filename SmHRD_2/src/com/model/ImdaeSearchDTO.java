package com.model;

public class ImdaeSearchDTO {
	
	private String imdae_num;
	private String region;
	private String dong;
	private String imdae_name;
	private String imdae_size;
	private String month_pay;
	private String deposit;
	private int total_cnt;
	private int cnt;
	private String imdae_div;
	private String move_into_date;
	
	
	public ImdaeSearchDTO(String imdae_num, String region, String dong, String imdae_name, String imdae_size,
			String month_pay, String deposit, int total_cnt, int cnt, String imdae_div, String move_into_date) {
		super();
		this.imdae_num = imdae_num;
		this.region = region;
		this.dong = dong;
		this.imdae_name = imdae_name;
		this.imdae_size = imdae_size;
		this.month_pay = month_pay;
		this.deposit = deposit;
		this.total_cnt = total_cnt;
		this.cnt = cnt;
		this.imdae_div = imdae_div;
		this.move_into_date = move_into_date;
	}
	
	
	public String getImdae_num() {
		return imdae_num;
	}
	public void setImdae_num(String imdae_num) {
		this.imdae_num = imdae_num;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getImdae_name() {
		return imdae_name;
	}
	public void setImdae_name(String imdae_name) {
		this.imdae_name = imdae_name;
	}
	public String getImdae_size() {
		return imdae_size;
	}
	public void setImdae_size(String imdae_size) {
		this.imdae_size = imdae_size;
	}
	public String getMonth_pay() {
		return month_pay;
	}
	public void setMonth_pay(String month_pay) {
		this.month_pay = month_pay;
	}
	public String getDeposit() {
		return deposit;
	}
	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}
	public int getTotal_cnt() {
		return total_cnt;
	}
	public void setTotal_cnt(int total_cnt) {
		this.total_cnt = total_cnt;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getImdae_div() {
		return imdae_div;
	}
	public void setImdae_div(String imdae_div) {
		this.imdae_div = imdae_div;
	}
	public String getMove_into_date() {
		return move_into_date;
	}
	public void setMove_into_date(String move_into_date) {
		this.move_into_date = move_into_date;
	}
	
	
	
	
	

}
