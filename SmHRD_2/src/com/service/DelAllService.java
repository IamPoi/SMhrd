package com.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.FrontCommand;
import com.model.FavoriteDAO;
import com.model.FavoriteDTO;
import com.model.MemberDTO;

public class DelAllService implements FrontCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String type = request.getParameter("type");		
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		
		FavoriteDTO dto = new FavoriteDTO(info.getId(),type);
		FavoriteDAO dao = new FavoriteDAO();

		int cnt = dao.deleteAll(dto);
		response.sendRedirect("favorite.jsp");
	}

}
