package oop0914;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Jumin {
	//멤버 변수 field
	private String juminno; //주민번호	
	
	//생성자함수 constructor
	public Jumin() {}	
	public Jumin(String juminno) {
		this.juminno = juminno;
	}	
	
	
	//멤버 함수 method
	public boolean validate() {
		boolean flag=false;
		//문)주민번호가 맞으면 flag변수값을 true 대입하시오
		Integer[] CHECKNUM= {2,3,4,5,6,7,8,9,2,3,4,5}; //곱할 값
		Integer[] save=new Integer[12];				   //곱한 결과 값
		int hap=0;
		int size=save.length;
		
		for(int i=0; i<size; i++) {
			//주민번호에서 한글자씩 가져와서 정수형변환
			int num=Integer.parseInt(juminno.substring(i, i+1));
			save[i]=num*CHECKNUM[i];
			hap=hap+save[i];
		}//for end
		
		int M=(11-(hap%11))%10; //오류 검증 번호
		//오류검증번호와 주민번호 마지막 글자가 같은지?
		if(M==Integer.parseInt(juminno.substring(12))) {
			flag=true;
		}//if end
		return flag;
		
		
		
		
		/* 내 풀이
		String str=new String(this.juminno);
		int hap=0;
		
		//in 배열에 주민번호 쪼개 담고 hap구하기
		Integer[] in=new Integer[13];
		
		for(int a=0; a<in.length; a++) {
			int b=a+1;
			in[a]=Integer.parseInt(str.substring(a,b));
			
			switch(a) {
				case  0:
				case  8: hap+=2*in[a]; break;
				case  1:
				case  9: hap+=3*in[a]; break;
				case  2:
				case 10: hap+=4*in[a]; break;
				case  3:
				case 11: hap+=5*in[a]; break;
				case  4: hap+=6*in[a]; break;
				case  5: hap+=7*in[a]; break;
				case  6: hap+=8*in[a]; break;
				case  7: hap+=9*in[a]; break;			
			}//switch end
		}//for end		
		
		if(in[12]==(11-hap%11)) {			
			flag=true;
		}//if end
		
		return flag;
		*/
		
		
		
	}//validate() end
	
	public void disp() {
		//생년월일, 성별, 나이, 띠 출력하기
		/*
	        생년월일 : 1989년12월30일
	        성별 : 남자
	        나이 : 32   ->GregorianCalendar클래스 이용
	        띠 :        ->태어난년도%12 (0원숭이 1닭 2개 ~~~~ 11양)
        */
		GregorianCalendar now=new GregorianCalendar();
		int cYear=now.get(Calendar.YEAR); //2022
		
		int myCode=Integer.parseInt(juminno.substring(6, 7)); //"1"->1 성별코드
		
		int myYear=0, myMonth=0, myDate=0;
		myYear =Integer.parseInt(juminno.substring(0, 2));	  //89  태어난 년도
		myMonth=Integer.parseInt(juminno.substring(2, 4));	  //12  태어난 월
		myDate =Integer.parseInt(juminno.substring(4, 6));	  //30  태어난 일
		
		switch(myCode) {
		case 1 :
		case 2 : myYear=1900+myYear; break;
		case 3 :
		case 4 : myYear=2000+myYear; break;
		}//switch end
		
		int myAge=cYear-myYear; //나이 구하기
		
		String gender="";
		switch(myCode%2) {
		case 0 : gender="여자"; break;
		case 1 : gender="남자"; break;
		}//switch end
		
		String[] animal = {"원숭이", "닭", "개", "돼지", "쥐", "소", "호랑이", "토끼", "용", "뱀", "말", "양"};
		
		System.out.println("주민번호: "+juminno);
		System.out.println("생년월일: "+myYear+"년"+myMonth+"월"+myDate+"일");
		System.out.println("나이: "+myAge);
		System.out.println("성별: "+gender);
		System.out.println("띠: "+animal[myYear%12]);
		
		
		
		/* 내 풀이
		GregorianCalendar now=new GregorianCalendar();
		String str=new String(this.juminno);
		
		//생년월일
		String yyyy=new String();
		String mm=new String();
		String dd=new String();
		
		if(str.substring(6, 7)=="3" || str.substring(6, 7)=="4") {
			yyyy="20"+str.substring(0, 2);
		}else {
			yyyy="19"+str.substring(0, 2);
		}//if end
		mm=str.substring(2, 4);
		dd=str.substring(4, 6);
		
		//성별
		String gender=new String();
		if(str.substring(6, 7)=="2" || str.substring(6, 7)=="4") {
			gender="여자";
		}else {
			gender="남자";
		}//if end
		
		//나이
		int age=0;
		now.add(Calendar.YEAR, Integer.parseInt(yyyy)*(-1));
		age=now.get(Calendar.YEAR);
		
		//띠
		String zo=new String();
		
		switch(Integer.parseInt(yyyy)%12) {
			case  0: zo="원숭이"; break;
			case  1: zo="닭"; break;
			case  2: zo="개"; break;
			case  3: zo="돼지"; break;
			case  4: zo="쥐"; break;
			case  5: zo="소"; break;
			case  6: zo="호랑이"; break;
			case  7: zo="토끼"; break;
			case  8: zo="용"; break;
			case  9: zo="뱀"; break;
			case 10: zo="말"; break;
			case 11: zo="양"; break;			
		}//switch end
		
		
		//출력
		System.out.println("생년월일 : "+yyyy+"년 "+mm+"월 "+dd+"일");
		System.out.println("성별 : "+gender);
		System.out.println("나이 : "+age);
		System.out.println("띠 : "+zo);		
		*/
		
		
	}//disp() end	
	
}//class end
