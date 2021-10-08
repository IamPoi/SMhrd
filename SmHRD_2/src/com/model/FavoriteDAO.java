package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FavoriteDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	Main_filterDTO dto = null;	
	ArrayList<Main_filterDTO> MeaList = null;
	ArrayList<Rent_searchDTO> RentList = null;
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

	public int insert(FavoriteDTO dto) { // 즐겨찾기 추가
		conn();
		try {
			if (dto.getType().equals("maemae")) {
				sql = "insert into MY_maemae values (?,?)";
			} 
			else if (dto.getType().equals("rent")) {
			sql = "insert into MY_rent values (?,?)";
			}
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getNum());
			psmt.setString(2, dto.getId());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}

	public ArrayList<Main_filterDTO> Mae_view(MemberDTO info) {

		MeaList = new ArrayList<Main_filterDTO>();
		conn();
		

		try {
				sql = "SELECT MAEMAE_NUM,DONG,PRICE,BUILD_YEAR,APT_NAME,YEAR, MONTH,DAY,APT_SIZE,FLOOR "
						+ "FROM   A_MAEMAE "
						+ "WHERE  MAEMAE_NUM IN (SELECT MY_MAEMAE_NUM "
						+ "FROM MY_MAEMAE "
						+ "WHERE MAEMAE_MEM_ID IN ?)";		
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, info.getId());
			rs = psmt.executeQuery();

			System.out.println("rs.next = " + rs.next());

			while (rs.next()) {
				String MAEMAE_NUM = rs.getString(1);
				String DONG = rs.getString(2);
				String PRICE = rs.getString(3);
				int BUILD_YEAR = rs.getInt(4);
				String APT_NAME = rs.getString(5);
				int YEAR = rs.getInt(6);
				int MONTH = rs.getInt(7);
				int DAY = rs.getInt(8);
				int APT_SIZE = rs.getInt(9);
				int FLOOR = rs.getInt(10);
			
				Main_filterDTO view = new Main_filterDTO(MAEMAE_NUM, DONG, PRICE, BUILD_YEAR, APT_NAME, YEAR, MONTH, DAY, APT_SIZE, FLOOR);
				
				MeaList.add(view);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return MeaList;
	}

	public ArrayList<Rent_searchDTO> Rent_view(MemberDTO info) {

		RentList = new ArrayList<Rent_searchDTO>();
		conn();
		

		try {
				sql = "SELECT RENT_NUM,DONG,BUILD_YEAR,DEPOSIT,LOYER,APT_NAME,YEAR,MONTH,DAY,APT_SIZE,FLOOR "
						+ "FROM   A_RENT "
						+ "WHERE  RENT_NUM IN (SELECT MY_RENT_NUM "
						+ "FROM MY_RENT "
						+ "WHERE RENT_MEM_ID IN ?)";		
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, info.getId());
			rs = psmt.executeQuery();

			System.out.println("rs.next = " + rs.next());

			while (rs.next()) {
				String RENT_NUM = rs.getString(1);
				String DONG = rs.getString(2);
				int BUILD_YEAR = rs.getInt(3);
				String DEPOSIT = rs.getString(4);
				String LOYER = rs.getString(5);
				String APT_NAME = rs.getString(6);
				int YEAR = rs.getInt(7);
				int MONTH = rs.getInt(8);
				int DAY = rs.getInt(9);
				int APT_SIZE = rs.getInt(10);
				int FLOOR = rs.getInt(10);
			
				Rent_searchDTO view = new Rent_searchDTO(RENT_NUM, DONG, BUILD_YEAR, DEPOSIT, LOYER, APT_NAME, YEAR, MONTH, DAY, APT_SIZE, FLOOR);
				
				RentList.add(view);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return RentList;
	}
	
	public int deleteAll(FavoriteDTO dto) {
		conn();
		try {
		
		if (dto.getType().equals("maemae")) {
		sql = "delete from MY_MAEMAE where MAEMAE_MEM_ID = ?";
		} 
		else if (dto.getType().equals("rent")) {
		sql = "delete from MY_Rent where RENT_MEM_ID = ?";
		}		
		psmt = conn.prepareStatement(sql);		
		psmt.setString(1, dto.getId());
		
		cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	public int deleteSelect(FavoriteDTO dto) {
		conn();
		
		try {
			if (dto.getType().equals("maemae")) {
				sql = "delete from MY_MAEMAE where MY_MAEMAE_NUM = ?";
				} 
				else if (dto.getType().equals("rent")) {
				sql = "delete from MY_Rent where MY_RENT_NUM = ?";
				}
		
		psmt = conn.prepareStatement(sql);		
		psmt.setInt(1, dto.getCheck());
		
		cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		return cnt;
	}
}
