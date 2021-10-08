package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class MemberDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	MemberDTO loginDto = null;
	MemberDTO info = null;
	ArrayList<MemberDTO> list = null;

	public void conn() { // DB 연결
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";
			conn = DriverManager.getConnection(db_url, db_id, db_pw);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() { // DB 연결 해제
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
public int  join(MemberDTO dto) { //회원가입
		conn();
		try {
			String sql = "insert into A_MEMBER values (?,?,?,?,?,?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId()); //아이디
			psmt.setString(2, dto.getPw()); //비밀번호
			psmt.setString(3, dto.getName()); //이름
			psmt.setString(4, dto.getTel()); //전화번호
			psmt.setString(5, dto.getBirth()); //생년월일
			psmt.setString(6, dto.getAddr()); //주소(법정동)
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("회원가입성공");
		}finally {
			close();
		}
		return cnt;
	}

public MemberDTO login(MemberDTO dto) { //로그인
	conn();
	try {
		String sql = "select * from A_MEMBER where mem_id = ? and mem_pw = ?";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, dto.getId());
		psmt.setString(2, dto.getPw());
		rs = psmt.executeQuery();
		
		if(rs.next()) {
			String id = rs.getString(1);
			String pw = rs.getString(2);
			String name = rs.getString(3);
			String tel = rs.getString(4);
			String birth = rs.getString(5);
			String addr = rs.getString(6);
			
			loginDto = new MemberDTO(id, pw, name, tel, birth, addr);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close();
	}
	return loginDto;
}

public int update(MemberDTO dto) { //정보수정
	conn();
	try {
		String sql = "update A_MEMBER set mem_pw = ?, mem_name = ?, mem_tel=?, mem_birth=?, mem_addr=? where mem_id = ?";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, dto.getPw());
		psmt.setString(2, dto.getName());
		psmt.setString(3, dto.getTel());
		psmt.setString(4, dto.getBirth());
		psmt.setString(5, dto.getAddr());
		psmt.setString(6, dto.getId());
		cnt = psmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	close();
	return cnt;
}

public ArrayList<MemberDTO> select(){
	list=new ArrayList<MemberDTO>();
	conn();
	try {
		String sql="select * from A_member where mem_id not in ('admin')";
		psmt=conn.prepareStatement(sql);
		rs=psmt.executeQuery();
		
		while(rs.next()) {
			String id=rs.getString(1);
			String pw=rs.getString(2);
			String name=rs.getString(3);
			String tel=rs.getString(4);
			String birth=rs.getString(5);
			String addr=rs.getString(6);
			
			/*info라는 dto에 정보를 담에서 list에 저장*/
			info = new MemberDTO(id,pw,name,tel,birth,addr);
			list.add(info); 
		}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	

}
