package basic03_crawling;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test08_ITwill {

	public static void main(String[] args) {	
		//ITwill 공지사항 크롤링
		
		try {
			//파일Writer
			String fileName="D:/java202207/itwill.txt";    //경로+파일명
			FileWriter fw =new FileWriter(fileName, true); //append
			PrintWriter out=new PrintWriter(fw, true);			
			//주소
			String URL="https://www.itwill.co.kr/cmn/board/BBSMSTR_000000000071/bbsList.do";
			String params="?pageIndex=";
	
			for(int p=0; p<=4; p++) { //1~4페이지
				Document doc =Jsoup.connect(URL+params+p).get();
				Elements elements=doc.select(".bgcol01>td>a");
				for(Element element : elements) {
					out.println(element.text());
				}//for end
			}//for end
			
			out.close();
			fw.close();
			System.out.println("-------itwill.txt 아이티윌 공지사항 저장 완성!!");			
			
		}catch (Exception e) {
			System.out.println("크롤링 실패 : " + e);
		}//end
		System.out.println("END");
		
		
		
		
	}//main() end
}//class end
