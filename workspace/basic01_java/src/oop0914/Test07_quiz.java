package oop0914;

public class Test07_quiz {

	public static void main(String[] args) {
		//연습문제
		
		//문1)주민번호의 각 숫자의 합을 구하시오 (Character클래스와 charAt()함수 이용)
        //   8+9+1+2+3+0+1+2+3+4+5+6+7
		
		String jumin="8912301234567";		
		int hap=0;
		
		for(int i=0; i<jumin.length(); i++) {
			char buno=jumin.charAt(i);
			//'8' -> 8
			hap+=Character.getNumericValue(buno);
			//hap+=(int)(buno-'0');
		}//for end
		System.out.println(hap); //51
		
		
		
		
		
		
		
		
		
		
		//문2)대소문자를 서로 바꿔서 출력하시오 (Character클래스와 charAt()함수 이용)
        //   gONE wITH tHE wIND
		
        String str="Gone With The Wind";
        int size=str.length();
        Character[] ch=new Character[size];
        
        for(int i=0; i<size; i++) {
        	ch[i]=str.charAt(i);
        	
        	if(Character.isUpperCase(ch[i])) {
        		System.out.print(Character.toLowerCase(ch[i]));
        	}else if(Character.isLowerCase(ch[i])) {
        		System.out.print(Character.toUpperCase(ch[i]));
        	}else {
        		System.out.print(ch[i]);
        	}//if end
        	
        	
        	/*
			if(ch[i]>='A' && ch[i]<='Z') {
				System.out.printf("%c", ch[i]+32);
			}//if end
			
			if(ch[i]>='a' && ch[i]<='z') {
				System.out.printf("%c", ch[i]-32);
			}//if end
			*/
        }//for end
        
        
        
	}//main() end
}//class end