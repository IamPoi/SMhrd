package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ImdaeSearchDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	ImdaeSearchDTO dto = null;
	ArrayList<ImdaeSearchDTO> imdae_list = null;
	String sql = null;

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

	public ArrayList<ImdaeSearchDTO> search(String input, String search) {
		
		imdae_list = new ArrayList<ImdaeSearchDTO>(); // 기본 필터 검색
		
		conn();
		
		System.out.println(input);
		System.out.println(search);
		
		
		try {
			if(search.equals("dong")) {
				sql = "select * from (select * from imdae_apt) where dong  like ";
			}else if (search.equals("region")) {
				sql = "select * from (select * from imdae_apt) where region like ";	
			}
			psmt = conn.prepareStatement(sql+"\'%"+input+"%\' and rownum <= 100");
			rs = psmt.executeQuery();

			System.out.println("rx.next = " + rs.next());

			while (rs.next()) {

				String imdae_num = rs.getString(1);
				String region = rs.getString(2);
				String dong = rs.getString(3);
				String imdae_name = rs.getString(4);
				String imdae_size = rs.getString(5);
				String month_pay = rs.getString(6);
				String deposit = rs.getString(7);
				int total_cnt = rs.getInt(8);
				int cnt = rs.getInt(9);
				String imdae_div = rs.getString(10);
				String move_into_date = rs.getString(11);
				
				
				
				dto = new ImdaeSearchDTO(imdae_num,region,dong,imdae_name,imdae_size,month_pay,deposit,total_cnt,cnt,imdae_div,move_into_date);
				imdae_list.add(dto);
				
			}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			
			return imdae_list;
	}

}
