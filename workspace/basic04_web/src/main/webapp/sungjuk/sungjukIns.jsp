<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sungjukIns.jsp</title>
</head>
<body>
	<h3>*성적 결과 페이지*</h3>
<%
	//한글 인코딩
	request.setCharacterEncoding("UTF-8");

	//사용자가 입력한 정보를 가져와서 변수에 담기
	String uname=request.getParameter("uname").trim();
	int kor     =Integer.parseInt(request.getParameter("kor").trim());
	int eng     =Integer.parseInt(request.getParameter("eng").trim());
	int mat     =Integer.parseInt(request.getParameter("mat").trim());
	String addr =request.getParameter("addr").trim();

	//평균 구하기
	int aver=(kor+eng+mat)/3;

	//out.println("요청IP:" + request.getRemoteAddr());

	//Oracle DB 연결 및 행추가---------------------------
	Connection con=null;
	PreparedStatement pstmt=null;
	
	try{
		String url	   ="jdbc:oracle:thin:@localhost:1521:xe"; 
		String user	   ="system";
		String password="1234";
		String driver  ="oracle.jdbc.driver.OracleDriver"; //ojdbc8.jar
		Class.forName(driver);
		con=DriverManager.getConnection(url, user, password);
		//out.println("오라클DB 서버 연결 성공!!");
		
		StringBuilder sql=new StringBuilder();
		sql.append(" INSERT INTO sungjuk(sno, uname, kor, eng, mat, addr, aver, wdate) ");
		sql.append(" VALUES (sungjuk_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate) ");

		pstmt=con.prepareStatement(sql.toString());
		pstmt.setString(1, uname); // 1 -> 첫번째 물음표, uname칼럼
		pstmt.setInt(2, kor); 	  // 2 -> 두번째 물음표, kor칼럼
		pstmt.setInt(3, eng); 	  // 3 -> 세번째 물음표, eng칼럼
		pstmt.setInt(4, mat); 	  // 4 -> 네번째 물음표, mat칼럼
		pstmt.setString(5, addr); // 5 -> 다섯번째 물음표, addr칼럼
		pstmt.setInt(6, aver); 	  // 6 -> 여섯째 물음표, aver칼럼
		
		int cnt=pstmt.executeUpdate();
		if(cnt==0) {//실패시 html형식으로 출력
			out.println("<p>성적 입력이 실패했습니다!!</p>");
			out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");//전단계로 이동
		}else {//성공시 javascript alert띄우기
			out.println("<script>");
			out.println("	alert('성적이 입력되었습니다~');");
			out.println("	location.href='sungjukList.jsp';"); //목록페이지 이동
			out.println("</script>");
		}//if end

	}catch (Exception e){
		out.println("오라클DB연결실패:" + e);
	}finally{//자원반납(순서주의)
		try {
			if(pstmt!=null){pstmt.close();}
		}catch(Exception e){}
		try {
			if(con!=null){con.close();}
		}catch(Exception e){}
	}//end




%>
</body>
</html>