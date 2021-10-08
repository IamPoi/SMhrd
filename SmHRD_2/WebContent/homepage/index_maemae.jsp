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
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>광주아파트가격예측</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/shop-homepage.css" rel="stylesheet">
</head>

<style type="text/css">

.navbar-brand{
      font-size : 30px;
      font-weight : bold;
   }
   .my-4{
      font-weight : bold;
   }
   .green_window {
      display: inline-block;
      width: 500px; height: 40px;
      border: 3px solid #1b5ac2;
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
      background: #1b5ac2;
      color: white;
      font-weight: bold;
      border-radius: 1px;
      cursor: pointer;
   }
   .SelectSearch{
      width: 120px; height: 40px;
      border: 3px solid #1b5ac2;
      background: white;
      vertical-align: top;
   }
   .unit{
      text-align: right;
      font-size : 12px;
   }
	
   table {
     border-collapse: separate;
     border-spacing: 1px;
     text-align: left;
     line-height: 1.5;
     border-top: 1px solid #ccc;
     margin : 20px 10px;
     white-space: nowrap;
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
   #junwall, #mat, #imdae {
      display: none;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
</style>

</head>

<body>

   <!-- Navigation -->
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
         <a class="navbar-brand" href="index_main.jsp">100다방</a>
         <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarResponsive" aria-controls="navbarResponsive"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
               <li class="nav-item active">
                  <%
                  //전역 변수 만들어주기.
                  MemberDTO info = (MemberDTO) session.getAttribute("info");
                  Main_filterDAO dao = new Main_filterDAO();
                  ArrayList<Main_filterDTO> AptSearchList = null;
                  ArrayList<Main_filterDTO> DongSearchList = null;
                  ArrayList<Rent_searchDTO> RentSearchList = null;
                  ArrayList<Main_filterDTO> MatSearchList = null;
                  ArrayList<ImdaeSearchDTO> ImdaeSearchList = null;
                  String mat_select = null;


                  if (info != null) {
                     /*여긴 기본필터가 아닌 맞춤필터 시에 필요한 부분 */
                  }%> 
                  
                  
                  <%if (info != null) {%>
               
               <li class="nav-item">
                  <%if (info.getId().equals("admin")) {%>
                  <a class="nav-link" href="select.jsp">회원정보 관리</a> 
                  <%}%>
               </li>
               <li class="nav-item"><a class="nav-link" href="favorite.jsp">즐겨찾기</a></li>
               <li class="nav-item"><a class="nav-link" href="mypage.jsp">마이페이지</a></li>
               <li class="nav-item"><a class="nav-link"
                  href="LogoutService.do">로그아웃</a></li>
               <%} else {%>
               <li class="nav-item"><a class="nav-link" href="join.jsp">회원가입</a></li>
               <li class="nav-item"><a class="nav-link" href="login.jsp">로그인</a></li>
               <%}%>
               </li>
            </ul>
         </div>
      </div>
   </nav>

   <!--사이드메뉴-->
   <div class="container">
      <div class="row">
         <div class="col-lg-3">
            <h4 class="my-4">매물</h4>
            <div class="list-group">
               <a href="index_maemae.jsp" class="list-group-item" id="check1">매매</a> 
               <a href="index_rent.jsp" class="list-group-item" id="check2">전월세</a>
            </div>
            <h4 class="my-4">필터</h4>
            <div class="list-group">
               <a href="index_mat.jsp" class="list-group-item" id="check3">맞춤</a>
               <%if(info != null){%>
               <a href="index_imdae.jsp" class="list-group-item">임대</a>
               <%}else {%>
               <a href="" class="list-group-item" id="fake1">임대</a>
               <%} %>               
            </div>
            <h4 class="my-4">예측</h4>
            <div class="list-group">
               <%if(info != null){%>
               <a href="price.jsp" class="list-group-item" id="">가격 예측</a>
               <%}else {%>
                  <a href="" class="list-group-item" id="fake2">가격 예측</a>
                  <%}%>
            </div>
         </div>

		<!-- 매매 -->
        <div class="col-lg-9">
			<div id="basic" class="raw">
		      <br><br>
		      <h5>어떤 매물을 찾고 계시나요?</h5><br>
		      <div>
		     	
				<form action="SearchService.do" method="post">
				
         <!-- 옵션선택 -->
         <select class='SelectSearch' name="table">
            <option value='dong'>법정동</option>
            <option value='apt_name'>아파트</option>
         </select>
         <span class='green_window'>
            <input type="text" class='input_text' name="search" onkeydown="enterSearch()"
                  placeholder="검색어를 입력하세요">
         </span>
            <button type="submit" class="sch_smit">검색</button>
         </form>
         </div>
		<!-- 즐겨찾기 -->  
          <%if(info !=null) {%>
          <form action="FavoriteService.do" method="post">
			<select class='SelectSearch' name="type">
				<option value='maemae' selected="selected">매매번호</option>
			</select>
			<span class='green_window'>
				<input type="number" class='input_text' name="num" onkeydown="enterSearch()"
						placeholder="관심있는 매물을 추가해주세요!">
			</span>
				<button type="submit" class="sch_smit" id = "add">추가</button>
			</form>
			<%} %>
			
			 <div class="unit"> (단위 : 백만원)</div>
		<!-- 동으로 조회 -->
          <%DongSearchList = (ArrayList<Main_filterDTO>) session.getAttribute("DongSearchList");
          if (DongSearchList != null) {
             System.out.print("동 성공!!");
             System.out.print(DongSearchList.size());%>
             
<<<<<<< HEAD
             
             <div id="map" style="width: 100%; height: 300px;"></div>
						<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=a19ab035edef253fb248a91c1d82a9ff&libraries=services"></script>
						<script>
							
						// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
						var infowindow = new kakao.maps.InfoWindow({
							zIndex : 1
						});
				
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(35.16023446394114, 126.8514006960729), // 지도의 중심좌표
							level : 5
						// 지도의 확대 레벨
						};
				
						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption);
				
						// 장소 검색 객체를 생성합니다
						var ps = new kakao.maps.services.Places();
						
				
						// 키워드로 장소를 검색합니다
						ps.keywordSearch("광주광역시 아파트"+"<%=DongSearchList.get(0).getDong() %>", placesSearchCB);
				
						// 키워드 검색 완료 시 호출되는 콜백함수 입니다
						function placesSearchCB(data, status, pagination) {
							if (status === kakao.maps.services.Status.OK) {
				
								// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
								// LatLngBounds 객체에 좌표를 추가합니다
								var bounds = new kakao.maps.LatLngBounds();
				
								for (var i = 0; i < data.length; i++) {
									displayMarker(data[i]);
									bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
								}
				
								// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
								map.setBounds(bounds);
							}
						}
				
						// 지도에 마커를 표시하는 함수입니다
						function displayMarker(place) {
				
							// 마커를 생성하고 지도에 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : new kakao.maps.LatLng(place.y, place.x)
							});
				
							// 마커에 클릭이벤트를 등록합니다
							kakao.maps.event.addListener(marker, 'click', function() {
								// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
								infowindow.setContent('<div style="padding:6px;font-size:11px;">' + place.place_name + '</div>');
								infowindow.open(map, marker);
							});
						}
					</script>
             
