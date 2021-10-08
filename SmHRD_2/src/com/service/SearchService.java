package com.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.FrontCommand;
import com.model.Apt_name_searchDAO;
import com.model.Apt_name_searchDTO;
import com.model.Dong_searchDAO;
import com.model.Dong_searchDTO;
import com.model.Main_filterDAO;
import com.model.Main_filterDTO;

public class SearchService implements FrontCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		String search = request.getParameter("search");		
		String table = request.getParameter("table");		
		
		System.out.println(search);
	
		

		if(table.equals("dong")) {
			Dong_searchDAO dao = new Dong_searchDAO();
			Dong_searchDTO dto = new Dong_searchDTO(search);
			ArrayList<Main_filterDTO> DongSearchList = dao.search(dto);

			
			if(DongSearchList != null) {
				System.out.println("동 검색을성공");
				HttpSession session = request.getSession();
				session.setAttribute("DongSearchList",DongSearchList);
			}
			else {
				System.out.println("동 검색성공");
			}
			response.sendRedirect("index_maemae.jsp");	
		}
		

		if(table.equals("apt_name")) {
		Apt_name_searchDAO dao = new Apt_name_searchDAO();
		Apt_name_searchDTO dto = new Apt_name_searchDTO(search);
		ArrayList<Main_filterDTO> AptSearchList = dao.search(dto);
		
		if(AptSearchList != null) {
			System.out.println("아파트 검색 성공");

			HttpSession session = request.getSession();
			session.setAttribute("AptSearchList",AptSearchList);
			
		}
		else {
			System.out.println("아파트 검색 실패");
		}
		response.sendRedirect("index_maemae.jsp");
	}
	}
}
