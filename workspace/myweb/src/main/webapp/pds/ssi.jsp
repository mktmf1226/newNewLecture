<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- ssi.jsp 공통코드 --%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<%-- 파일첨부 --%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page import="net.utility.*" %>
<%@ page import="net.member.*" %>

<jsp:useBean id="dao" class="net.pds.PdsDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="net.pds.PdsDTO" scope="page"></jsp:useBean>

<%request.setCharacterEncoding("UTF-8");%>

