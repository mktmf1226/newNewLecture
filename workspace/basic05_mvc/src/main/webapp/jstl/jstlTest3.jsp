<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jstlTest3.jsp</title>
</head>
<body>
	<h3>* JSTL 함수 *</h3>

	<c:set var="txt" value="   White  Space     "></c:set>
	글자갯수 : ${fn:length(txt)}
	<hr>
	
	공백제거 : @<c:out value="${fn:trim(txt)}"></c:out>@
	<hr>
	
	<c:set var="str" value="Hi My name is smile"></c:set>
	문자열자르기 : ${fn:substring(str, 3, 9)} <!-- My nam -->
	<hr>
	${fn:toLowerCase(str)}<br>
	${fn:toUpperCase(str)}<br>
	<hr>
	
<%
	//엔터를 <br>로 바꾸기
	
	//1)JSP
	String content="";
	content=content.replace("\n", "<br>");
	
	//2)EL+JSTL
	pageContext.setAttribute("cn", "\n");
%>	
	<c:set var="content" value="Hi
								My name is
								smile"></c:set>
	${content}<!-- Hi My name is smile -->
	<hr>
	${fn:replace(content, cn, "<br>")}<!-- Hi<br> My name is<br> smile -->
	<hr>
	
	
	<!-- 3) < > & ' " 등 특수문자 변환 -->
	<c:set var="text" value="Hi
							 My <name> is
							 'smil     e'"></c:set>
	${fn:escapeXml(text)}
	<hr>
	${fn:replace(fn:escapeXml(text), cn, "<br>")}<!-- 엔터바꾸기 -->
	<hr>
	${fn:replace(fn:replace(fn:escapeXml(text), cn, "<br>"), ' ' , '&nbsp;')}<!-- 공백바꾸기 -->
	
	
	
</body>
</html>