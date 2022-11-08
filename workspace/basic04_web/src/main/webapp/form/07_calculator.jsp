<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>07_calculator.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	<h3>* 계산기 연습 *</h3>
	<form name="calcfrm" class="form-inline" id="calcfrm" method="get" action="07_ok.jsp">
		<div class="form-group">
			<label>첫번째 수 : </label>
			<input type="number" class="form-control" name="num1" min="0" max="100" required> 
		</div>
		<div class="form-group">
			<label>연산자 : </label>
			<input type="text" class="form-control" name="op" size="3" required>
	  	</div>
		<div class="form-group">
			<label>두번째 수 : </label>	  	
			<input type="number" class="form-control" name="num2" min="0" max="100" required>
		</div>
		<input type="submit" value="계산">                      
  		<input type="reset"  value="취소"> 
	</form>
	</div>

</body>
</html>