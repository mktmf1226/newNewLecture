package oop0920;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;

public class Test04_output {

	public static void main(String[] args) {
		//메모장 파일에 출력하기
		
		//출력파일(sungjuk.txt)이
		//->없으면 파일은 생성된다(create)
		//->있으면 덮어쓰기(overwrite) 또는 추가(append)
		String filename="D:/java202207/sungjuk.txt";
		
		FileWriter fw=null;
		PrintWriter out=null;		
		
		try {
			
			//true  : append 모드
			//false : overwrite 모드
			fw=new FileWriter(filename, false);
			
			//true  : autoFlush 버퍼클리어
			//false : 사용x
			out=new PrintWriter(fw, true);
			
			//oop0906.Test01_format.java참조
			//out.printf()
			
			out.println("무궁화,95,90,100");
            out.println("홍길동,100,100,100");
            out.println("라일락,90,95,35");
            out.println("개나리,85,70,75");
            out.println("진달래,35,40,60"); //콤마구분은 csv문서
            
            System.out.println("sungjuk.txt 데이터 파일 완성!");
			
		}catch (Exception e) {
			System.out.println("파일 읽기 실패 : " + e);
		}finally {
			//자원반납
			try {
				if(out!=null) {out.close();}
			}catch (Exception e) {}
			try {
				if(fw!=null) {fw.close();}
			}catch (Exception e) {}
		}//end
		
		
		
		
		
		
		
		
		
		
		
	}//main() end
}//class end
