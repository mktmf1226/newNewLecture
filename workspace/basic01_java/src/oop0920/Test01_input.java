package oop0920;

import java.io.FileInputStream;

public class Test01_input {

	public static void main(String[] args) {
		//파일 입출력(.txt)
		//File : .txt .csv .pdf .xls .ppt .jpg ~~
		
		//byte형 : 1바이트 할당
		//char형 : 2바이트 할당
		
		//1) byte 기반 -> 한글깨짐
		
		String filename="D:/java202207/workspace/basic01_java/src/oop0920/data.txt";
		
		FileInputStream fis=null;
		
		try {
			fis=new FileInputStream(filename);
			while(true) {
				int data=fis.read(); //1바이트 읽기
				if(data==-1) { //파일의 끝(End Of File)인지?
					break;
				}//if end
				System.out.printf("%c", data);
			}//while end
		}catch (Exception e) {
			System.out.println("파일 읽기 실패 : " + e);
		}finally {
			//자원반납
			try {
				if(fis!=null) {fis.close();} //파일이 열려있다면 종료해라		
			}catch (Exception e) {}
		}//end
		
		
		
		
		
		
		
		
	}//main() end
}//class end
