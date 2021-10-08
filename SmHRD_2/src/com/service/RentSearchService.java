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
import com.model.Main_filterDTO;
import com.model.Rent_searchDAO;
import com.model.Rent_searchDTO;

public class RentSearchService implements FrontCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		String rent_search = request.getParameter("rent_search");	
		String table = request.getParameter("table");		
		HttpSession session = request.getSession();
			System.out.println("rent_search = "+rent_search);
			session.setAttribute("table", table);
	
			Rent_searchDAO dao = new Rent_searchDAO();
			Rent_searchDTO dto = new Rent_searchDTO(rent_search);
			ArrayList<Rent_searchDTO> RentSearchList = dao.search(rent_search, table);
			
			
			session.setAttribute("RentSearchList",RentSearchList);
			session.setAttribute("table",table);
			

			response.sendRedirect("index_rent.jsp");	
		
	}
}
