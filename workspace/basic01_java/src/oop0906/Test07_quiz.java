package oop0906;

public class Test07_quiz {

	public static void main(String[] args) {
		//2차원 배열 연습문제
		
		System.out.println("------문제1-------");
		
		char[] ch= {'I', 't', 'W', 'i', 'l', 'l'};
		int size=ch.length; //6
		
		//문1)대, 소문자의 갯수를 각각 구하시오
		//->대문자 : 2개
		//->소문자 : 4개
		
		//강사님풀이
		int upper=0; //대문자의 갯수
		int lower=0; //소문자의 갯수
		
		for(int i=0; i<size; i++) {
			if(ch[i]>='A' && ch[i]<='Z') {upper++;}
			
			if(ch[i]>='a' && ch[i]<='z') {lower++;}
		}//for end
		
		System.out.printf("대문자 갯수: %d\n", upper);
		System.out.printf("대문자 갯수: %d\n", lower);
				
		
		
		
		//내풀이
		int bcount=0;
		int scount=0;
		for(int i=0; i<size; i++) {
			if(ch[i]>='A' && ch[i]<='Z') {
				bcount++;
			}else if(ch[i]>='a' && ch[i]<='z') {
				scount++;
			}//if end
		}//for end
		System.out.println("대문자 : "+bcount+"개\r"+"소문자 : "+scount+"개");
		
		
		//////////////////////////////////////////////////
		System.out.println("------문제2-------");
		//문2)대소문자를 서로 바꿔서 출력하시오
		//-> iTwILL
		
		//강사님 풀이
		for(int i=0; i<size; i++) {
			if(ch[i]>='A' && ch[i]<='Z') {
				System.out.printf("%c", ch[i]+32);
			}//if end
			
			if(ch[i]>='a' && ch[i]<='z') {
				System.out.printf("%c", ch[i]-32);
			}//if end			
		}//for end
		System.out.println();
		
		
		
		
		//내풀이
		//System.out.println('A'-'a');
		for(int i=0; i<size; i++) {
			if(ch[i]>='A' && ch[i]<='Z') {
				ch[i]=(char)(ch[i]+32);
			}else if(ch[i]>='a' && ch[i]<='z') {
				ch[i]=(char)(ch[i]-32);
			}//if end
			System.out.print(ch[i]);
		}//for end
		System.out.println();
		
		
		
		//////////////////////////////////////////////////
		System.out.println("------문제3-------");
		//문3)모음의 갯수를 구하시오 (A E I O U a e i o u)
		//->모음의 갯수 : 2개
				
		//강사님 풀이
		int mo=0; //모음의 갯수
		for(int i=0;i<size;i++) {
			char c=ch[i];
			if(c>='A' && c<='Z') {  //대문자인지?
				c=(char)(c+32);		//소문자로 변경
			}//if end
			
			switch(c) {
				case 'a':
				case 'e':
				case 'i':
				case 'o':
				case 'u': mo++;
			}//switch end
		}//for end
		
		System.out.printf("모음의 갯수: %d\n", mo);
		
		
		
		
		//내풀이
		char[] moum= {'A','E','I','O','U','a','e','i','o','u'};
		int msize=moum.length; //10개
		int mcount=0;
		
		for(int i=0; i<size; i++) {
			for(int j=0; j<msize; j++) {
				if(ch[i]==moum[j]) {
					mcount++;
				}//if end
			}//for end			
		}//for end
		System.out.println("모음의 갯수 : "+mcount+"개");

		
		
		
		//////////////////////////////////////////////////
		System.out.println("------문제4-------");
		
		//문4)각행의 모음의 갯수를 구하시오
		//str[0]행 : 2개
		//str[1]행 : 1개
		//str[2]행 : 2개
		char[][] str= {
						 {'Y', 'e', 'a', 'r'}
						,{'M', 'o', 'n', 't', 'h'}
						,{'D', 'a', 't', 'e'}
					  };
		
		//강사님 풀이
		int row=str.length; //3
		int count=0;
		
		for(int r=0; r<row; r++) {
			int col=str[r].length;
			for(int c=0; c<col; c++) {
				char w=str[r][c];
				if(w>='A' && w<='Z') {  //대문자인지?
					w=(char)(w+32);		//소문자로 변경
				}//if end
				
				switch(w) {
					case 'a':
					case 'e':
					case 'i':
					case 'o':
					case 'u': count++;
				}//switch end
			}//for end
			System.out.printf("str[%d]행 모음의 갯수 : %d개\n", r, count);
			count=0;
		}//for end
		
		
		
		
		
		
		
		//내풀이
		int srow=str.length;
		mcount=0;
				
		
		for(int r=0; r<srow; r++) {
			int scol=str[r].length;
			for(int c=0; c<scol; c++) {
				for(int i=0; i<msize; i++) {
					if(moum[i]==str[r][c]) {
						mcount++;
					}//if end
				}//for end
			}//for end
			System.out.println("str["+r+"]행 : "+mcount+"개");
			mcount=0;
		}//for end			
		
		
		
		
		//////////////////////////////////////////////////
		System.out.println("------문제5-------");

		
		//문5)대각선 방향의 각 요소의 합을 구하시오
		//대각선 ↘ 방향의 합 (4+9+7)
		//대각선 ↙ 방향의 합 (2+9+6)
		int[][] num= {
						 {4,3,2}
						,{5,9,1}
						,{6,8,7}
					 };
		
		//강사님 풀이
		int hap1=0; //대각선 ↘
		int hap2=0; //대각선 ↙
		
		//num[0][0]+num[1][1]+num[2][2]
		//num[0][2]+num[1][1]+num[2][0]
		for(int i=0; i<num.length; i++) {
			hap1+=num[i][i];
			//hap2+=num[i][2-i]; 이것도 되고
			hap2+=num[i][num.length-1-i];
		}//for end
		System.out.printf("대각선 ↘ 방향의 합 : %d\n", hap1);
		System.out.printf("대각선 ↙ 방향의 합 : %d\n", hap2);
		
		
		
		
		
		
		
		
		//내 풀이
		int totalOne=0;
		int totalTwo=0;
		
		for(int r=0;r<3;r++) {
			for(int c=0;c<3;c++) {
				if((r==0 && c==0) || (r==1 && c==1) || (r==2 && c==2)) {
					totalOne=totalOne+num[r][c];
				}//if end
			}//for end
		}//for end
		
		for(int r=0;r<3;r++) {
			for(int c=0;c<3;c++) {
				if((r==0 && c==2) || (r==1 && c==1) || (r==2 && c==0)) {
					totalTwo=totalTwo+num[r][c];
				}//if end
			}//for end
		}//for end

		System.out.println("대각선↘방향의 합은 "+totalOne);
		System.out.println("대각선↙방향의 합은 "+totalTwo);
		
		
		
		

	}//main() end
}//class end
