package basic03_crawling;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test05_soldesk {

	public static void main(String[] args) {
		//연습) 솔데스크 웹페이지에서 공지사항 제목만 크롤링해서
		//	   soldesk.txt 파일에 저장하기
		
		try {
			//파일저장
			String fileName="D:/java202207/soldesk.txt"; //저장경로+파일이름
			FileWriter fw=new FileWriter(fileName, true); //append 모드 char형으로 읽어옴
			PrintWriter out=new PrintWriter(fw, true);
			
			//솔데스크 웹페이지의 공지사항 제목만 크롤링
			String URL="https://soldesk.com/board/board_bagic/board_list.asp";
						
			for(int p=1; p<=8; p++) {
				//공지사항 웹페이지 1~11 페이지 소스 가져오기
				String params="?scrID=0000000173&pageNum=8&subNum=1&ssubNum=1";
				params += "&page=" + p;
				params += "&bd_num=&act=list&s_string=";		
				Document doc =Jsoup.connect(URL+params).get();
				/*
					공지사항 제목 가져오기
                    <td class="td_left">
                        <a href="javascript:goDetail('00000001732019000013','bd_num');" title="">
                            <!--모바일에서는 td_m_date에 날짜가 나오게해놨습니다.-->
                            <span class="td_m_date">2019-11-01</span>
                            솔데스크학원 2019 고용노동부 직업훈련기관 인증평가에서 우수훈련기관 선정
                        </a>
                    </td>
				*/
				Elements elements=doc.select(".td_left");
				
				//class="td_m_date" 요소 제거하기
				elements.select(".td_m_date").remove();
				
				for(Element element : elements) {
					System.out.println(element.text());
					//choongang.txt 에 출력하기
					out.println(element.text());
				}//for end					
			}//for end
			
			//자원반납
			out.close();
			fw.close();
			System.out.println("--------soldesk.txt 공지사항 제목 저장 완성!!");
			
		}catch (Exception e) {
			System.out.println("크롤링 실패 : " + e);
		}//end
		
		
		
		

	}//main() end
}//class end
