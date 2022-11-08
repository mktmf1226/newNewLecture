package oop0914;

public class Test06_jumin {

	public static void main(String[] args) {
		//문제) 주민번호 유효성 검사
		// Jumin 클래스 생성해서 실습합니다
		
		Jumin id=new Jumin("8912301234567");
		
		if(id.validate()) {
			System.out.println("주민번호 맞다");
			id.disp();
		}else {
			System.out.println("주민번호 틀리다");
		}//if end
		
		
//		String bb="8912301234567";
//		
//		System.out.println(str.substring(0,1));//8 처음
//		System.out.println(str.substring(12,13));//7 끝
//		
//		String td=new String(str);
//		
//		System.out.println(td.charAt(0));  //8
//		System.out.println(td.charAt(12)); //7
//		System.out.println(bb.substring(4, 6));
		
		
	}//main() end
}//class end