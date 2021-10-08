package com.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.FrontCommand;
import com.model.MemberDAO;
import com.model.MemberDTO;

public class UpdateService implements FrontCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO loginDto = (MemberDTO)session.getAttribute("info");
		
		
		request.setCharacterEncoding("EUC-KR");
		String id = loginDto.getId();
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String birth = request.getParameter("birth");
		String addr = request.getParameter("addr");
		
		
		MemberDTO info = new MemberDTO(id,pw,name,tel,birth,addr);
		MemberDAO dao = new MemberDAO();
		
		int cnt = dao.update(info);
		
		if(cnt > 0) {
			
			System.out.println("회원정보 수정 성공");
			session.setAttribute("info",info);
			response.sendRedirect("index_main.jsp");
		}
		else {
			System.out.println("회원정보 수정 실패");
			response.sendRedirect("mypage.jsp");
		}

	}

}
