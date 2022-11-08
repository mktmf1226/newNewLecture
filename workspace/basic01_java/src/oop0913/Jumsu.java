package oop0913;

public class Jumsu {
	//멤버변수 field
	private int no;					//번호
	private String name;			//이름
	private char[] ox=new char[5];  //OX표시
	private int[] answer=new int[5];//답안지 제출
	public int score;				//점수
	public int rank;				//등수
	
	//생성자함수 constructor
	public Jumsu() {}//기본생성자함수 수동 생성	
	public Jumsu(int no, String name, int a0, int a1, int a2, int a3, int a4) {		
		this.no = no;
		this.name = name;
		this.answer[0]=a0;
		this.answer[1]=a1;
		this.answer[2]=a2;
		this.answer[3]=a3;
		this.answer[4]=a4;
		this.rank=1;
	}//end	
	
	//멤버함수 method
	public void compute() {
		//답안지 정답
		int[] dap= {3, 3, 3, 3, 3};
		
		//문제) 정답(dap)과 제출한 답안(answer)를 비교해서
		//ox를 구하고, 맞은 갯수에 따라 점수(score)를 구하시오
		
		int size=dap.length;
		for(int i=0; i<size; i++) {
			if(this.answer[i]==dap[i]) {
				this.ox[i]='O';
				this.score+=20;
			}else{
				this.ox[i]='X';
			}//if end
		}//for end
		
		
	}//compute() end
	
	public void disp() {
		System.out.print(no+"   ");
		System.out.print(name+"  ");
		System.out.print(ox[0]+"  ");
		System.out.print(ox[1]+"  ");
		System.out.print(ox[2]+"  ");
		System.out.print(ox[3]+"  ");
		System.out.print(ox[4]+"   ");
		System.out.print(score+"   ");
		System.out.print(rank);
		System.out.println();
	}//disp() end
		
	
	//static함수
	static void head() {
		System.out.println("	    ** 시험결과 **");
		System.out.println("====================================");
		System.out.println("번호  이름   1  2  3  4  5  점수  등수");
		System.out.println("------------------------------------");
	}//head() end
	
	static void line() {
		System.out.println("------------------------------------");
	}//line() end
	

}
