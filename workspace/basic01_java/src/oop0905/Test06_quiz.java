package oop0905;

public class Test06_quiz {

	public static void main(String[] args) {
		//연습문제
		//참조 : 지폐갯수 구하는 문제
		/*
			1년 : 365.2422일
			출력결과 : 365일 5시간 48분 46초
			
			1분 : 60초
			1시간 : 60분*60초 = 3600초
			1일  : 24시간*3600초 = 86400초
			1년  : 365.2422*86400 = 31,556,926.08		
		*/
		
		double year=365.2422;
		int total=(int)(year*86400);//31556926
		
		int d=(total)/86400;
		total=total%86400;
		
		int h=(total)/3600;
		total=total%3600;
		
		int m=(total)/60;
		total=total%60;
		
		int s=total;
		
		System.out.println(
			d + "일 "
		  + h + "시간 "
		  + m + "분 "
		  + s + "초 "
		);
		
		
		
		
	}//main() end

}//class end
