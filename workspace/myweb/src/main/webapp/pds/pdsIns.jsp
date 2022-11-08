<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문시작 pdsIns.jsp-->
<h3>* 사진 올리기 결과 *</h3>
<%
	try{
		
		//1) 첨부된 파일 저장하기
    	//실제 물리적인 경로
    	String saveDirectory=application.getRealPath("/storage");
    	//저장 최대용량 (10MB)
    	int maxPostSize=1024*1024*10; //byte*KB*MB
    	//한글인코딩
    	String encoding="UTF-8"; //한글파일명이 들어오면 UTF-8로 인코딩
    	//MultipartRequest 생성자함수 사용
    	MultipartRequest mr=new MultipartRequest(  request, saveDirectory, maxPostSize, encoding
    						 					  ,new DefaultFileRenamePolicy()					
    						 					 );
    	
		//2) 1)단계에서 저장한 파일의 파일명, 파일크기 가져오기
		String fileName=""; //파일명
		long fileSize=0; 	//파일크기
		File file=null; 	//실제 파일 담기
		String item=""; 	//name="filename"
		
		//mr에서 <input type=file>을 전부 수거하기
		Enumeration files=mr.getFileNames(); 
		while(files.hasMoreElements()){ //여러개의 파일을 첨부하는 경우에 한개씩 처리하기
			//-> files가 가지고 있는 값들 중에서 개별적으로 접근하기 위해 name 가져오기		
			item		=(String)files.nextElement(); //name="filename"			
			//-> item 이름(filename)이 가지고 있는 실제 파일을 rename하여 mr객체에서 가져오기
			fileName	=mr.getFilesystemName(item);
			//-> /storage 폴더에 저장된 파일크기 담기
			if(fileName!=null){//실제 파일명을 가져왔다면
				file=mr.getFile(item); //mr에서 실제 파일 가져오기
				if(file.exists()){//실제 파일이 존재한다면
					fileSize=file.length();
				}else{
					out.print("해당 파일이 존재하지 않음!!");
				}//if end
			}//if end
		}//while end


		//3) tb_pds테이블 저장하기
		String wname   = mr.getParameter("wname").trim();
		String subject = mr.getParameter("subject").trim();
		String passwd  = mr.getParameter("passwd").trim();
		String ip	   = request.getRemoteAddr(); //요청PC의 IP
		
		dto.setWname(wname);
		dto.setSubject(subject);
		dto.setPasswd(passwd);
		dto.setFilename(fileName);
		dto.setFilesize(fileSize);
		dto.setIp(ip);
		
		int cnt=dao.create(dto);
		if(cnt==0){
	    	out.println("<p>파일 업로드 실패!!</p>");
	    	out.println("<a href='javascript:history.back();'>[다시시도]</a>");
		}else{
			out.println("<script>");
			out.println("	alert('사진이 추가되었습니다');");
			out.println("	location.href='pdsList.jsp';");//목록페이지 이동
			out.println("</script>");
		}//if end
		
	}catch(Exception e){
    	out.print(e);
    	out.print("<p>파일 업로드 실패!!</p>");
    	out.print("<a href-'javascript:history.back();'>[다시시도]</a>");
	}//end
%>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>