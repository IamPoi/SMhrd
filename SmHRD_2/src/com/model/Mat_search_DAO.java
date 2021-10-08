package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Mat_search_DAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	Main_filterDTO dto = null;
	SchoolDTO sdto = null;
	ParkDTO pdto = null;
	FacilityDTO fdto = null;
	LibDTO ldto = null;
	
	ArrayList<Main_filterDTO> mat_list = null;
	ArrayList<SchoolDTO> sch_list = null;
	ArrayList<ParkDTO> park_list = null;
	ArrayList<FacilityDTO> fac_list = null;
	ArrayList<LibDTO> lib_list = null;
	
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
/*
public ArrayList<Main_filterDTO> search(String input,String search) {
	
	mat_list = new ArrayList<Main_filterDTO>(); // 기본 필터 검색
	
	conn();
	
	System.out.println(input);
	
	try {
		if(search.equals("crime")) {
			String sql = "select crime,maemae_num,dong,price,build_year,apt_name,year,month,day,"
					+ "apt_size,floor,charge,starbucks,subway,movie from maemae where dong = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, input);
		}
		else if(search.equals("charge")) {
			String sql = "select charge,maemae_num,dong,price,build_year,apt_name,year,month,day,"
					+ "apt_size,floor,crime,starbucks,subway,movie from maemae where dong = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, input);
		}
		else if(search.equals("subway")) {
			String sql = "select subway,maemae_num,dong,price,build_year,apt_name,year,month,day,"
					+ "apt_size,floor,crime,charge,starbucks,movie from maemae where dong = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, input);
		}
		else if(search.equals("coffee")) {
			String sql = "select starbucks,maemae_num,dong,price,build_year,apt_name,year,month,day,"
					+ "apt_size,floor,crime,charge,subway,movie from maemae where dong = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, input);
		}
		else if(search.equals("movie")) {
			String sql = "select movie,maemae_num,dong,price,build_year,apt_name,year,month,day,"
					+ "apt_size,floor,crime,charge,starbucks,subway from maemae where dong = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, input);
		}
		rs = psmt.executeQuery();
		
		System.out.println("re.next = "+rs.next());
		
		while(rs.next()) {
			
			int rent_num = rs.getInt(1);
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
			int crime = rs.getInt(12);
			int charge = rs.getInt(13);
			int starbucks = rs.getInt(14);
			
			
			
			dto = new Main_filterDTO();
			mat_list.add(dto);
			
		}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return mat_list;
}
*/


