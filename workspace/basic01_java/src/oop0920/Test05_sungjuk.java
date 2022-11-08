package oop0920;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.StringTokenizer;
import java.util.Vector;

public class Test05_sungjuk {

	public static void main(String[] args) {
		//문제) 성적프로그램
		//성적 입력 자료(sungjuk.txt)를 가져와서, 성적 결과 파일 완성하기(result.txt)
		/*
			1) 입력 데이터 파일 : sungjuk.txt
		
			2) 결과 파일 : result.txt
			
								성 / 적 / 결 /과
              -------------------------------------------------------
              이름     국어   영어  수학   평균  등수   결과
              -------------------------------------------------------
              라일락    100  100  100   100   1    합격 ********** 장학생
              진달래     50   55   60    55   4    불합격 *****
              개나리     95   95   35    75   3    재시험 *******
			  무궁화     80   85   90    85   2    합격 ********
              홍길동     60   40   30    43   5    불합격 ****
              ------------------------------------------------------
		*/
		
		//성적 입력 자료 sungjuk.txt 가져오기
		String inName="D:/java202207/sungjuk.txt";
		FileReader fr=null;
		BufferedReader br=null;
		
		//성적 결과 파일 result.txt
		String outName="D:/java202207/result.txt";		
		FileWriter fw=null;
		PrintWriter out=null;		
		
		
		try {
			
			//1)단계 : 데이터 저장 변수 선언
			String[] name = new String[5];
			int[] kor = new int[5];
			int[] eng = new int[5];
			int[] mat = new int[5];
			int[] aver = new int[5];
			int[] rank = {1, 1, 1, 1, 1};
			
			int size=name.length; //5
			int i=0;
			
			//2)단계 : 데이터 입력 파일(sungjuk.txt) 가져와서 내용을 읽기
			fr=new FileReader(inName);
			br=new BufferedReader(fr); //enter단위로 읽게끔
			
			while(true) {
				String line=br.readLine(); //"무궁화,95,90,100"
				if(line==null) {
					break;
				}//if end
				//System.out.println(line);
				
				// , 를 기준으로 문자열 분리 후 1)단계에서 선언한 변수에 저장하기
				String[] word=line.split(",");
				name[i]=word[0].trim();
				kor[i]=Integer.parseInt(word[1].trim());
				eng[i]=Integer.parseInt(word[2].trim());
				mat[i]=Integer.parseInt(word[3].trim());
				i++; //다음사람
				
			}//while end
			
			
			//3)단계 : 평균구하기
			for(i=0; i<size; i++) {
				aver[i]=(int)(kor[i]+eng[i]+mat[i])/3;
			}//for end
			
			//4)단계 : 등수구하기(평균을 기준으로)
			for(i=0; i<size; i++) {
				for(int j=0; j<size; j++) {
					if(aver[i]<aver[j]) {
						rank[i]++;
					}//if end
				}//for end
			}//for end
			
			
			//5)단계 : result.txt 결과 출력하기
			fw = new FileWriter(outName, false);
			out= new PrintWriter(fw, true);
			
			out.println("성/적/결/과");
			out.println("―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――");
			out.println("이름         국어   영어   수학   평균   등수   결과  ");
			out.println("―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――");
			
			//6)단계 : 5명의 데이터 출력하기
			for(i=0; i<size; i++) {
				out.printf("%-6s", name[i]); //6칸잡고 왼쪽정렬
				out.printf("  %5d", kor[i]); //5칸잡고 오른쪽정렬
				out.printf("  %5d  %5d  %5d  %4d", eng[i], mat[i], aver[i], rank[i]);
				
				
				//과락
				if(aver[i]>=70) {
					if(kor[i]<40 || eng[i]<40 || mat[i]<40) {
						out.printf("%-9s", "    재시험"); //9칸잡고 왼쪽정렬
					}else {
						out.printf("%-10s", "    합  격");
					}//if end
				}else {
					out.printf("%-9s", "    불합격");
				}//if end
				
				//평균 10점당 * 한 개씩
				for(int star=1; star<=aver[i]/10; star++) {
					out.printf("%c", '*');
				}//for end
				
				//평균 95점이상 장학생
				if(aver[i]>=95) {
					out.printf("%6s", "장학생");
				}//if end
				
				out.println(); //한사람 출력하고 줄바꿈
			}//for end
			
			System.out.println("result.txt 성적프로그램이 완성되었습니다");
			
		}catch (Exception e) {
			System.out.println("성적프로그램 읽고, 쓰기 실패 : " + e);
		}finally {
			try {
				if(br!=null) {br.close();}	
			}catch (Exception e) {}
			try {
				if(fr!=null) {fr.close();}
			}catch (Exception e) {}
			try {
				if(out!=null) {out.close();}
			}catch (Exception e) {}
			try {
				if(fw!=null) {fw.close();}
			}catch (Exception e) {}
		}//end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/* 내 풀이
		try {
			//파일 읽기
			fr=new FileReader(inName);			
			br=new BufferedReader(fr);
			Vector<String> students=new Vector<>();	
			Vector<String> myName=new Vector<>();  //이름			
			Vector<Integer> myKor=new Vector<>();  //국어
			Vector<Integer> myEng=new Vector<>();  //영어
			Vector<Integer> myMat=new Vector<>();  //수학
			Vector<Integer> myAver=new Vector<>(); //평균
			Vector<Integer> myRank=new Vector<>(); //등수
			int num=0; //1씩 늘어나는 정수
						
			while(true) {
				String line=br.readLine(); //한줄씩 읽기
				
				
				if(line==null) { //마지막 데이터를 읽었다면
					break; //while문 빠져나가기
				}else {
					
					//한줄씩 students에 담기							
					students.add(line);
					
					//콤마 구분으로 split하기
					String[] word=students.get(num).split(","); //[0]무궁화 [1]95 [2]90 [3]100
					myName.add(word[0]);
					myKor.add(Integer.parseInt(word[1]));
					myEng.add(Integer.parseInt(word[2]));
					myMat.add(Integer.parseInt(word[3]));
					
					//평균 구하기	
					myAver.add((myKor.get(num)+myKor.get(num)+myKor.get(num))/3);
					num++;
				}
				//if end		
				
				System.out.printf("%s\n", line); //문자형으로 형변환
				
			}//while end
			
			
			//등수 구하기
			int size=students.size();
			int rank=1;
			for(int a=0; a<size; a++) {
				for(int b=0; b<size; b++) {
					if(myAver.get(a)<myAver.get(b)) {
						rank+=1;
						
					}//if end
				}//for end				
				myRank.add(rank);
				rank=1;
			}//for end
			
			
			//파일 쓰기
			fw=new FileWriter(outname, false); //false : overwrite 모드
			out=new PrintWriter(fw, true); //true  : autoFlush 버퍼클리어
			
			
			out.println("	     성 / 적 / 결 /과 ");
			out.println("---------------------------------------------------");
			out.println("이름     국어  영어  수학   평균  등수   결과");
			out.println("---------------------------------------------------");
			for(int a=0; a<size; a++) {
				out.printf("%s   %d    %d    %d      %d       %d    ", 
						myName.get(a), myKor.get(a), myEng.get(a), myMat.get(a), myAver.get(a), myRank.get(a));
				if(myAver.get(a)>=70) {
					if(myKor.get(a)<40 || myEng.get(a)<40 || myMat.get(a)<40) {
						out.printf(" %s ", "재시험");
					}else {
						out.printf(" %s ", "합격");
					}//if end
				}else {
					out.printf(" %s ", "불합격");
				}//if end
				
				int byeol=myAver.get(a)/10;
				for(int b=0; b<byeol; b++) {
					out.printf("%c", '*');
				}
				
				if(myAver.get(a)>=95) {out.print("  장학생");}
				out.println();
			}//for end
			out.println("---------------------------------------------------");
            System.out.println("sungjuk.txt 데이터 파일 완성!");
			
		}catch (Exception e) {
			System.out.println("성적프로그램 읽고, 쓰기 실패 : " + e);
		}finally {
			//자원반납
			try {
				if(br!=null) {br.close();} //파일이 열려있다면 종료해라		
			}catch (Exception e) {}
			try {
				if(fr!=null) {fr.close();} //파일이 열려있다면 종료해라		
			}catch (Exception e) {}
			try {
				if(out!=null) {out.close();}
			}catch (Exception e) {}
			try {
				if(fw!=null) {fw.close();}
			}catch (Exception e) {}
		}//end
		*/
		
		
		
		
		
	}//main() end
}//class end
