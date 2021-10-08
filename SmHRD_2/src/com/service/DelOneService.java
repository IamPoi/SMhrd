package com.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.FrontCommand;
import com.model.FavoriteDAO;
import com.model.FavoriteDTO;

public class DelOneService implements FrontCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int check = Integer.parseInt(request.getParameter("check"));
		String type = request.getParameter("type");
		FavoriteDAO dao = new FavoriteDAO();
		FavoriteDTO dto = new FavoriteDTO(type, check);

		int cnt = dao.deleteSelect(dto);
		
		response.sendRedirect("favorite.jsp");
	}

}
