/**
 * myscript.js
 */
 
 function bbsCheck(){ //게시판 유효성 검사

 	//1) 작성자 2글자 이상 입력
 	let wname=document.getElementById("wname").value; //작성자 가져오기
	wname=wname.trim(); //좌우공백 제거
	if(wname.length<2){
		alert("작성자 2글자 이상 입력해주세요");
		document.getElementById("wname").focus(); //작성자칸에 커서 생성
		return false; 
		//onsubmit의 리턴값은 boolean형이므로 서버에 전송하지 않는다는 false를 리턴한다
	}//if end
 	
 	//2) 제목 2글자 이상 입력
	let subject=document.getElementById("subject").value;
	subject=subject.trim();
	if(subject.length<2){
		alert("제목 2글자 이상 입력해주세요");
		document.getElementById("subject").focus();
		return false;
	}//if end
 	
 	//3) 내용 2글자 이상 입력
 	let content=document.getElementById("content").value;
	content=content.trim();
	if(content.length<2){
		alert("내용 2글자 이상 입력해주세요");
		document.getElementById("content").focus();
		return false;
	}//if end
 	
 	//4) 비밀번호 4글자 이상이면서, 숫자형 기호만 입력
	let passwd=document.getElementById("passwd").value;
	passwd=passwd.trim();
	if(passwd.length<4 || isNaN(passwd)){ //숫자로 입력하지 않으면 true
		alert("비밀번호 4글자 이상 숫자로 입력해주세요");
		document.getElementById("passwd").focus();
		return false;
	}//if end	
	
	return true; //onsubmit 이벤트에서 서버로 전송

}//bbsCheck() end


function pwCheck(){
	let passwd=document.getElementById("passwd").value;
	passwd=passwd.trim();
	if(passwd.length<4 || isNaN(passwd)){ //숫자로 입력하지 않으면 true
		alert("비밀번호 4글자 이상 숫자로 입력해주세요");
		document.getElementById("passwd").focus();
		return false;
	}//if end

	let message="진행된 내용은 복구되지 않습니다\n계속 진행할까요?";
	if(confirm(message)){ //확인 true, 취소 false
		return true; //서버로 전송
	}else{
		return false;
	}//if end
}//pwCheck() end



function searchCheck(){
	//검색어를 입력해야만 서버로 전송
	let word=document.getElementById("word").value;
	word=word.trim();
	if(word.length==0){
		alert("검색어를 입력해 주세요");
		return false;
	}//if end
	return true;
}//searchCheck() end


/**----------------------------------------------------- */
function plusDivs(n) {//버튼클릭하면 인덱스가 바뀜
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-white";
}
/**----------------------------------------------------- */


function loginCheck(){ //로그인 유효성 검사 (아이디, 비번)
	//1)아이디 5~10글자 이내인지 검사
	let id=document.getElementById("id").value;
	id=id.trim();
	if(!(id.length>=5 && id.length<=10)){
		alert("아이디를 5~10글자로 입력해 주세요");
		document.getElementById("id").focus();
		return false;
	}//if end
	//2)비밀번호 5~10글자 이내인지 검사
	let passwd=document.getElementById("passwd").value;
	passwd=passwd.trim();
	if(!(passwd.length>=5 && passwd.length<=10)){
		alert("비밀번호를 5~10글자로 입력해 주세요");
		document.getElementById("passwd").focus();
		return false;
	}//if end
	return true;
}//loginCheck() end


function idCheck(){ //아이디 중복확인

	//모달창
	//->부모창과 자식창이 한 몸으로 구성되어 있음
	//->참조 https://www.w3schools.com/bootstrap/bootstrap_modal.asp
	
	//새창만들기
	//->부모창과 자식창이 별개로 구성되어 있음
	//->모바일에 기반을 둔 frontend단에서는 사용하지 말것!!
	//->참조 https://www.w3schools.com/jsref/met_win_open.asp
	
	//window.open("파일명", "새창이름", "다양한옵션들")
	window.open("idCheckForm.jsp", "idwin", "width=600, height=350")
	
}//idCheck() end


function emailCheck(){ //이메일 중복확인
	window.open("emailCheckForm.jsp", "emailwin", "width=600, height=350")	
}//emailCheck() end


