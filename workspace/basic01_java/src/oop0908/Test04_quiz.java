package oop0908;

import java.util.StringTokenizer;

public class Test04_quiz {

	public static void main(String[] args) {
		//String 관련 연습문제
		
		//문1) 이메일 주소에 @문자 있으면
        //    @글자 기준으로 문자열을 분리해서 출력하고
        //    @문자 없다면 "이메일주소 틀림" 메세지를 출력하시오        
        /*    
              출력결과
              webmaster
              itwill.co.kr
        */
		String email=new String("webmaster@itwill.co.kr");
		
		if(email.indexOf("@")==-1) {
			System.out.println("이메일 주소가 잘못되었습니다");
		}else {
			System.out.println("이메일 주소가 맞습니다");
			
			int position=email.indexOf("@");
			System.out.println(position);//9
			
			String id=email.substring(0, position); //0번째부터 9번째(미포함)까지
			System.out.println(id); //webmaster
			
			String server=email.substring(position+1); //10번째부터 끝까지
			System.out.println(server); //itwill.co.kr
			
		}//if end	
		
		
		
		/* 내풀이
		StringTokenizer st=new StringTokenizer(email, "@");
		String[] word=email.split("@");
		
		
		if(st.hasMoreElements()) {
			//System.out.println("이메일주소 맞음");
			System.out.println(word[0]);
			System.out.println(word[word.length-1]);
		}else {
			System.out.println("이메일주소 틀림");
		};//if end
		*/
		
		
		
		System.out.println("----------------------");
		///////////////////////////////////////////////////////////////////
		//문2) 이미지 파일만 첨부 (.png .jpg .gif)
        /*     
               출력결과 
               파일명 : sky2022.09.08
               확장명 : png
        */
		String path=new String("i:/frontend/images/sky2022.09.08.png");
		
		
		//마지막 "/" 기호의 순서값
		int lastSlash=path.lastIndexOf("/");
		System.out.println(lastSlash); //18
		
		//전체 파일명
		String file=path.substring(lastSlash+1); //19번째부터 끝까지
		System.out.println("전체 파일명 : " + file);
		
		//file에서 마지막 "." 기호의 순서값
		int lastDot=file.lastIndexOf(".");
		System.out.println(lastDot); //13
		
		//파일명
		String filename=file.substring(0, lastDot); //0번째부터 13번째(미포함)까지
		System.out.println("파일명 : " + filename);
		
		//확장명
		String ext=file.substring(lastDot+1); //14번째부터 끝까지
		System.out.println("확장명 : " + ext);
		
		
		//확장명을 전부 소문자로 치환
		ext=ext.toLowerCase(); //변수에 소문자로 치환한 값을 담는다
		if(ext.equals("png") || ext.equals("jpg") || ext.equals("gif")) {
			System.out.println("파일이 전송되었습니다~");
		}else {
			System.out.println("이미지 파일만 가능합니다!!");
		}//if end
		
		
		
		
		
		/*내풀이
		String[] slash=path.split("/");		
		String middle=new String(slash[slash.length-1]);
		
		String[] jum=middle.split("[.]");
		
		System.out.println("파일명 : "+jum[0]);
		System.out.println("확장명 : "+jum[jum.length-1]);
		
		
		//이미지 파일만 첨부 (.png .jpg .gif)
		if(  jum[jum.length-1].equals("png") 
		  || jum[jum.length-1].equals("jpg") 
		  || jum[jum.length-1].equals("gif")  ) 
		{
				System.out.println("올바른 이미지 확장자");
		}else {
				System.out.println("이미지 파일만 첨부하시오");
		}//if end
		*/
		
		
		
		
	}//main() end
}//class end