public ArrayList<Main_filterDTO> search2(String input) {
	
	mat_list = new ArrayList<Main_filterDTO>(); // 기본 필터 검색
	
	conn();
	
	
	try {
		String sql = "select * from (select * from a_maemae) where dong like ";	
		psmt = conn.prepareStatement(sql+"\'%"+input+"%\' and rownum <= 100");
		rs = psmt.executeQuery();

		System.out.println("re.next = " + rs.next());

		while (rs.next()) {

			String rent_num = rs.getString(1);
			String dong = rs.getString(2);
			String price = rs.getString(3);
			int build_year = rs.getInt(4);
			String apt_name = rs.getString(5);
			int year = rs.getInt(6);
			int month = rs.getInt(7);
			int day = rs.getInt(8);
			int apt_size = rs.getInt(9);
			int floor = rs.getInt(10);
			int crime = rs.getInt(11);
			int charge = rs.getInt(12);
			int starbucks = rs.getInt(13);
			String subway = rs.getString(14);
			String movie = rs.getString(15);
			
			
			
			dto = new Main_filterDTO(rent_num,dong,price,build_year,apt_name,year,month,day,apt_size,floor,crime,charge,starbucks,subway,movie);
			mat_list.add(dto);
			
		}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return mat_list;
}

public ArrayList<SchoolDTO> schSearch(String input) {
	
	sch_list = new ArrayList<SchoolDTO>(); // 기본 필터 검색
	
	conn();
	
	
	try {
		String sql = "SELECT SCH.SCHOOL_NAME, SCH.SCHOOL_ADDR, MAE.DONG, MAE.APT_NAME, \r\n"
				+ "MAE.PRICE, MAE.BUILD_YEAR,MAE.YEAR, MAE.MONTH, MAE.DAY, MAE.APT_SIZE, MAE.FLOOR	   \r\n"
				+ "FROM MAEMAE MAE, SCHOOL SCH\r\n"
				+ "WHERE MAE.DONG=SCH.DONG\r\n"
				+ "and rownum <= 100"
				+ "and mae.dong = ?";	
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, input);
		rs = psmt.executeQuery();

		System.out.println("re.next = " + rs.next());

		while (rs.next()) {

			String school_name = rs.getString(1);
			String school_addr = rs.getString(2);
			String dong = rs.getString(3);
			String apt_name= rs.getString(4);
			String price = rs.getString(5);
			int build_year = rs.getInt(6);
			int year= rs.getInt(7);
			int month = rs.getInt(8);
			int day = rs.getInt(9);
			int apt_size = rs.getInt(10);
			int floor = rs.getInt(11);
			
			
			
			sdto = new SchoolDTO(school_name,school_addr,dong,apt_name,price,build_year,year,month,day,apt_size,floor);
			sch_list.add(sdto);
			
		}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return sch_list;
}

public ArrayList<ParkDTO> parkSearch(String input) {
	
	park_list = new ArrayList<ParkDTO>(); // 기본 필터 검색
	
	conn();
	
	
	try {
		String sql = "SELECT PK.PARK_DIV, PK.PARK_SIZE, MAE.DONG, MAE.APT_NAME, \r\n"
				+ "	   MAE.PRICE, MAE.BUILD_YEAR, MAE.YEAR, MAE.MONTH, MAE.DAY, MAE.APT_SIZE, MAE.FLOOR	   \r\n"
				+ "FROM MAEMAE MAE, PARK PK\r\n"
				+ "WHERE MAE.DONG=PK.DONG and mae.dong = ? and rownum <= 100";	
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, input);
		rs = psmt.executeQuery();

		System.out.println("re.next = " + rs.next());

		while (rs.next()) {

			String park_div = rs.getString(1);
			String park_size = rs.getString(2);
			String dong = rs.getString(3);
			String apt_name= rs.getString(4);
			String price = rs.getString(5);
			int build_year = rs.getInt(6);
			int year= rs.getInt(7);
			int month = rs.getInt(8);
			int day = rs.getInt(9);
			int apt_size = rs.getInt(10);
			int floor = rs.getInt(11);
			
			
			
			pdto = new ParkDTO(dong,park_div,park_size,apt_name,price,build_year,year,month,day,apt_size,floor);
			park_list.add(pdto);
			
		}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return park_list;
}
public ArrayList<FacilityDTO> facSearch(String input) {
	
	fac_list = new ArrayList<FacilityDTO>(); // 기본 필터 검색
	
	conn();
	
	
	try {
		String sql = "SELECT FAC.FACILITY, MAE.DONG, MAE.APT_NAME, MAE.PRICE, MAE.BUILD_YEAR,MAE.YEAR, MAE.MONTH, MAE.DAY, MAE.APT_SIZE, MAE.FLOOR FROM MAEMAE MAE, FACILITY FAC WHERE MAE.DONG=FAC.DONG and mae.dong = ? and rownum <= 100";
					
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, input);
		rs = psmt.executeQuery();

		System.out.println("re.next = " + rs.next());

		while (rs.next()) {

			String facility = rs.getString(1);
			String dong = rs.getString(2);
			String apt_name= rs.getString(3);
			String price = rs.getString(4);
			int build_year = rs.getInt(5);
			int year= rs.getInt(6);
			int month = rs.getInt(7);
			int day = rs.getInt(8);
			int apt_size = rs.getInt(9);
			int floor = rs.getInt(10);
			
			
			
			fdto = new FacilityDTO(dong,apt_name,facility,price,build_year,year,month,day,apt_size,floor);
			fac_list.add(fdto);
			
		}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return fac_list;
}
public ArrayList<LibDTO> libSearch(String input) {
	
	lib_list = new ArrayList<LibDTO>(); // 기본 필터 검색
	
	conn();
	
	
	try {
		String sql = "SELECT LIB.LIB_NAME, LIB.CLOSE, MAE.DONG, MAE.APT_NAME, MAE.PRICE, MAE.BUILD_YEAR,MAE.YEAR, MAE.MONTH, MAE.DAY, MAE.APT_SIZE, MAE.FLOOR FROM MAEMAE MAE, LIBRARY LIB WHERE MAE.DONG=LIB.DONG and mae.dong = ? and rownum <= 100";	
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, input);
		rs = psmt.executeQuery();

		System.out.println("re.next = " + rs.next());

		while (rs.next()) {

			String lib_name = rs.getString(1);
			String close = rs.getString(2);
			String dong = rs.getString(3);
			String apt_name= rs.getString(4);
			String price = rs.getString(5);
			int build_year = rs.getInt(6);
			int year= rs.getInt(7);
			int month = rs.getInt(8);
			int day = rs.getInt(9);
			int apt_size = rs.getInt(10);
			int floor = rs.getInt(11);
			
			
			
			ldto = new LibDTO(dong,lib_name,close,apt_name,price,build_year,year,month,day,apt_size,floor);
			lib_list.add(ldto);
			
		}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return lib_list;
}



}
