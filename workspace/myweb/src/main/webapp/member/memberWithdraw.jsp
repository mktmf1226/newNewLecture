<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문시작 memberWithdraw.jsp-->
<!-- 아이디(id)와 비밀번호(passwd)가 일치하면 회원탈퇴 -->
<h2>* 회/원/탈/퇴 *</h2>
<div class="container">
	<form method="post" action="memberWithdrawProc.jsp" onsubmit="return withPWCheck()"><!-- myscript.js -->
		<table class="table">
		<tr>
			<th class="success">비밀번호 확인</th>
			<td><input type="password" name="passwd" id="passwd" required></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="회원탈퇴" class="btn btn-danger">
			</td>
		</tr>
		</table>
	</form>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>