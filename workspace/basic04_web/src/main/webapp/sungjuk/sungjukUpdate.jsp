
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
	<title>sungjukUpdate.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container col-xs-offset-1 col-xs-6">
	<h3 style="text-align: center;">*성적 수정*</h3>	
	<div class="btn-group" style="margin-top: 10px; margin-bottom: 20px;">
		<button type="button" class="btn btn-primary" onclick="location.href='sungjukForm.jsp'">성적쓰기</button>
		<button type="button" class="btn btn-primary" onclick="location.href='sungjukList.jsp'">성적목록</button>
	</div>
<%
	//수정하고자 하는 글 번호 sungjukUpdate.jsp?sno=3
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
		
		
		//1)단계. select문을 이용해서 수정할 행을 가져온다(sungjukRead.jsp참조)
		StringBuilder sql=new StringBuilder();
		sql.append(" SELECT sno, uname, kor, eng, mat, tot, aver, addr, wdate ");
		sql.append(" FROM sungjuk ");
		sql.append(" WHERE sno=? ");
		
		pstmt = con.prepareStatement(sql.toString());//SQL문 변환 명령어
		pstmt.setInt(1, sno); // 1 -> 첫번째 물음표, sno칼럼
		
		rs=pstmt.executeQuery();//select문 실행		
		if(rs.next()) {	//cursor가 있는지?
			//2)단계. 1)의 내용을 폼에 출력 sungjukForm.jsp참조
%>
			<form name="sungjukfrm" id="sungjukfrm" method="post" action="sungjukUpdateProc.jsp">
				<input type="hidden" name="sno" value="<%=sno%>">
				<table class="table table-hover">
				<tr>
				  <th style="padding: 15px;">이름</th>
				  <td><input type="text" class="form-control" name="uname" value="<%=rs.getString("uname")%>" maxlength="20" required autofocus></td>
				</tr> 
				<tr>
				  <th style="padding: 15px;">국어</th>
				  <td><input type="number" class="form-control" name="kor" value="<%=rs.getString("kor")%>" min="0" max="100" placeholder="숫자입력"></td>
				</tr>
				<tr>
				  <th style="padding: 15px;">영어</th>
				  <td><input type="number" class="form-control" name="eng" value="<%=rs.getString("eng")%>" min="0" max="100" placeholder="숫자입력"></td>
				</tr> 
				<tr>
				  <th style="padding: 15px;">수학</th>
				  <td><input type="number" class="form-control" name="mat" value="<%=rs.getString("mat")%>" min="0" max="100" placeholder="숫자입력"></td>
				</tr>
				<tr>
				  <th style="padding: 15px;">주소</th>
				  <td>
				  	  <% String addr=rs.getString("addr"); %>
				      <select name="addr" class="form-control">
			              <option value="Seoul" <%if (addr.equals("Seoul")) {out.print("selected");}%>>서울</option>
			              <option value="Jeju"  <%if (addr.equals("Jeju")) {out.print("selected");}%>>제주</option>
			              <option value="Suwon" <%if (addr.equals("Suwon")) {out.print("selected");}%>>수원</option>
			              <option value="Busan" <%if (addr.equals("Busan")) {out.print("selected");}%>>부산</option>
				      </select> 
				  </td>
				</tr>
				</table>
				<div class="col-sm-offset-4">
					<button type="submit" class="btn btn-info" style="margin:0 10px" form="sungjukfrm">수정</button>
					<button type="button" class="btn btn-default" onclick="location.href='sungjukRead.jsp?sno=<%=sno%>'">취소</button>
				</div>	
			</form>
<%							
		}else {
			out.println("글없음!!");
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
</div>
</body>
</html>