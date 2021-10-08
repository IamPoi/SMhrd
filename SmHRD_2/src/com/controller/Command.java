package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.DelAllService;
import com.service.DelOneService;
import com.service.FavoriteService;
import com.service.ImdaeSearchService;
import com.service.JoinService;
import com.service.LoginService;
import com.service.LogoutService;
import com.service.MatSearchService;
import com.service.RentSearchService;
import com.service.SearchService;
import com.service.UpdateService;

@WebServlet("*.do")
public class Command extends HttpServlet {
	private static final long serialVersionUID = 1L;	

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String URI = request.getRequestURI();
		String path = request.getContextPath();
		FrontCommand command = null;
		String resultURI = URI.substring(path.length()+1);
		System.out.println(resultURI);
		HttpSession session = request.getSession();
		session.setAttribute("maemae",1);
		
		System.out.println(resultURI);
		
		if(resultURI.equals("homepage/JoinService.do")) {
			command = new JoinService();
		}else if(resultURI.equals("homepage/LoginService.do")) {
			command = new LoginService();
		}else if(resultURI.equals("homepage/LogoutService.do")) {
			command = new LogoutService();
		}else if(resultURI.equals("homepage/UpdateService.do")) {
			command = new UpdateService();
		}else if(resultURI.equals("homepage/SearchService.do")) {
			command = new SearchService();
		}else if(resultURI.equals("homepage/RentSearchService.do")) {
			command = new RentSearchService();
		}else if(resultURI.equals("homepage/MatSearchService.do")) {
			command = new MatSearchService();
		}else if(resultURI.equals("homepage/ImdaeSearchService.do")) {
			command = new ImdaeSearchService();
		}else if(resultURI.equals("homepage/FavoriteService.do")) {
			command = new FavoriteService();
		}else if(resultURI.equals("homepage/DelAllService.do")) {
			command = new DelAllService();	
		}else if(resultURI.equals("homepage/DelOneService.do")) {
			command = new DelOneService();	
		}
		
		
		
		
		command.execute(request, response);
	}

}
