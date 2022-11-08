<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sungjukUpdateProc.jsp</title>
	<%@ include file="header.jsp" %>
</head>
<body>
	<h3 style="text-align: center;">*성적 수정 결과 페이지*</h3>	
<%
	//사용자가 입력한 정보를 가져와서 변수에 담기
	int sno     =Integer.parseInt(request.getParameter("sno").trim());
	String uname=request.getParameter("uname").trim();
	int kor     =Integer.parseInt(request.getParameter("kor").trim());
	int eng     =Integer.parseInt(request.getParameter("eng").trim());
	int mat     =Integer.parseInt(request.getParameter("mat").trim());
	String addr =request.getParameter("addr");
	int aver=(kor+eng+mat)/3;

	//전달값을 모두 dto 객체에 담기
	dto.setSno(sno);
	dto.setUname(uname);
	dto.setKor(kor);
	dto.setEng(eng);
	dto.setMat(mat);
	dto.setAver(aver);
	dto.setAddr(addr);
	
	int cnt=dao.updateproc(dto);	
	
	if(cnt==0) {//실패시
		out.println("<p>성적 수정이 실패했습니다!!</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");//전단계로 이동
	}else {//성공시
		out.println("<script>");
		out.println("	alert('성적이 수정완료되었습니다~');");
		out.println("	location.href='sungjukList.jsp';"); //목록페이지 이동
		out.println("</script>");
	}//if end
%>

</body>
</html>