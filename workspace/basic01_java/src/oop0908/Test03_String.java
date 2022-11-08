package oop0908;

import java.util.StringTokenizer;

public class Test03_String {

	public static void main(String[] args) {
		//문자열 클래스
		
		String str="HAPPY";
		String name=new String("HAPPY");

		if(str==name) {
			System.out.println("같다");
		}else {
			System.out.println("다르다");
		}//if end
		
		//문자열의 내용을 비교하는 경우 == 연산자 사용하지 말고
		//equals()함수를 이용할 것
		
		if(str.equals(name)) {
			System.out.println("같다");
		}else {
			System.out.println("다르다");
		}//if end
		
		
		//문자열의 갯수가 0인지?
		if(str.isEmpty()) {
			System.out.println("빈문자열 이다");
		}else {
			System.out.println("빈문자열 아니다");
		}//if end
		////////////////////////////////////////////////////////
		
		//특정 문자를 기준으로 문자열 분리하기
		str=new String("Gone With The Wind");
		String[] word=str.split(" ");
		
		for(int i=0; i<word.length;i++) {
			System.out.println(word[i]);
		}//for end
		
		/////////////////////////////////////////////////////////

		//문자열에서 공백문자를 기준으로 분리하기
		StringTokenizer st=new StringTokenizer(str, " ");
		
		while(st.hasMoreElements()) {//토큰할 문자가 있는지?
			System.out.println(st.nextToken());
		}//while end
		
		/////////////////////////////////////////////////////////
		
		//문자열 연산 속도
		//(느림)String < StringBuffer < StringBuilder(빠름)
		
		String s1=""; //null아닌 빈 문자열
		System.out.println(s1.length()); //0
		
		s1=s1+"ONE";
		System.out.println(s1.length()+s1); //3ONE
		
		s1=s1+"TWO";
		System.out.println(s1.length()+s1); //6ONETWO
		
		s1=s1+"THREE";
		System.out.println(s1.length()+s1); //11ONETWOTHREE
		
		//모든 문자열 지우기(빈 문자열 대입)
		s1="";
		System.out.println(s1.length()+s1); //0
		//////////////////////////////////////////////////////////
		
		
		StringBuilder s2=new StringBuilder();
		
		s2.append("SEOUL");
		System.out.println(s2.length()+s2.toString()); //5SEOUL
		
		s2.append("JEJU");
		System.out.println(s2.length()+s2.toString()); //9SEOULJEJU
		
		s2.append("BUSAN");
		System.out.println(s2.length()+s2.toString()); //14SEOULJEJUBUSAN
		
		//모든 문자열 지우기
		s2.delete(0, s2.length());
		System.out.println(s2.length()+s2.toString()); //0

		//////////////////////////////////////////////////////////////////////
		
		StringBuffer s3=null; //메모리할당 하지 않음
		//System.out.println(s3.length()); NullPointerException발생
		
		
		
		
		
		
		
		
		
		
		
		
		
	}//main() end
}//class end