=======
             <div id="map" style="width: 100%; height: 300px;"></div>
                  <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=a19ab035edef253fb248a91c1d82a9ff&libraries=services"></script>
                  <script>
                     
                  // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
                  var infowindow = new kakao.maps.InfoWindow({
                     zIndex : 1
                  });
            
                  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                  mapOption = {
                     center : new kakao.maps.LatLng(35.16023446394114, 126.8514006960729), // 지도의 중심좌표
                     level : 5
                  // 지도의 확대 레벨
                  };
            
                  // 지도를 생성합니다    
                  var map = new kakao.maps.Map(mapContainer, mapOption);
            
                  // 장소 검색 객체를 생성합니다
                  var ps = new kakao.maps.services.Places();
                  
            
                  // 키워드로 장소를 검색합니다
                  ps.keywordSearch("광주광역시 아파트"+"<%=DongSearchList.get(0).getDong() %>", placesSearchCB);
            
                  // 키워드 검색 완료 시 호출되는 콜백함수 입니다
                  function placesSearchCB(data, status, pagination) {
                     if (status === kakao.maps.services.Status.OK) {
            
                        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                        // LatLngBounds 객체에 좌표를 추가합니다
                        var bounds = new kakao.maps.LatLngBounds();
            
                        for (var i = 0; i < data.length; i++) {
                           displayMarker(data[i]);
                           bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                        }
            
                        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                        map.setBounds(bounds);
                     }
                  }
            
                  // 지도에 마커를 표시하는 함수입니다
                  function displayMarker(place) {
            
                     // 마커를 생성하고 지도에 표시합니다
                     var marker = new kakao.maps.Marker({
                        map : map,
                        position : new kakao.maps.LatLng(place.y, place.x)
                     });
            
                     // 마커에 클릭이벤트를 등록합니다
                     kakao.maps.event.addListener(marker, 'click', function() {
                        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                        infowindow.setContent('<div style="padding:6px;font-size:11px;">' + place.place_name + '</div>');
                        infowindow.open(map, marker);
                     });
                  }
               </script>
