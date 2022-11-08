package basic03_crawling;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test04_choongang {

	public static void main(String[] args) {
		//중앙정보처리학원 웹페이지의 공지사항 제목만 크롤링 해서
		//choongang.txt 파일에 저장하기
		
		try {
			//파일저장
			String fileName="D:/java202207/choongang.txt"; //저장경로+파일이름
			FileWriter fw=new FileWriter(fileName, true); //append 모드 char형으로 읽어옴
			PrintWriter out=new PrintWriter(fw, true);
			
			//중앙정보처리학원 웹페이지의 공지사항 제목만 크롤링
			String URL="https://www.choongang.co.kr/html/sub07_01_n.php";
						
			for(int p=1; p<=11; p++) {
				//공지사항 웹페이지 1~11 페이지 소스 가져오기
				String params="?page=" + p + "&mod=&idx=";		
				Document doc =Jsoup.connect(URL+params).get();
				//요소 선택하기
				Elements elements =doc.select(".default_title"); //. class
																 //# id
				for(Element element : elements) {
					System.out.println(element.text());
					//choongang.txt 에 출력하기
					out.println(element.text());
				}//for end					
			}//for end
			
			//자원반납
			out.close();
			fw.close();
			System.out.println("--------choongang.txt 공지사항 제목 저장 완성!!");
			
		}catch (Exception e) {
			System.out.println("크롤링 실패 : " + e);
		}//end
		
		
		
		

	}//main() end
}//class end
