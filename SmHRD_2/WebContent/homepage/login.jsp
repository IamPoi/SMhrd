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

<title>로그인</title>
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
	<!-- 상단메뉴 조정 -->
	<nav class="navbar navbar-expand-lg navbar-light navbar-laravel">
		<div class="container">
			<a class="navbar-brand" href="#">100다방</a> 
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="join.jsp">회원가입</a></li>
					<li class="nav-item"><a class="nav-link" href="index_main.jsp">메인화면</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<br>
	
	
	<%String fail = (String)session.getAttribute("fail"); %>
	
	<!-- 로그인 입력창 -->
	<main class="my-form">
		<div class="cotainer">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="card">
						<div class="card-header">로그인</div>
						<div class="card-body">
							<form name="my-form" onsubmit="return validform()" action="LoginService.do" method="post"> 
								<div class="form-group row">
									<label for="full_name"
										class="col-md-4 col-form-label text-md-right">아이디</label>
									<div class="col-md-6">
										<input type="text" id="id" class="form-control" name="id">
									</div>
								</div>

								<div class="form-group row">
									<label for="email_address"
										class="col-md-4 col-form-label text-md-right">비밀번호</label>
									<div class="col-md-6">
										<input type="password" id="pw" class="form-control" name="pw">
									</div>
								</div>

								<div class="col-md-6 offset-md-4">
									<button type="submit" class="btn btn-primary" name="submit">Login</button>
									<%if(fail != null){%>
									<h7 style="color: tomato">아이디 또는 비밀번호를 확인해주세요.</h7>
									<%}%>
								</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		</div>
		

	</main>
	<script src="./js/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


<footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">스마트인재개발원 2차프로젝트 Leader</p>
    </div>
</footer>
</body>
</html>