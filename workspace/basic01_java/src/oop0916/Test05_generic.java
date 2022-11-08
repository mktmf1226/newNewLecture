package oop0916;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Vector;


class Mountain{
	String name;  //산이름
	int height;	  //산높이
	
	public Mountain() {}

	public Mountain(String name, int height) {
		this.name = name;
		this.height = height;
	}//end	
}//class end








public class Test05_generic {

	public static void main(String[] args) {
		//제네릭 Generic
		/*
			- 요소를 수집하는 경우에 특정 자료형으로 제한할 수 있다
			- <E>	  Element
			- <K,V>	  Key, Value
			- <T> 	  (해당 객체를 생성할때 T의 타입이 정해진다)
			- <?>	  (어떤 자료형의 객체도 매개변수로 받는다. 와일드카드)
			- <참조자료형>
		*/
		
		//int형만 num배열에 대입 가능하다
		int[] num=new int[3];
		
		//Vector<int> 에러. 기본자료형은 올 수 없다
		//vec에는 String타입만 저장
		Vector<String> vec=new Vector<>();  //<> 생략가능
		vec.add("개나리");
		vec.add("진달래");
		vec.add(new String("무궁화"));
		//vec.add(3);					에러
		//vec.add(2.4);					에러
		//vec.add(new Character('R'));	에러 String타입만 올 수 있다
		
		for(int i=0; i<vec.size(); i++) {
			String str=vec.get(i);
			System.out.println(str);
		}//for end
		/////////////////////////////////////////////////////////////////
		
		
		ArrayList<Integer> list=new ArrayList<>();
		list.add(3);
		list.add(new Integer(5));
		//list.add(2.4);	 에러
		//list.add("KOREA"); 에러
		/////////////////////////////////////////////////////////////////
		
		
		HashSet<Double> set=new HashSet<>();
		set.add(1.2);
		set.add(new Double(3.5));
		//set.add(7);	에러
		//set.add("");	에러
		/////////////////////////////////////////////////////////////////
		
		
		HashMap<String, Character> map=new HashMap<>();
		map.put("one", 'R');
		map.put("two", new Character('r'));
		//map.put("three", "four"); 에러
		
		System.out.println(map.get("one")); //'R'		
		//////////////////////////////////////////////////////////////////
		
		
		Mountain m1=new Mountain("한라산", 1950);		
		Mountain m2=new Mountain("관악산", 1500);		
		Mountain m3=new Mountain("북한산", 1000);		
		
		ArrayList<Mountain> item=new ArrayList<>();
		item.add(m1);
		item.add(m2);
		item.add(m3);
		//item.add(""); 에러
		
		for(int i=0; i<item.size(); i++) {
			Mountain m=item.get(i);
			System.out.println(m.name);
			System.out.println(m.height);
		}//for end
		
		
		
		
		
		
	}//main() end
}//class end
