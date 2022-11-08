<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>emailCheckForm.jsp</title>
</head>
<body>
	<div style="text-align:center">
		<h3>*이메일 중복확인*</h3>
		<form action="emailCheckProc.jsp" onsubmit="return blankCheck()"><!-- <script> -->
			이메일 : <input type="text" name="email" id="email" maxlength="50" autofocus>
			<input type="submit" value="중복확인">
		</form>
	</div>
	
	<script>
	function blankCheck(){
		let email=document.getElementById("email").value;
		email=email.trim();
		if(email.length<5 || email.length>50){
			alert("이메일은 5~50글자 이내로 입력해주세요");
			return false;
		}//if end
		
		//이메일주소 유효성 검사
		if(email.indexOf("@")==-1){ //@가 없습니까?
	        alert("유효하지 않은 이메일 주소입니다");
	        return false;
	    }//if end
		return true;
	}//blankCheck() end
	</script>
</body>
</html>