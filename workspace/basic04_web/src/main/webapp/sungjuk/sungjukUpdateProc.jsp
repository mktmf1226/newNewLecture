
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sungjukUpdateProc.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<h3 style="text-align: center;">*성적 수정 결과 페이지*</h3>	
<%
	//한글 인코딩
	request.setCharacterEncoding("UTF-8");
		
	//사용자가 수정 입력한 정보를 가져와서 변수에 담기
	int sno     =Integer.parseInt(request.getParameter("sno").trim()); //글번호
	String uname=request.getParameter("uname").trim();
	int kor     =Integer.parseInt(request.getParameter("kor").trim());
	int eng     =Integer.parseInt(request.getParameter("eng").trim());
	int mat     =Integer.parseInt(request.getParameter("mat").trim());
	String addr =request.getParameter("addr").trim();
	
	//평균 구하기
	int aver=(kor+eng+mat)/3;
	
	//총점 구하기
	int tot=kor+eng+mat;

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
		sql.append(" UPDATE sungjuk ");
		sql.append(" SET uname=? ");
		sql.append(" , kor=? ");
		sql.append(" , eng=? ");
		sql.append(" , mat=? ");
		sql.append(" , tot=? ");
		sql.append(" , aver=? ");
		sql.append(" , addr=? ");
		sql.append(" , wdate=sysdate ");
		sql.append(" WHERE sno=? ");
		
		pstmt = con.prepareStatement(sql.toString());//SQL문 변환 명령어
		pstmt.setString(1, uname);// 1 -> 첫번째 물음표, uname칼럼
		pstmt.setInt(2, kor); 	  // 2 -> 두번째 물음표, kor칼럼
		pstmt.setInt(3, eng); 	  // 3 -> 세번째 물음표, eng칼럼
		pstmt.setInt(4, mat); 	  // 4 -> 네번째 물음표, mat칼럼
		pstmt.setInt(5, tot); 	  // 5 -> 다섯번째 물음표, tot칼럼
		pstmt.setInt(6, aver); 	  // 6 -> 여섯번째 물음표, aver칼럼
		pstmt.setString(7, addr); // 7 -> 일곱번째 물음표, addr칼럼
		pstmt.setInt(8, sno); 	  // 8 -> 여덟번째 물음표, sno칼럼
		
		int cnt=pstmt.executeUpdate();
		if(cnt==0) {//실패시 html형식으로 출력
			out.println("<p>성적 수정이 실패했습니다!!</p>");
			out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");//전단계로 이동
		}else {//성공시 javascript alert띄우기
			out.println("<script>");
			out.println("	alert('성적 수정이 완료되었습니다~');");
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