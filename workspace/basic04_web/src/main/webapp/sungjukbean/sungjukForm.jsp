<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sungjukForm.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container col-xs-offset-1 col-xs-6">
	<h3 style="text-align: center;">*성적 입력 폼*</h3>
	<div class="btn-group" style="margin-top: 10px; margin-bottom: 20px;">
		<button type="button" class="btn btn-primary" onclick="location.href='sungjukList.jsp'">성적목록</button>
	</div>
	<form name="sungjukfrm" id="sungjukfrm" method="post" action="sungjukIns.jsp">
		<table class="table table-hover">
		<tbody>
		<tr>
		  <th style="padding: 15px;">이름</th>
		  <td><input type="text" class="form-control" name="uname" maxlength="20" required autofocus></td>
		</tr> 
		<tr>
		  <th style="padding: 15px;">국어</th>
		  <td><input type="number" class="form-control" name="kor" size="10" min="0" max="100" placeholder="숫자입력"></td>
		</tr>
		<tr>
		  <th style="padding: 15px;">영어</th>
		  <td><input type="number" class="form-control" name="eng" size="10" min="0" max="100" placeholder="숫자입력"></td>
		</tr> 
		<tr>
		  <th style="padding: 15px;">수학</th>
		  <td><input type="number" class="form-control" name="mat" size="10" min="0" max="100" placeholder="숫자입력"></td>
		</tr>
		<tr>
		  <th style="padding: 15px;">주소</th>
		  <td>
		      <select name="addr" class="form-control">
	              <option value="Seoul">서울</option>
	              <option value="Jeju">제주</option>
	              <option value="Suwon">수원</option>
	              <option value="Busan">부산</option>
		      </select> 
		  </td>
		</tr>
		</tbody>
		</table>
		<div class="col-sm-offset-4">
			<button type="submit" class="btn btn-info" style="margin:0 10px" form="sungjukfrm">전송</button>
			<button type="reset" class="btn btn-default">지우기</button>
		</div>	
	</form>
	</div>
</body>
</html>