>>>>>>> branch 'master' of https://github.com/sincerity1129/project.git
             
             <table>
				<thead>
				<tr>
					<th>번호</th>
					<th>매매번호</th>
					<th>아파트명</th>
					<th>법정동</th>
					<th>실거래가</th>
					<th>건축년도</th>
					<th>거래 년</th>
					<th>월</th>
					<th>일</th>
					<th>평수</th>
					<th>층</th>
				</tr>
			</thead>
			
			<%if (DongSearchList.size() == 0) {%>
							<tr>
								<td colspan=12>매물이 없습니다.</td>
							</tr>
							<%}%>
                  <%for (int i = 0; i <DongSearchList.size(); i++) {%>
                  <tr>
                     <th><%=i + 1%></th>
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

			<!-- 아파트로 조회하기 -->
               <%AptSearchList = (ArrayList<Main_filterDTO>) session.getAttribute("AptSearchList");
               if (AptSearchList != null) {
                  System.out.print("아파트 성공!");%>
                  
<<<<<<< HEAD
                   <div id="map" style="width: 100%; height: 300px;"></div>
						<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=a19ab035edef253fb248a91c1d82a9ff&libraries=services"></script>
						<script>
							
						// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
						var infowindow = new kakao.maps.InfoWindow({
							zIndex : 1
						});
				
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(35.16023446394114, 126.8514006960729), // 지도의 중심좌표
							level : 5
						// 지도의 확대 레벨
						};
				
						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption);
				
						// 장소 검색 객체를 생성합니다
						var ps = new kakao.maps.services.Places();
						
				
						// 키워드로 장소를 검색합니다
						ps.keywordSearch("광주광역시 아파트"+"<%=AptSearchList.get(0).getApt_name() %>", placesSearchCB);
				
						// 키워드 검색 완료 시 호출되는 콜백함수 입니다
						function placesSearchCB(data, status, pagination) {
							if (status === kakao.maps.services.Status.OK) {
				
								// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
								// LatLngBounds 객체에 좌표를 추가합니다
								var bounds = new kakao.maps.LatLngBounds();
				
								for (var i = 0; i < data.length; i++) {
									displayMarker(data[i]);
									bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
								}
				
								// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
								map.setBounds(bounds);
							}
						}
				
						// 지도에 마커를 표시하는 함수입니다
						function displayMarker(place) {
				
							// 마커를 생성하고 지도에 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : new kakao.maps.LatLng(place.y, place.x)
							});
				
							// 마커에 클릭이벤트를 등록합니다
							kakao.maps.event.addListener(marker, 'click', function() {
								// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
								infowindow.setContent('<div style="padding:6px;font-size:11px;">' + place.place_name + '</div>');
								infowindow.open(map, marker);
							});
						}
					</script>
             
=======
                  
                  <div id="map" style="width: 100%; height: 300px;"></div>
                  <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=a19ab035edef253fb248a91c1d82a9ff&libraries=services"></script>
                  <script>
                     
                  // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
                  var infowindow = new kakao.maps.InfoWindow({
                     zIndex : 1
                  });
            
                  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                  mapOption = {
                     center : new kakao.maps.LatLng(35.16023446394114, 126.8514006960729), // 지도의 중심좌표
                     level : 5
                  // 지도의 확대 레벨
                  };
            
                  // 지도를 생성합니다    
                  var map = new kakao.maps.Map(mapContainer, mapOption);
            
                  // 장소 검색 객체를 생성합니다
                  var ps = new kakao.maps.services.Places();
                  
            
                  // 키워드로 장소를 검색합니다
                  
                  ps.keywordSearch("광주광역시 아파트"+"<%=AptSearchList.get(0).getApt_name() %>", placesSearchCB);
            
                  // 키워드 검색 완료 시 호출되는 콜백함수 입니다
                  function placesSearchCB(data, status, pagination) {
                     if (status === kakao.maps.services.Status.OK) {
            
                        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                        // LatLngBounds 객체에 좌표를 추가합니다
                        var bounds = new kakao.maps.LatLngBounds();
            
                        for (var i = 0; i < data.length; i++) {
                           displayMarker(data[i]);
                           bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                        }
            
                        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                        map.setBounds(bounds);
                     }
                  }
            
                  // 지도에 마커를 표시하는 함수입니다
                  function displayMarker(place) {
            
                     // 마커를 생성하고 지도에 표시합니다
                     var marker = new kakao.maps.Marker({
                        map : map,
                        position : new kakao.maps.LatLng(place.y, place.x)
                     });
            
                     // 마커에 클릭이벤트를 등록합니다
                     kakao.maps.event.addListener(marker, 'click', function() {
                        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                        infowindow.setContent('<div style="padding:6px;font-size:11px;">' + place.place_name + '</div>');
                        infowindow.open(map, marker);
                     });
                  }
               </script>
