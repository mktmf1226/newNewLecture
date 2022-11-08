package oop0914;

class Korea{
	String name="대한민국";
	final void view() {
		System.out.println("Korea.view()...");
	}//view() end
	void disp() {
		System.out.println("Korea.disp()..." + name);
	}//disp() end
}//class end


class Seoul extends Korea{}//class end


class Busan extends Korea{
	String name="부산광역시";  //super.name은 부모클래스의 변수를 가져오는 것
							 //그냥 name은 현재클래스에서의 새 변수를 뜻한다.
							 //부모보다 자식 우선
	
	@Override		//<-annotation
	void disp() {
		System.out.println("Busan.disp()..." + name);
	}//disp() end
	
	/*
		@Override
		void view() {} 에러. final메소드는 더이상 오버라이드 할 수 없다
	*/	
}//class end


public class Test04_override {

	public static void main(String[] args) {
		//Method Override 함수 재정의
		//->상속관계에서 물려받은 메소드를 다시 수정(리폼)
		
		
		//1)오버라이드 하기 전
		Seoul se=new Seoul();
		se.disp();
		se.view();		
		
		//2)오버라이드 한 후
		Busan bu=new Busan();
		bu.disp();
		bu.view(); //final 메소드는 상속은 가능하지만 override는 할 수 없다
		
		
		
	}//main() end
}//class end
