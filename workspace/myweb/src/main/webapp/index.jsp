<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./bbs/ssi.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>index.jsp</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"><!-- w3 css import -->
  
  <!-- 사용자 정의 스타일과 자바스크립트 -->
  <!-- 주의사항 : CSS와 JS는 각 웹브라우저에서 쿠키삭제하고 확인할것 -->
  <!-- layout.css import -->
  <link rel="stylesheet" href="./css/layout.css">
  <script src="./js/myscript.js"></script>
  <script>    		
	  function showtimeclock(){
	      const d=new Date();                     //const 상수화. 값을 못바꾼다
	      let today="";
	      today += d.getFullYear() + ".";         //2022.
	      if(d.getMonth()+1<10)today += "0";
	      today += (d.getMonth()+1)+".";          //2022.08.
	      if(d.getDate()<10)today += "0";
	      today += d.getDate();                   //2022.08.10
	      switch(d.getDay()){
	          case 0: today+=" (일) "; break;
	          case 1: today+=" (월) "; break;
	          case 2: today+=" (화) "; break;
	          case 3: today+=" (수) "; break;
	          case 4: today+=" (목) "; break;
	          case 5: today+=" (금) "; break;
	          case 6: today+=" (토) "; break;
	      }                                       //2022.08.10 (수)         
	      if(d.getHours()<12){today += "am "}else{today += "pm "};                                //2022.08.10 (수) pm 
	      if(d.getHours()<13){today += d.getHours()+ ":"}else{today += (d.getHours()-12)+ ":"};   //2022.08.10 (수) pm 4:
	      if(d.getMinutes()<10)today += "0";      
	      today += d.getMinutes()+ ":";           //2022.08.10 (수) pm 4:17:
	      if(d.getSeconds()<10)today += "0";
	      today += d.getSeconds();                //2022.08.10 (수) pm 4:17:20
	
	      document.getElementById("digitclock").innerText=today;
	      timer=setTimeout(showtimeclock, 1000);             //1초 후에 showtimeclock 함수를 호출
	  }//showtimeclock() end
	
	  let timer; //전역변수	        
	
	  function killtimeclock(){
	      clearTimeout(timer);    //시간해제
	  }//killtimeclock() end
  </script>
  <style><!-- 이미지넘김 -->
    @font-face {
	    font-family:"MajestySquare";
	    src:url("./font/MajestySquare.ttf") format("truetype");	    
  	} 
  	@font-face {
	    font-family:"bernadette";
	    src:url("./font/bernadette.ttf") format("truetype");	    
  	} 	
	.mySlides {display:none}
	.w3-left, .w3-right, .w3-badge {cursor:pointer}
	.w3-badge {height:13px;width:13px;padding:0}
  </style>
  <script>
	var slideIndex = 1;
  </script><!-- 이미지넘김 끝 -->
</head>
<body onload="showtimeclock(), showDivs(slideIndex)">

<!-- 메인 카테고리 시작 -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">HOME</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="./bbs/bbsList.jsp">게시판</a></li>
        <li><a href="./notice/noticeList.jsp">공지사항</a></li>
        <li><a href="./member/loginForm.jsp">로그인</a></li>
        <li><a href="./pds/pdsList.jsp">포토갤러리</a></li>
        <li><a href="./mail/mailForm.jsp">메일보내기</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- First Container 시작 -->
<div class="container-fluid bg-1 text-center" style="width:100%">
	<div class="w3-content w3-display-container" style="position:relative; height:820px;">
	  <div class="mySlides">
	    <img src="./images/orange.jpg" style="object-fit:cover; border-radius: 15%; margin:auto; height:820px;" alt="orange">
	    <h3 style="position:absolute; top:20px; color:red; font-family:'bernadette'; font-size: 240px; transform: rotate(20deg);">* ORANGE *</h3>
	    <h3 style="position:absolute; top:32px; color:orange; font-family:'bernadette'; font-size: 240px; transform: rotate(20deg);">* ORANGE *</h3>
	  </div>
	  <div class="mySlides">
	    <img src="./images/watermelon.jpg" style="object-fit:cover; border-radius: 15%; margin:auto; height:820px;" alt="watermelon">
	    <h3 style="position:absolute; top:90px; color:yellow; font-family:'bernadette'; font-size: 140px; transform: rotate(-10deg) skew(0,-15deg);">* WATERMELON *</h3>
	    <h3 style="position:absolute; top:102px; color:green; font-family:'bernadette'; font-size: 140px; transform: rotate(-10deg) skew(0,-15deg);">* WATERMELON *</h3>
	  </div>  
	  <img class="mySlides" src="./images/strawberry.jpg" style="object-fit:cover; border-radius: 15%; margin:auto; height:820px;" alt="strawberry">
	  <img class="mySlides" src="./images/cornflower.jpg" style="object-fit:cover; border-radius: 15%; margin:auto; height:820px;" alt="cornflower">
	  <img class="mySlides" src="./images/grapefruit.jpg" style="object-fit:cover; border-radius: 15%; margin:auto; height:820px;" alt="grapefruit">
	  <div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="width:100%">
	    <div class="w3-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
	    <div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
	    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onmouseover="currentDiv(1)"></span>
	    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onmouseover="currentDiv(2)"></span>
	    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onmouseover="currentDiv(3)"></span>
	    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onmouseover="currentDiv(4)"></span>
	    <span class="w3-badge demo w3-border w3-transparent w3-hover-white" onmouseover="currentDiv(5)"></span>
	  </div>
  </div>
