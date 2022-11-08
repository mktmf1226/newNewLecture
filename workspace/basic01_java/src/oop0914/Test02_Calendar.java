package oop0914;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;


public class Test02_Calendar {

	public static void main(String[] args) {
		//날짜 관련 클래스 (년월일시분초 요일)
		//GregorianCalendar
		//Calendar
		//Date
		
		GregorianCalendar now=new GregorianCalendar();
		
		System.out.println(now.get(1));   //년 2022
		System.out.println(now.get(2));	  //월 8
		System.out.println(now.get(2)+1); //월 9
		System.out.println(now.get(5));   //일 14
		
		System.out.println(now.get(Calendar.YEAR));   //년 2022
		System.out.println(now.get(Calendar.MONTH));  //월 8
		System.out.println(now.get(Calendar.MONTH)+1);//월 9
		System.out.println(now.get(Calendar.DATE));   //일 14

		System.out.println(now.get(Calendar.HOUR));	  //시 10
		System.out.println(now.get(Calendar.MINUTE)); //분 43
		System.out.println(now.get(Calendar.SECOND)); //초 33
		
		//24시간을 기준으로
		System.out.println(now.get(Calendar.HOUR_OF_DAY)); //시 10
		//요일(1일 2월 3화 4수 5목 6금 7토)
		System.out.println(now.get(Calendar.DAY_OF_WEEK)); //수요일 4
		////////////////////////////////////////////////////////////////////
		
		
		//날짜 데이터의 연산
		
		//now날짜에 3년 더하기
		now.add(Calendar.YEAR, 3);   //2022+3
		System.out.println(now.get(Calendar.YEAR));  //2025
		
		//now날짜에 5달 빼기
		now.add(Calendar.MONTH, -5); //8-5
		System.out.println(now.get(Calendar.MONTH)); //3
		
		//now날짜에 7일 더하기
		now.add(Calendar.DATE, 7);   //14+7
		System.out.println(now.get(Calendar.DATE));  //21
		///////////////////////////////////////////////////////////////////
		
		//날짜 데이터 구성하기
		//1989년 5월 30일
		GregorianCalendar myBirth=new GregorianCalendar();
		//myBirth.set(1989, 5, 30); 생성자함수로도 처리 가능
		myBirth.set(Calendar.YEAR, 1989);
		//MONTH는 개발자실수로 수가 삐끗나므로 변수MAY를 주는게 확실
		myBirth.set(Calendar.MONTH, Calendar.MAY); 
		myBirth.set(Calendar.DATE, 30);
		
		
		
	}//main() end
}//class end