function memberCheck(){ //회원가입 유효성 검사
	//1)아이디 5~10글자 인지?
	//->idCheckForm.jsp의 blankCheck()로 진행
	//->아이디를 입력했는지?로 진행
	let id=document.getElementById("id").value;
	if(id.length==0){
		alert("아이디를 입력해 주세요");
		document.getElementById("id").focus();
		return false;
	}//if end
	
    //2)비밀번호 5~10글자 인지?
	let passwd=document.getElementById("passwd").value;
	passwd=passwd.trim();
	if(!(passwd.length>=5 && passwd.length<=10)){
		alert("비밀번호를 5~10글자로 입력해 주세요");
		document.getElementById("passwd").focus();
		return false;
	}//if end
	
    //3)비밀번호와 비밀번호확인이 서로 일치하는지?
	let repasswd=document.getElementById("repasswd").value;
	if(!(repasswd==passwd)){
		alert("비밀번호가 일치하지 않습니다");
		document.getElementById("repasswd").focus();
		return false;
	}//if end

    //4)이름 2글자 이상 인지?
	let mname=document.getElementById("mname").value;
	mname=mname.trim();
	if(mname.length<2){
		alert("이름 2글자 이상 입력해주세요");
		document.getElementById("mname").focus();
		return false;
	}//if end

    //5)이메일 5~50글자 인지?
    //->emailCheckForm.jsp의 blankCheck()로 진행
    //->이메일을 입력했는지?로 진행
	let email=document.getElementById("email").value;
	if(email.length==0){
		alert("이메일을 입력해 주세요");
		document.getElementById("email").focus();
		return false;
	}//if end

	//7)전화번호 0~14글자 인지?
	let tel=document.getElementById("tel").value;
	tel=tel.trim();
	if(tel.length>14){
		alert("전화번호를 14글자 이내로 입력해주세요");
		document.getElementById("tel").focus();
		return false;
	}//if end

    //6)직업을 선택했는지?
    let job=document.getElementById("job").value;
	if(job.length==0 || job=="0"){
		alert("직업을 선택해 주세요");
		document.getElementById("job").focus();
		return false;
	}//if end
	
	return true;    
}//memberCheck() end


function findIDCheck(){
    //이름 2글자 이상 인지?
	let mname=document.getElementById("mname").value;
	mname=mname.trim();
	if(mname.length<2){
		alert("이름 2글자 이상 입력해주세요");
		document.getElementById("mname").focus();
		return false;
	}//if end
	
	//이메일 5~50글자 인지?
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
}//findIDCheck() end


function withPWCheck(){
	let passwd=document.getElementById("passwd").value;
	passwd=passwd.trim();
	if(passwd.length==0){
		alert("비밀번호를 입력해 주세요");
		document.getElementById("passwd").focus();
		return false;
	}//if end

	let message="진행된 내용은 복구되지 않습니다\n계속 진행할까요?";
	if(confirm(message)){ //확인 true, 취소 false
		return true; //서버로 전송
	}else{
		return false;
	}//if end
}//withPWCheck() end



function pdsCheck(){ //포토갤러리 유효성검사
	//1) 작성자 2글자 이상 입력
 	let wname=document.getElementById("wname").value; //작성자 가져오기
	wname=wname.trim(); //좌우공백 제거
	if(wname.length<2){
		alert("작성자 2글자 이상 입력해주세요");
		document.getElementById("wname").focus(); //작성자칸에 커서 생성
		return false; 
		//onsubmit의 리턴값은 boolean형이므로 서버에 전송하지 않는다는 false를 리턴한다
	}//if end
 	
 	//2) 제목 2글자 이상 입력
	let subject=document.getElementById("subject").value;
	subject=subject.trim();
	if(subject.length<2){
		alert("제목 2글자 이상 입력해주세요");
		document.getElementById("subject").focus();
		return false;
	}//if end
	
	//3) 비밀번호 4~15글자이면서, 숫자형 기호만 입력
	let passwd=document.getElementById("passwd").value;
	passwd=passwd.trim();
	if(!(passwd.length>=4 && passwd.length<=15) || isNaN(passwd)){ //숫자로 입력하지 않으면 true
		alert("비밀번호 4~15글자 사이 숫자로 입력해주세요");
		document.getElementById("passwd").focus();
		return false;
	}//if end
	
	//4)첨부파일
	//->파일의 확장명이 이미지 파일(png, jpg, gif)인지 확인하시오
	let filename=document.getElementById("filename").value; //예)d:/work/2022.10/sky.png
	filename=filename.trim();
	if(filename.length==0){
		alert("첨부 파일 선택하세요~");
		return false;
	}else{
		//filename변수값에서 마지막 . 의 순서값
		let dot=filename.lastIndexOf(".");
		//확장명 : 마지막 . 이후 문자열 자르기
		let ext=filename.substr(dot+1);
		//확장명을 전부 소문자 치환
		ext=ext.toLowerCase();
		if(ext=="png"||ext=="jpg"||ext=="gif"||ext=="heif"){
			return true;
		}else{
			alert("이미지 파일만 업로드 가능합니다");
			return false;
		}//if end
	}//if end
	
	function pwCheck2(){
		let passwd=document.getElementById("passwd").value;
		passwd=passwd.trim();
		if(passwd.length<4 || passwd.length>15){ //숫자로 입력하지 않으면 true
			alert("비밀번호 4~15 글자이내 입력해주세요");
			document.getElementById("passwd").focus();
			return false;
		}//if end
	
		let message="첨부 파일도 삭제됩니다\n계속 진행할까요?";
		if(confirm(message)){ //확인 true, 취소 false
			return true; //서버로 전송
		}else{
			return false;
		}//if end
	}//pwCheck2() end
	


}//pdsCheck() end