package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Rent_searchDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	Rent_searchDTO dto = null;
	ArrayList<Rent_searchDTO> rent_list = null;
	
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

public ArrayList<Rent_searchDTO> search(String input,String search) {

	String sql = null;
	rent_list = new ArrayList<Rent_searchDTO>(); // 기본 필터 검색
	
	conn();
	
	System.out.println(input);
	
	try {
		if(search.equals("apt_name")) {
			sql = "select * from A_rent where apt_name like ";	
		}
		else if(search.equals("dong")) {
			sql = "select * from A_rent where dong like";
		}
		psmt = conn.prepareStatement(sql+"\'%"+input+"%\' and rownum <= 100");
		rs = psmt.executeQuery();
		
		System.out.println("re.next = "+rs.next());
		
		while(rs.next()) {
			
			String rent_num = rs.getString(1);
			String dong = rs.getString(2);
			int build_year = rs.getInt(3);
			String deposit= rs.getString(4);
			String loyer= rs.getString(5);
			String apt_name= rs.getString(6);
			int year = rs.getInt(7);
			int month = rs.getInt(8);
			int day = rs.getInt(9);
			int apt_size = rs.getInt(10);
			int floor = rs.getInt(11);
			
			
			dto = new Rent_searchDTO(rent_num,dong,build_year,deposit,loyer,apt_name,year,month,day,apt_size,floor);
			rent_list.add(dto);
			
		}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return rent_list;
}

}
