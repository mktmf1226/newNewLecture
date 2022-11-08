
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
	<title>sungjukRead.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container col-xs-offset-1 col-xs-6">
	<h3 style="text-align: center;">*성적 상세보기*</h3>	
	<div class="btn-group" style="margin-top: 10px; margin-bottom: 20px;">
		<button type="button" class="btn btn-primary" onclick="location.href='sungjukForm.jsp'">성적쓰기</button>
		<button type="button" class="btn btn-primary" onclick="location.href='sungjukList.jsp'">성적목록</button>
	</div>
	<table class="table table-bordered table-hover">
	<tbody>
<%
	//예) sungjukRead.jsp?sno=3
	int sno=Integer.parseInt(request.getParameter("sno"));

	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		String url	   ="jdbc:oracle:thin:@localhost:1521:xe"; 
		String user	   ="system";
		String password="1234";
		String driver  ="oracle.jdbc.driver.OracleDriver"; //ojdbc8.jar
		Class.forName(driver);
		con=DriverManager.getConnection(url, user, password);
		//out.println("오라클DB 서버 연결 성공!!");
		
		StringBuilder sql=new StringBuilder();
		sql.append(" SELECT sno, uname, kor, eng, mat, tot, aver, addr, wdate ");
		sql.append(" FROM sungjuk ");
		sql.append(" WHERE sno=? ");
		
		pstmt = con.prepareStatement(sql.toString());//SQL문 변환 명령어
		pstmt.setInt(1, sno); // 1 -> 첫번째 물음표, sno칼럼
		
		rs=pstmt.executeQuery();//select문 실행		
		if(rs.next()) {	//cursor가 있는지?
			do {
%>
				<tr>
					<th>이름</th>
					<td><%=rs.getString("uname")%></td>
				</tr>
				<tr>
					<th>국어</th>
					<td><%=rs.getInt("kor")%></td>
				</tr>
				<tr>
					<th>영어</th>
					<td><%=rs.getInt("eng")%></td>
				</tr>
				<tr>	
					<th>수학</th>				
					<td><%=rs.getInt("mat")%></td>
				</tr>
				<tr>	
					<th>총점</th>				
					<td><%=rs.getInt("tot")%></td>
				</tr>
				<tr>	
					<th>평균</th>				
					<td><%=rs.getInt("aver")%></td>
				</tr>
				<tr>	
					<th>주소</th>				
					<td>
						<%=rs.getString("addr")%>
<%
						//주소를 한글로 출력
						String addr=rs.getString("addr");
						if(addr.equals("Seoul")){
							out.print("서울");
						}else if(addr.equals("Jeju")){
							out.print("제주");
						}else if(addr.equals("Suwon")){
							out.print("수원");
						}else if(addr.equals("Busan")){
							out.print("부산");
						}//if end
%>
					</td>
				</tr>
				<tr>	
					<th>작성일</th>				
					<td><%=rs.getString("wdate")%></td>
				</tr>
		</tbody>
		</table>
		<div class="col-sm-offset-4">
			<button type="button" class="btn btn-default" style="margin:0 10px" onclick="location.href='sungjukUpdate.jsp?sno=<%=sno%>'">수정</button>
			<button type="button" class="btn btn-danger" onclick="location.href='sungjukDel.jsp?sno=<%=sno%>'">삭제</button>
		</div>	
	</div>
<%				
			}while(rs.next());//다음 cursor가 있는지? true->반복			
		}else {
			out.println("<tr>");
			out.println("	<td colspan='9'>글없음!!</td>");
			out.println("</tr>");
		}//if end		
	}catch (Exception e){
		out.println("오라클DB연결실패:" + e);
	}finally{//자원반납(순서주의)
		try {
			if(rs!=null){rs.close();}
		}catch(Exception e){}
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