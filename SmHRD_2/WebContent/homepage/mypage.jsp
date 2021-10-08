<!DOCTYPE html>
<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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

<title>정보수정</title>
</head>
<style>
	body{
	    margin: 0;
	    font-size: .9rem;
	    font-weight: 400;
	    line-height: 1.6;
	    color: #212529;
	    text-align: left;
	    background-color: #f5f8fa;
	}
	
	.navbar-laravel
	{
	    box-shadow: 0 2px 4px rgba(0,0,0,.04);
	}
	
	.navbar-brand , .nav-link, .my-form, .login-form
	{
	    font-weight : bold;
	    font-family: Raleway, sans-serif;
	}
	
	.my-form
	{
	    padding-top: 1.5rem;
	    padding-bottom: 1.5rem;
	}
	
	.my-form .row
	{
	    margin-left: 0;
	    margin-right: 0;
	}
	
	.login-form
	{
	    padding-top: 1.5rem;
	    padding-bottom: 1.5rem;
	}
	
	.login-form .row
	{
	    margin-left: 0;
	    margin-right: 0;
	}
</style>
<body>
	<script src="./js/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<%
	MemberDTO loginDto = (MemberDTO)session.getAttribute("info");
%>
	<!-- 상단메뉴 조정 -->
	<nav class="navbar navbar-expand-lg navbar-light navbar-laravel">
		<div class="container">
			<a class="navbar-brand" href="index_main.jsp">100다방</a> 
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="index_main.jsp">메인화면</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<br>
	
	<!--회원정보 수정창 -->
	<main class="my-form">
		<div class="cotainer">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="card">
						<div class="card-header">회원정보수정</div>
						<div class="card-body">
							<form name="my-form" onsubmit="return validform()" action="UpdateService.do" method="post">
							<%if(loginDto!=null){ %>
								<li><%=loginDto.getName()%>님 정보수정</li>
							<%} %>
							
								<div class="form-group row">
									<label for="full_name"
										class="col-md-4 col-form-label text-md-right">아이디</label>
									<div class="col-md-6">
										<%if(loginDto!=null){ %>
											<li><%=loginDto.getId() %></li>
										<%} %>
									</div>
								</div>
								
								<div class="form-group row">
									<label for="email_address"
										class="col-md-4 col-form-label text-md-right">비밀번호</label>
									<div class="col-md-6">
										<input type="password" id = "pw1" class="form-control" class="form-control" name="pw" required/>
									</div>				
								</div>
								
								<div class="form-group row">
									<label for="email_address"
										class="col-md-4 col-form-label text-md-right">비밀번호확인</label>
									<div class="col-md-6">
									<input type="password" id = "pw2" class="form-control" class="form-control" name="rePw" required/>									
									<h7 class="alert-success" id = "alert-success">비밀번호가 일치합니다.</h7>
									<h7 class="alert-danger" id = "alert-danger">비밀번호가 일치하지 않습니다.</h7>
									</div>
								</div>
								
								<script type="text/javascript">
								$(function(){
								$("#alert-success").hide();
								$("#alert-danger").hide();
								$(".form-control").keyup(function(){
									var pw1 =$("#pw1").val();
									var pw2 =$("#pw2").val();
									
									if(pw1 != "" || pw2 != ""){
										if(pw1 != pw2){
											$("#alert-success").hide();
											$("#alert-danger").show();
											$("#submit").removeAttr("disabled", "disabled");
										}else{
											$("#alert-success").show();
											$("#alert-danger").hide();
											$("#submit").removeAttr("disabled");
										}
									}
								});
								});
								</script>
								
								<div class="form-group row">
									<label for="user_name"
										class="col-md-4 col-form-label text-md-right">이름</label>
									<div class="col-md-6">
										<input type="text" id="name" class="form-control" name="name">
									</div>
								</div>

								<div class="form-group row">
									<label for="phone_number"
										class="col-md-4 col-form-label text-md-right">핸드폰번호</label>
									<div class="col-md-6">
										<input type="text" id="tel" class="form-control" name="tel">
									</div>
								</div>

								<div class="form-group row">
									<label for="permanent_address"
										class="col-md-4 col-form-label text-md-right">생년월일</label>
									<div class="col-md-6">
										<input type="text" id="birth" class="form-control"
											name="birth">
									</div>
								</div>

								<div class="form-group row">
									<label for="present_address"
										class="col-md-4 col-form-label text-md-right">주소(동)</label>
									<div class="col-md-6">
										<input type="text" id="addr" class="form-control" name="addr">
									</div>
								</div>

								<div class="col-md-6 offset-md-4">
									<button type="submit" class="btn btn-primary" name="submit">수정완료</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</main>
	
	<script>

function validform() {

    var b = document.forms["my-form"]["pw"].value;
    var c = document.forms["my-form"]["name"].value;
    var d = document.forms["my-form"]["tel"].value;
    var e = document.forms["my-form"]["birth"].value;
    var f = document.forms["my-form"]["addr"].value;

	 if (b==null || b=="")
    {
        alert("비밀번호를 입력해주세요!");
        return false;
    }else if (c==null || c=="")
    {
        alert("이름을 입력해주세요!");
        return false;
    }else if (d==null || d=="")
    {
        alert("전화번호를 입력해주세요! ex)010-1111-2222");
        return false;
    }else if (e==null || e=="")
    {
        alert("생년월일을 입력해주세요! ex)1991.01.01");
        return false;
    }else if (f==null || f=="")
    {
        alert("주소(법정동)를 입력해주세요! ex)봉선동");
        return false;
    }

}
</script>

<footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">스마트인재개발원 2차프로젝트 Leader</p>
    </div>
    <!-- /.container -->
 </footer>
</body>
</html>