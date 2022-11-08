<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="auth.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문시작 loginForm.jsp-->

<%if(s_id.equals("guest") || s_passwd.equals("guest") || s_mlevel.equals("guest")){ 
	//아이디저장 쿠키 확인	--------------------------------------
	Cookie[] cookies=request.getCookies(); //사용자 PC에 저장된 모든 쿠키값 가져오기
	String c_id="";
	if(cookies!=null){ //쿠키가 존재한다면
		for(int i=0; i<cookies.length; i++){ //모든 쿠키값을 검색
			Cookie cookie=cookies[i]; //쿠키 하나씩 가져오기
			if(cookie.getName().equals("c_id")==true){ //쿠키이름이 c_id인가요?
				c_id=cookie.getValue(); //출력될 값
			}//if end
		}//for end
	}//if end
	//--------------------------------------------------------
%>
<h3>*로 그 인 *</h3>
<div class="container-fluid">
	<form name="Loginfrm" id="Loginfrm" action="loginProc.jsp" onsubmit="return loginCheck()"><!-- myscript.js -->
		<table class="table">
		<tr>
		    <td>
			   <input type="text" name="id" id="id" value="<%=c_id%>" placeholder="아이디" maxlength="10" required>
		    </td>
		    <td rowspan="2">
		       <!-- type=image는 기본속성이 submit -->
			   <input type="image" src="../images/bt_login.gif" style="height:100%; width:80px;">		   
		    </td>
		</tr>
		<tr>
		   <td>
		      <input type="password" name="passwd" id="passwd" placeholder="비밀번호" maxlength="10" required>
		   </td>
		</tr>
		<tr>
		   <td colspan="2">
		      <label><input type="checkbox" name="c_id" value="SAVE" <%if(!c_id.isEmpty()){out.print("checked");}%>>아이디 저장</label>			  
			  &nbsp;&nbsp;&nbsp;
			  <a href="agreement.jsp">회원가입</a>
			  &nbsp;&nbsp;&nbsp;
			  <a href="findID.jsp">아이디/비밀번호찾기</a>
		   </td>
		</tr>		  
		</table>
	</form>
</div>
<%
}else {
	//로그인 성공했다면
	out.println("<strong>" + s_id + "</strong> 님");
	out.println("<a href='logout.jsp'>[로그아웃]</a>");
	out.println("<br><br>");
	out.println("<a href='memberModify.jsp'>[회원정보수정]</a>");
	out.println("&nbsp;&nbsp;");
	out.println("<a href='memberWithdraw.jsp'>[회원탈퇴]</a>");
}//if end %>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>