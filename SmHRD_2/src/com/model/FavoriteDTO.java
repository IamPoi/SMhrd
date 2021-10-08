package com.model;

public class FavoriteDTO {
	private String id;
	private String type;
	private String num;
	private int check;
	
	
	
	public FavoriteDTO(String type, int check) {
		super();
		this.type = type;
		this.check = check;
	}


	public FavoriteDTO(String id, String type) {
		super();
		this.id = id;
		this.type = type;
	}


	public FavoriteDTO(String id, String type, String num) {	
		this.id = id;
		this.type = type;
		this.num = num;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getNum() {
		return num;
	}


	public void setNum(String num) {
		this.num = num;
	}
	
	public int getCheck() {
		return check;
	}


	public void setCheck(int check) {
		this.check = check;
	}
	
}
