package com.model;

public class MemberDTO {
	
	private String id;
	private String pw;
	private String name;
	private String tel;
	private String birth;
	private String addr;
	
	public MemberDTO(String id, String pw, String name, String tel, String birth, String addr) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.tel = tel;
		this.birth = birth;
		this.addr = addr;
	}
	
	public MemberDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

}