>>>>>>> branch 'master' of https://github.com/sincerity1129/project.git
                  
                  
               <table>
                 <thead>
					<tr>
						<th>번호</th>
						<th>매매번호</th>
						<th>아파트명</th>
						<th>법정동</th>
						<th>실거래가</th>
						<th>건축년도</th>
						<th>거래 년</th>
						<th>월</th>
						<th>일</th>
						<th>평수</th>
						<th>층</th>
					</tr>
				</thead>
				<%if (AptSearchList.size() == 0) {%>
							<tr>
								<td colspan=12>매물이 없습니다.</td>
							</tr>
							<%}%>
                  <%for (int i = 0; i < AptSearchList.size(); i++) {%>
                  <tr>
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
          

            <!-- 맞춤 -->
            <div id="mat">
               <h1>맞춤</h1>
               <form action="MatSearchService.do" method="post">
                  <select name="mat_select">
                     <option value="crime">범죄자 수</option>
                     <option value="charge">전기차 충전소</option>
                     <option value="subway">지하철</option>
                     <option value="coffee">스타벅스</option>
                     <option value="movie">영화관</option>
                  </select> 동으로 검색 : <input type="text" name="mat_search"> 
                     <%if(info != null){%>
                  <input type="submit" value="검색">
                  <%}else{%>
                     로그인하여 검색기능 잠금해제.
                  <%}%>
                  
               </form>

               <!--  <img class="d-block img-fluid" src="./img/white-img.jpg" alt="First slide"> 이미지 파일 넣는 곳-->
               <%mat_select = (String) session.getAttribute("mat_select");
               MatSearchList = (ArrayList<Main_filterDTO>) session.getAttribute("mat_search");
               if (MatSearchList != null) {%>
               <table>
                  <tr>
                     <td>즐겨찾기</td>
                     <td>번호</td>
                     <%if (mat_select.equals("crime")) {%>
                     <td>범죄자 수</td>
                     <%}%>
                     <%if (mat_select.equals("charge")) {%>
                     <td>전기차 충전소</td>
                     <%}%>
                     <%if (mat_select.equals("subway")) {%>
                     <td>지하철</td>
                     <%}%>
                     <%if (mat_select.equals("coffee")) {%>
                     <td>스타벅스</td>
                     <%}%>
                     <%if (mat_select.equals("movie")) {%>
                     <td>영화관</td>
                     <%}%>
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
                     <%if (mat_select.equals("crime")) {%>
                     <td><%=MatSearchList.get(i).getCrime()%></td>
                     <%}%>
                     <%if (mat_select.equals("charge")) {%>
                     <td><%=MatSearchList.get(i).getCharge()%></td>
                     <%}%>
                     <%if (mat_select.equals("subway")) {%><td>
                     <%=MatSearchList.get(i).getSubway()%></td>
                     <%}%>
                     <%if (mat_select.equals("coffee")) {%>
                     <td><%=MatSearchList.get(i).getStarbucks()%></td>
                     <%}%>
                     <%if (mat_select.equals("movie")) {%>
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

					<% %>

            <!-- 임대 -->
            <div id="imdae">

               <h1>임대</h1>
               <form action="ImdaeSearchService.do" method="post">

                  <!-- radio를 사 -->
                  구<input type="radio" name="search_type" value="region"> 
                  동<input type="radio" name="search_type" value="dong"> 
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

         </div>
         <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->

   </div>
   <!-- /.container -->
   
   
   <br>
   <br>
   <br>

   <!-- Bootstrap core JavaScript -->
   <script src="vendor/jquery/jquery.min.js"></script>
   <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <script src="./vendor/jquery/jquery-3.6.0.min.js"></script>
   <script type="text/javascript">
   $("#add").click(function(){
		alert('즐겨찾기 추가 성공');
	});
   $('#fake').click(function(){
		alert('로그인을해주세요');
	});
	$('#fake1').click(function(){
		alert('로그인을해주세요');
	});
	$('#fake2').click(function(){
		alert('로그인을해주세요');
	});
      
   </script>


</body>

</html>