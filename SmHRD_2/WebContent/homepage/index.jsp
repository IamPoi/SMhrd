<%@page import="com.model.ImdaeSearchDTO"%>
<%@page import="com.model.Rent_searchDTO"%>
<%@page import="com.model.Apt_name_searchDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Main_filterDAO"%>
<%@page import="com.model.Main_filterDTO"%>
<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>APT Homepage</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/shop-homepage.css" rel="stylesheet">
<link href="./main.css" rel="stylesheet">

<style type="text/css">
table, td {
	border: 1px solid black;
}

table {
	width: 60%;
	height: 100px;
	margin: auto;
	text-align: center;
}

#basic, #junwall, #mat, #imdae {
	display : none;
}
div{
	
}
</style>

</head>

<body>


	<%
	//전역 변수 만들어주기.
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	Main_filterDAO dao = new Main_filterDAO();
	ArrayList<Main_filterDTO> AptSearchList = null;
	ArrayList<Main_filterDTO> DongSearchList = null;
	ArrayList<Rent_searchDTO> RentSearchList = null;
	ArrayList<Main_filterDTO> MatSearchList = null;
	ArrayList<ImdaeSearchDTO> ImdaeSearchList = null;

	if (info != null) {
		/*여긴 기본필터가 아닌 맞춤필터 시에 필요한 부분 */
	}
	%>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">Leader</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- 회원가입 및 마이페이지 -->
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="#">메인
							<span class="sr-only">(current)</span>
					</a></li>
					<%if (info != null) {%>
						<li class="nav-item">
						<%if (info.getId().equals("admin")) {%> 
							<a class="nav-link" href="select.jsp">회원정보 관리</a></li>
						<%}%>
							<li class="nav-item"><a class="nav-link" href="mypage.jsp">마이페이지</a></li>
							<li class="nav-item"><a class="nav-link" href="LogoutService.do">로그아웃</a></li>
						<%} else {%>
							<li class="nav-item"><a class="nav-link" href="join.html">회원가입</a></li>
							<li class="nav-item"><a class="nav-link" href="login.html">로그인</a></li>
						<%}%>
				</ul>
			</div>
		</div>
	</nav>


	<!-- 메뉴페이지 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<h1 class="my-4">매물</h1>
				<div class="list-group">
					<a href="index_maemae.jsp" class="list-group-item" id="check1">매물</a> 
					<a href="index_rent.jsp" class="list-group-item" id="check2">전 월세</a>
				</div>
				<h1 class="my-4">특별 필터</h1>
				<div class="list-group">
					<a href="index_mat.jsp" class="list-group-item" id="check3">맞춤</a> 
					<a href="index_imdae.jsp" class="list-group-item" id="check4">임대</a>
				</div>
				<h1 class="my-4">가격 예측</h1>
				<div class="list-group">
					<a href="price.jsp" class="list-group-item" id="check2">가격 예측</a>
				</div>
			</div>
		</div>
	</div>

	<!-- 매매 -->
	<div id="basic" class = "raw">
		<h1>매물</h1>
		<form action="SearchService.do" method="post">
			<!-- radio를 사 -->
			아파트<input type="radio" name="table" value="apt_name"> 
			동<input	type="radio" name="table" value="dong"> 
			검색 : <input type="text" name="search"> 
			<input type="submit" value="검색">
		</form>
	</div>
	

	<div id="basic">
		<%DongSearchList = (ArrayList<Main_filterDTO>) session.getAttribute("DongSearchList");
			if (DongSearchList != null) {
				System.out.print("동 성공!!");
				System.out.print(DongSearchList.size());%>
		<table>
			<tr>
				<td>즐겨찾기</td>
				<td>번호</td>
				<td>매매 번호</td>
				<td>아파트 이름</td>
				<td>동 이름</td>
				<td>가격</td>
				<td>건축 년도</td>
				<td>거래 년도</td>
				<td>월</td>
				<td>일</td>
				<td>평수</td>
				<td>층</td>
			</tr>

			<%for (int i = 0; i < DongSearchList.size(); i++) {%>
			<tr>
				<td><input type="checkbox" value=""></td>
				<td><%=i + 1%></td>
				<td><%=DongSearchList.get(i).getMaemae_num()%></td>
				<td><%=DongSearchList.get(i).getApt_name()%></td>
				<td><%=DongSearchList.get(i).getDong()%></td>
				<td><%=DongSearchList.get(i).getPrice()%></td>
				<td><%=DongSearchList.get(i).getBuild_year()%></td>
				<td><%=DongSearchList.get(i).getYear()%></td>
				<td><%=DongSearchList.get(i).getMonth()%></td>
				<td><%=DongSearchList.get(i).getDay()%></td>
				<td><%=DongSearchList.get(i).getApt_size()%></td>
				<td><%=DongSearchList.get(i).getFloor()%></td>
			</tr>

			<%}%>
		</table>
		<%}%>

		<%AptSearchList = (ArrayList<Main_filterDTO>) session.getAttribute("AptSearchList");
			if (AptSearchList != null) {
				System.out.print("아파트 성공!");%>
		<table>
			<tr>
				<td>즐겨찾기</td>
				<td>번호</td>
				<td>매매 번호</td>
				<td>아파트 이름</td>
				<td>동 이름</td>
				<td>가격</td>
				<td>건축 년도</td>
				<td>거래 년도</td>
				<td>월</td>
				<td>일</td>
				<td>평수</td>
				<td>층</td>
			</tr>

			<%for (int i = 0; i < AptSearchList.size(); i++) {%>
			<tr>
				<td><input type="checkbox" value="1"></td>
				<td><%=i + 1%></td>
				<td><%=AptSearchList.get(i).getMaemae_num()%></td>
				<td><%=AptSearchList.get(i).getApt_name()%></td>
				<td><%=AptSearchList.get(i).getDong()%></td>
				<td><%=AptSearchList.get(i).getPrice()%></td>
				<td><%=AptSearchList.get(i).getBuild_year()%></td>
				<td><%=AptSearchList.get(i).getYear()%></td>
				<td><%=AptSearchList.get(i).getMonth()%></td>
				<td><%=AptSearchList.get(i).getDay()%></td>
				<td><%=AptSearchList.get(i).getApt_size()%></td>
				<td><%=AptSearchList.get(i).getFloor()%></td>
			</tr>

			<%}%>
		</table>
		<%}%>
	</div>

	<!-- 전 월세 -->
	<div id="junwall">
		<h1>전 월세</h1>
		<form action="RentSearchService.do" method="post">
			<!-- radio를 사 -->
			아파트<input type="radio" name="table" value="apt_name"> 
			동<input	type="radio" name="table" value="dong"> 
			검색 : <input type="text" name="rent_search"> 
			<input type="submit" value="검색">
		</form>

		<!--  <img class="d-block img-fluid" src="./img/white-img.jpg" alt="First slide"> 이미지 파일 넣는 곳-->


		<div id="row">
			<%RentSearchList = (ArrayList<Rent_searchDTO>) session.getAttribute("RentSearchList");
			if (RentSearchList != null) {%>
			<table>
				<tr>
					<td>즐겨찾기</td>
					<td>번호</td>
					<td>동</td>
					<td>빌드 번호</td>
					<td>보증금</td>
					<td>월세</td>
					<td>아파트 이름</td>
					<td>건축 년도</td>
					<td>거래 년도</td>
					<td>월</td>
					<td>일</td>
					<td>평 수</td>
					<td>층</td>
				</tr>
				<%for (int i = 0; i < RentSearchList.size(); i++) {%>
				<tr>
					<td><input type="checkbox" value=""></td>
					<td><%=i + 1%></td>
					<td><%=RentSearchList.get(i).getDong()%></td>
					<td><%=RentSearchList.get(i).getBuild_year()%></td>
					<td><%=RentSearchList.get(i).getDeposit()%></td>
					<td><%=RentSearchList.get(i).getLoyer()%></td>
					<td><%=RentSearchList.get(i).getApt_name()%></td>
					<td><%=RentSearchList.get(i).getBuild_year()%></td>
					<td><%=RentSearchList.get(i).getYear()%></td>
					<td><%=RentSearchList.get(i).getMonth()%></td>
					<td><%=RentSearchList.get(i).getDate()%></td>
					<td><%=RentSearchList.get(i).getApt_size()%></td>
					<td><%=RentSearchList.get(i).getFloor()%></td>
				</tr>

				<%}%>
			</table>
			<%}%>
		</div>
	</div>
	
	<!-- 맞춤 -->
	<div id="mat">
		<h1>맞춤</h1>
		<select name="mat_select">
			<option value="crime">범죄자</option>
			<option value="charge">전기차 충전소</option>
			<option value="subway">지하철</option>
			<option value="coffee">스타벅스</option>
			<option value="movie">영화관</option>
		</select>

		<form action="MatSearchService.do" method="post">
			동으로 검색 : <input type="text" name="mat_search"> 
			<input type="submit" value="검색">
		</form>

		<!--  <img class="d-block img-fluid" src="./img/white-img.jpg" alt="First slide"> 이미지 파일 넣는 곳-->

		<%MatSearchList = (ArrayList<Main_filterDTO>) session.getAttribute("mat_search");
			if (MatSearchList != null) {%>
		<table>
			<tr>
				<td>즐겨찾기</td>
				<td>번호</td>
				<td>맞춤 선택</td>
				<td>매매 번호</td>
				<td>동</td>
				<td>가격</td>
				<td>건축년도</td>
				<td>이름</td>
				<td>거래 년도</td>
				<td>월</td>
				<td>일</td>
				<td>평 수</td>
				<td>층</td>
			</tr>
			<%for (int i = 0; i < MatSearchList.size(); i++) {%>
			<tr>
				<td><input type="checkbox" value=""></td>
				<td><%=i + 1%></td>
				<td></td>
				<%if (false) {%>
				<td><%=MatSearchList.get(i).getCrime()%></td>
				<td><%=MatSearchList.get(i).getCharge()%></td>
				<td><%=MatSearchList.get(i).getStarbucks()%></td>
				<td><%=MatSearchList.get(i).getSubway()%></td>
				<td><%=MatSearchList.get(i).getMovie()%></td>
				<%}%>

				<td><%=MatSearchList.get(i).getMaemae_num()%></td>
				<td><%=MatSearchList.get(i).getDong()%></td>
				<td><%=MatSearchList.get(i).getPrice()%></td>
				<td><%=MatSearchList.get(i).getBuild_year()%></td>
				<td><%=MatSearchList.get(i).getApt_name()%></td>
				<td><%=MatSearchList.get(i).getYear()%></td>
				<td><%=MatSearchList.get(i).getMonth()%></td>
				<td><%=MatSearchList.get(i).getDay()%></td>
				<td><%=MatSearchList.get(i).getApt_size()%></td>
				<td><%=MatSearchList.get(i).getFloor()%></td>

			</tr>
			<%}%>
		</table>
		<%}%>
	</div>

	<!-- 맞춤 -->


	<!-- 임대 -->
	<div id="imdae">
		<h1>임대</h1>
		<form action="ImdaeSearchService.do" method="post">
			<!-- radio를 사 -->
			아파트<input type="radio" name="search_type" value="apt_name"> 
			동<input	type="radio" name="search_type" value="dong"> 
			검색 : <input type="text" name="imdae_search"> 
			<input type="submit" value="검색">
		</form>


		<%ImdaeSearchList = (ArrayList<ImdaeSearchDTO>) session.getAttribute("ImdaeSearchList");
			if (ImdaeSearchList != null) {%>
		<table>
			<tr>
				<td>즐겨찾기</td>
				<td>번호</td>
				<td>임대 번호</td>
				<td>동 이름</td>
				<td>아파트 이름</td>
				<td>임대 크기</td>
				<td>보증금</td>
				<td>월세</td>
				<td>총 세대수</td>
				<td>세대수</td>
				<td>임대 정보</td>
				<td>공급 유형</td>
				<td>최초 입주</td>
			</tr>

			<%for (int i = 0; i < ImdaeSearchList.size(); i++) {%>
			<tr>
				<td><input type="checkbox" value=""></td>
				<td><%=i + 1%></td>
				<td><%=ImdaeSearchList.get(i).getImdae_num()%></td>
				<td><%=ImdaeSearchList.get(i).getRegion()%></td>
				<td><%=ImdaeSearchList.get(i).getDong()%></td>
				<td><%=ImdaeSearchList.get(i).getImdae_name()%></td>
				<td><%=ImdaeSearchList.get(i).getImdae_size()%></td>
				<td><%=ImdaeSearchList.get(i).getDeposit()%></td>
				<td><%=ImdaeSearchList.get(i).getMonth_pay()%></td>
				<td><%=ImdaeSearchList.get(i).getTotal_cnt()%></td>
				<td><%=ImdaeSearchList.get(i).getCnt()%></td>
				<td><%=ImdaeSearchList.get(i).getImdae_div()%></td>
				<td><%=ImdaeSearchList.get(i).getMove_into_date()%></td>
			</tr>

			<%}%>
		</table>
		<%}%>
	</div>


	<!-- 임대 -->





	<!-- Footer -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<footer class="py-5 bg-dark">

		<div class="container">
			<p class="m-0 text-center text-white">Copyright & copy;
				YourWebsite 2020</p>
		</div>
		<!-- /.container -->


	</footer>



	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="./vendor/jquery/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		
		
	</script>

</body>

</html>
