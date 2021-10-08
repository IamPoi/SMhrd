package com.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.FrontCommand;
import com.model.ImdaeSearchDAO;
import com.model.ImdaeSearchDTO;

public class ImdaeSearchService implements FrontCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		
			String imdae_search = request.getParameter("imdae_search");
			String search_type = request.getParameter("search_type");
		
			
			System.out.println("imdae_search = "+imdae_search);
	
			ImdaeSearchDAO dao = new ImdaeSearchDAO();
			
			ArrayList<ImdaeSearchDTO> ImdaeSearchList = dao.search(imdae_search,search_type);
			
			HttpSession session = request.getSession();
			session.setAttribute("ImdaeSearchList",ImdaeSearchList);

			response.sendRedirect("index_imdae.jsp");	
		
	}
}
