package com.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.ha.backend.Sender;

import com.controller.FrontCommand;
import com.model.FavoriteDAO;
import com.model.FavoriteDTO;
import com.model.MemberDTO;

public class FavoriteService implements FrontCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		response.setCharacterEncoding("EUC-KR");
		
		String type = request.getParameter("type");
		String num = request.getParameter("num");		
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		FavoriteDTO dto = new FavoriteDTO(info.getId(),type, num);
		FavoriteDAO dao = new FavoriteDAO();			
		
		int cnt = dao.insert(dto);
		
		if(type.equals("maemae")) {
			response.sendRedirect("index_maemae.jsp");
		}else if(type.equals("rent")){
			response.sendRedirect("index_rent.jsp");
		}
	}
	
		
	
		
		
		
}
