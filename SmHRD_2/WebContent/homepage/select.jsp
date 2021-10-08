<%@page import="com.model.MemberDAO"%>
<%@page import="com.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Fonts -->
<link rel="dns-prefetch" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600"
	rel="stylesheet" type="text/css">

<link rel="icon" href="Favicon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<title>회원정보관리</title>
</head>
<style type="text/css">

.navbar-brand{
      font-size : 30px;
      font-weight : bold;
	  }
	  
	body{
	    margin: 0;
	    font-size: .9rem;
	    font-weight: 400;
	    line-height: 1.6;
	    color: #212529;
	    text-align: left;
	    background-color: #f5f8fa;
	}
   .green_window {
      display: inline-block;
      width: 500px; height: 40px;
      border: 3px solid #343A40;
      background: white;
   }
   .input_text {
      width: 480px; height: 20px;
      margin: 6px 0 0 9px;
      border: 0;
      line-height: 20px;
      font-size: 14px;
      outline: none;
      float : left;
   }
   .sch_smit {
      width: 100px; height: 40px;
      margin: 0; border: 0;
      vertical-align: top;
      background: #343A40;
      color: white;
      border-radius: 1px;
      cursor: pointer;
   }
   .SelectSearch{
      width: 120px; height: 40px;
      border: 3px solid #343A40;
      background: white;
      vertical-align: top;
   }
   
   #option{
   	text-align:center;
   }
	
	.navbar-brand
{
      font-size : 30px;
      font-weight : bold;
      box-shadow: 0 2px 4px rgba(0,0,0,.04);
	  font-weight : bold;
	  font-family: Raleway, sans-serif;
}

	 table {
     border-collapse: separate;
     border-spacing: 1px;
     text-align: left;
     line-height: 1.5;
     margin : 20px 10px;
     white-space: nowrap;
     padding :40px;'
     border-top: 1px solid #ccc;
     font-size: 16px;
   }
   th {
     width: 150px;
     padding: 10px;
     font-weight: bold;
     vertical-align: top;
     border-bottom: 1px solid #ccc;
     white-space: nowrap;
   }
   td {
     width: 350px;
     padding: 10px;
     vertical-align: top;
     border-bottom: 1px solid #ccc;
     white-space: nowrap;
   }
</style>

<body>
	<!-- Navigation -->
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
         <a class="navbar-brand" href="#">100다방</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarResponsive" aria-controls="navbarResponsive"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
               <li class="nav-item active"></li>
               <li class="nav-item"><a class="nav-link" href="index_main.jsp">메인화면</a></li>
            </ul>
         </div>
      </div>
   </nav>
	
	
	<!-- 회원테이블 조회 -->
	<br><br><br><br><br>
	<div id="option">
		<h3><b>회원정보조회</b></h3><hr>
		<%ArrayList<MemberDTO> memberList = null; %>
		<%MemberDAO dao = new MemberDAO();%>
		<%memberList = dao.select();%>
		<%if(memberList != null){%>
			<table>
				<thead>
				<tr>
					<th>번호</th>
					<th>회원아이디</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>생년월일</th>
					<th>주소</th>
				</tr>
				</thead>
				<tbody>
				<%for(int i = 0; i < memberList.size(); i++) {%>
					<tr>	
						<th><%=i + 1%></th>
						<td><%=memberList.get(i).getId() %></td>
						<td><%=memberList.get(i).getName() %> </td>
						<td><%=memberList.get(i).getTel() %>
						<td><%=memberList.get(i).getBirth()%></td>
						<td><%=memberList.get(i).getAddr() %> </td>
					</tr>
					<%} %>
				</tbody>
			</table>
		<%} %>
		</div>
		
	
</body>
</html>