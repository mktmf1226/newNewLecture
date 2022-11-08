package oop0913;


class Sungjuk{
	private String name;
	private int kor, eng, mat;
	private int aver;
	
	public Sungjuk() { //기본 생성자함수 default constructor
		//생성자 함수도 자신의 다른 생성자 함수를 호출할 수 있다
		//this.Sungjuk("손흥민"); error
		this("손흥민");
	}//end
	
	public Sungjuk(String name) {
		this.name=name; //this.멤버변수=매개변수
	}//end
	
	public Sungjuk(int kor, int eng, int mat) {
		this("박지성");
		this.kor=kor;
		this.eng=eng;
		this.mat=mat;
		//this("박지성"); error. 자신의 생성자 함수를 호출하는 경우 첫줄에서 호출한다
	}//end
	
	public Sungjuk(int aver) {
		disp(); //생성자함수에서 일반 메소드를 호출 가능하다
	}//end
	
	public void disp() {
		//this(85); error. 일반메소드에서는 생성자함수를 호출 불가능하다
	}//disp() end
	
	
}//class end





public class Test05_this {

	public static void main(String[] args) {
		//this()
		//->자신의 생성자 함수가 자신의 생성자 함수를 호출할 때
		
		
		
		
	}//main() end
}//class end