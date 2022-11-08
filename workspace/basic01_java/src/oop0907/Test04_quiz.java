package oop0907;

public class Test04_quiz {

	
	//강사님 풀이
	public static double sd(int[] aver) {
		int size=aver.length; //요소의 갯수 5
		
		//1) aver의 각 요소의 누적 합 구하기
		double hap=0.0;
		for(int i=0; i<size; i++) {
			hap+=aver[i];
		}//for end
		
		//aver 배열 요소들의 평균 구하기(87.2)
		double avg=hap/size;
		
		double sum=0.0; //편차들의 총 합계
		for(int i=0; i<size; i++) {
			//aver의 각 요소에서 avg값과의 차이를 구하고
			double d=aver[i]-avg;
			
			//2) avg(87.2)와의 차이값을 전부 양수로 바꾼다(편차)
			d=Math.abs(d);
			
			//위에서 나온 편차들을 누적한다 (2.2+2.8+5.8+1.2+5.2)
			sum=sum+d;
		}//for end
		
		//3) 표준편차
		return sum/size;
		
	}//sd() end
	
	
	
	
	
	
	/* 내 풀이
	public static double sd(int[] a) {		
		double result=0.0;	
				
		//0) 평균값 87.2 구하기
		for(int i=0; i<a.length; i++) {					
			result+=a[i];			
		}//for end
		result=result/5;
		
		//1) aver의 각 요소에서 87.2를 뺄셈
		double[] temp= new double[a.length]; //double[] temp={0,0,0,0,0};와 같음
		for(int i=0; i<a.length; i++) {					
			temp[i]=a[i]-result;			
		}//for end

		//2) 1)의 값을 전부 양수로 바꾸기
		for(int i=0; i<a.length; i++) {					
			temp[i]=Math.abs(temp[i]);
		}//for end	
		
		//3) 2)의 편차들의 평균값
		result=0;
		for(int i=0; i<a.length; i++) {					
			result+=temp[i];
		}//for end	
		result=result/5;
				
		return result;
	}//sd() end
	*/
	
		
	public static void main(String[] args) {
		//문제) 표준편차(Standard deviation) 구하기
		
		/* 빅데이터 하려면 이거 해야한대
		빅데이터
		저장, 수입	- 크롤링, 데이터베이스
		분석, 예측	- 통계(회귀분석, 상관분석)	R프로그램
		비즈니스 모델
		*/
		
		int[] aver= {85, 90, 93, 86, 82};
		double result=sd(aver);
		System.out.printf("표준편차 : %.2f", result); //소수점아래 2자리 출력
		/*
			1) aver의 평균(87.2)를 구하고, aver의 각 요소에서 87.2를 뺄셈한다
			   85-87.2 = -2.2
			   90-87.2 =  2.8
			   93-87.2 =  5.8
			   86-87.2 = -1.2
			   82-87.2 = -5.2
			
			2) 1)의 값을 전부 양수로 바꾼다 -> 편차
			   2.2
			   2.8
			   5.8
			   1.2
			   5.2
			   
			3) 2)의 편차들의 평균값 : 표준편차
			   (2.2+2.8+5.8+1.2+5.2)/5 -> 3.44
		*/

	}//main() end
}//class end