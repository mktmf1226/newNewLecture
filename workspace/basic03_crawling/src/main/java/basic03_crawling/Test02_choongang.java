package basic03_crawling;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class Test02_choongang {

	public static void main(String[] args) {
		//중앙정보처리학원 웹페이지의 공지사항 제목만 크롤링
		
		try {
			
			String URL="https://www.choongang.co.kr/html/sub07_01_n.php";
			
			//공지사항 웹페이지 1~11 페이지 소스 가져오기
			for(int p=1; p<=11; p++) {
				String params="?page=" + p + "&mod=&idx="; //?기점으로 뒷부분 1~11
				//System.out.println(params);
				
				Document doc =Jsoup.connect(URL+params).get(); //1~11페이지 소스가져오기
				System.out.println(doc.toString()); //.toString()생략 가능
			}//for end
			
		}catch (Exception e) {
			System.out.println("크롤링 실패 : " + e);
		}//end
		
		
		
		

	}//main() end
}//class end
