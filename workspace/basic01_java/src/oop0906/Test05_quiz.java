package oop0906;

public class Test05_quiz {

	public static void main(String[] args) {
		//연습문제
		
		//문1)알파벳을 아래와 같이 한줄에 5개씩 출력하시오
        /*
           ABCDE
           FGHIJ
           KLMNO
           PQRST
           UVWXY
           Z
        */
		//강사님 풀이
		int count=0;
		for(char ch='A'; ch<='Z'; ch++) {
			count++;
			System.out.print(ch);
			//System.out.print(count);
			if(count%5==0) {
				System.out.println();
			}//if end
		}//for end
		System.out.println();
		System.out.println("--------");
		
		
		
		
		//내 풀이
		//System.out.println((int)'Z');		
		for(int i=0; i<26; i=i+5) {
			for(int j=i+65; j<i+70; j++) {
				System.out.print((char)j);
				if(j==90)break;				
			}//for end
			System.out.println();
		}//for end
		
		
		
		
		
		
		System.out.println("--------");
		///////////////////////////////////////////////////////
		//문2)아래와 같이 출력하시오
        /*
           ####
            ###
             ##
              #
        */
		for(int a=1; a<=4; a++) {
			for(int b=1; b<=4; b++) {
				if(a<=b) {
					System.out.print("#");
				}else {
					System.out.print(" ");
				}//if end
			}//for end
			System.out.println();
		}//for end
				
		System.out.println("--------");
		
		
		//내 풀이
		for(int a=4; a>=1; a--) {
			for(int b=4; b>a; b--) {
				System.out.print(" ");
			}//for end
			
			for(int b=0; b<a; b++) {
				System.out.print("#");
			}//for end
			System.out.println();
		}//for end		
		
		
		System.out.println("--------");
		////////////////////////////////////////////////////////
		//문3)다음식의 결과값을 구하시오
		/* 
        1   2    3    4    5      99
        ─ - ─ +  ─ -  ─ +  ─ ...  ──   = ?
        2   3    4    5    6      100
		*/
		
		//분수 계산 연산자가 번갈아가며 나온다. 결과만 출력하기
		//강사님 풀이
		double sum=0;
		boolean flag=false;
		for(int a=1; a<=99; a++) {
			if(flag) {
				sum=sum-(a/(double)(a+1));
				flag=false;
			}else {
				sum=sum+(a/(double)(a+1));
				flag=true;
			}//if end
		}//for end
		System.out.println(sum);
		
		
		
		
		
		System.out.println("--------");
		//내 풀이
		float total=0;
		for(float a=1; a<=99; a++) {
			if((a%2)==1) {
				total=total+(a/(a+1));
			}else {
				total=total-(a/(a+1));
			}
			
		}//for end
		
		System.out.println(total);
		
		
		
		
		
		
		
		System.out.println("--------");
		/////////////////////////////////////////////////////////
		//문4)아래와 같이 계산해서 출력하시오
        /*    
           1+....+10=55
           11+....+20=155
           21+....+30=255

           81+....+90=
           91+....+100=955   
        */
		//내 풀이와 강사님 풀이 동일
		int hap=0;
		for(int a=10; a<=100; a=a+10) {
			for(int b=a-9; b<=a; b++) {
				hap=hap+b;
			}//for end
			
			System.out.println((a-9)+"+....+"+a+"="+hap);
			hap=0;
		}//for end
		

		
		
		
		
		System.out.println("--------");
		///////////////////////////////////////////////////////////
		//문5)어느 달팽이는 낮에는 3cm올라가고, 밤에는 2.5cm 내려온다고 할때
        //   달팽이가 13cm의 나무 꼭대기에 올라가려면 며칠이 걸리는지 구하시오
		
		//강사님 풀이
		//13cm를 올라가기만 하면 안내려가도 된다.
		int day=0; //결과값
		double snail=0.0;//달팽이
		
		while(true) {
			day++;
			snail=snail+3.0;
			if(snail>=13.0) {
				break;
			}else {
				snail=snail-2.5;
			}//if end
		}//while end
		
		System.out.println(day+"일");
		System.out.println("--------");
		
		
		
		
		
		
		
		
		
		
		//내 풀이
		//낮부터 시작이라고 할 때,
		
		double namu=0;
		int haru=1;
		
		for(int a=1; a<=100; a++) {
			
			namu=namu+3-2.5;
			if(namu>=13)break;
			
			System.out.println(haru+"일 째에 올라간 길이"+namu+"cm");
			haru++;
		}//for
		
		System.out.println(haru+"일이 걸립니다.");
		
		
		
		
		
		
	}//main() end
}//class end
