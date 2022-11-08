package oop0920;

import java.io.FileReader;

public class Test02_input {

	public static void main(String[] args) {
		//2) char기반 -> 한글 안깨짐
		
		String filename="D:/java202207/workspace/basic01_java/src/oop0920/data.txt";
		FileReader fr=null;
		
		try {
			
			fr=new FileReader(filename);
			
			while(true) {
				int data=fr.read(); //2바이트 읽기
				if(data==-1) { //마지막 데이터를 읽었다면
					break; //while문 빠져나가기
				}//if end
				System.out.printf("%c", data); //문자형으로 형변환
			}//while end
			
		}catch (Exception e) {
			System.out.println("파일 읽기 실패 : " + e);
		}finally {
			//자원반납
			try {
				if(fr!=null) {fr.close();} //파일이 열려있다면 종료해라		
			}catch (Exception e) {}
		}//end
		
		
		
		
		
		


	}//main() end
}//class end