</div><!-- First Container 끝 -->


<!-- Contents 시작 -->
<div class="container-fluid bg-2 text-center">
  <div class="row">
    <div class="col-xs-12">
    	<!-- 본문시작 -->
    		
	    
        <h3>현재 시간은</h3>
        <div id="digitclock"></div>
        <br>
                
        <div class="col-xs-6" style="padding-right: 50px; padding-bottom: 10px;">
        	<h4>*인기 글*</h4>
        	<table class="table table-hover" style="font-size: 15px; table-layout:fixed;">
			<thead>
				<tr>
					<th class="text-center" style="padding-right: 0; padding-left: 0; width:10%">랭킹</th>
					<th style="text-align: left; width:60%">제목</th>
					<th class="text-center">작성자</th>
					<th class="text-center">조회수</th>
				</tr>
			</thead>
			<tbody>
<%
				ArrayList<BbsDTO> hotlist=dao.hotlist();
				if(hotlist==null){
					out.println("<tr>");
					out.println("	<td colspan='3'>");
					out.println("	  <strong>관련자료 없음!!</strong>");
					out.println("	</td>");
					out.println("</tr>");
				}else{
					for(int i=0; i<hotlist.size(); i++){
						dto=hotlist.get(i);
%>
						<tr>
							<td><%=i+1%></td>
							<td style="text-align: left">
<%
								//답변이미지 출력
								for(int n=1; n<=dto.getIndent(); n++){
									out.println("<img src='./images/reply.gif'>");
								}//for end
%>							
								<a href="./bbs/bbsRead.jsp?bbsno=<%=dto.getBbsno()%>"><%=dto.getSubject()%></a>
								<img src='./images/hot.gif'>
							</td>
							<td><%=dto.getWname()%></td>
							<td><%=dto.getReadcnt()%></td>
						</tr>
<%
					}//for end
				}//if end
%>			
			</tbody>
			</table>
			<input type="button" style="position:absolute; font-size: 12px; right:50px; bottom:0px" value="게시판 이동" onclick="location.href='./bbs/bbsList.jsp'">
        </div><!-- 인기글 끝 -->
        
        <div class="col-xs-6" style="padding-left: 50px; padding-right: 0px; padding-bottom: 10px;">
        	<h4>*새 글*</h4>
        	<table class="table table-hover" style="font-size: 15px; table-layout:fixed;">
			<thead>
				<tr>
					<th style="text-align: left; width:60%">제목</th>
					<th class="text-center">작성자</th>
					<th class="text-center">조회수</th>
				</tr>
			</thead>
			<tbody>
<%
				ArrayList<BbsDTO> newlist=dao.newlist();
				if(newlist==null){
					out.println("<tr>");
					out.println("	<td colspan='3'>");
					out.println("	  <strong>현재 새 글이 없습니다</strong>");
					out.println("	</td>");
					out.println("</tr>");
				}else{
					for(int i=0; i<newlist.size(); i++){
						dto=newlist.get(i);
%>
						<tr>
							<td style="text-align: left">
<%
								//답변이미지 출력
								for(int n=1; n<=dto.getIndent(); n++){
									out.println("<img src='./images/reply.gif'>");
								}//for end
%>
								<a href="./bbs/bbsRead.jsp?bbsno=<%=dto.getBbsno()%>"><%=dto.getSubject()%></a>
								<img src='./images/new.gif'>
							</td>
							<td><%=dto.getWname()%></td>
							<td><%=dto.getReadcnt()%></td>
						</tr>
<%
					}//for end
				}//if end
%>			
			</tbody>
			</table>
			<input type="button" style="position:absolute; font-size: 12px; right:0px; bottom:0px" value="게시판 이동" onclick="location.href='./bbs/bbsList.jsp'">     
        </div><!-- 새글 끝 -->

    	<!-- 본문끝 -->
    </div><!--  col 끝 -->
  </div><!-- row 끝 -->
</div><!-- Contents 끝 -->

<!-- Footer -->
<footer class="container-fluid bg-3 text-center">
  Copyright &copy; 2022 MYWEB
</footer>

</body>
</html>