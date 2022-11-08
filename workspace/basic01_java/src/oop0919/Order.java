package oop0919;

import java.util.Vector;

//상품 구매 관련 클래스
public class Order {
	//멤버변수 field
	private int myMoney=1000; //나의 총재산
	private int myMileage=0;  //나의 마일리지 점수(bonusPoint 누적)
	private int i=0;
	//상품을 구매했을 때 어떤 상품을 구매했는지 저장 (나의 구매상품 목록)
	//Product[] item=new Product[10];
	private Vector<Product> item=new Vector<>();
	
	//생성자함수 constructor
	public Order() {}	
	
	//멤버함수 method
	public void buy(Product p) { //다형성		
		
		if(p.price>this.myMoney) {
			System.out.println("잔액이 부족합니다!!");
			return; //함수가 호출된 시점으로 되돌아간다
		}//if end
		//item[i++]=p; item[i]배열로 구매상품 저장
		item.add(p); //구매상품 저장
		this.myMoney=this.myMoney-p.price;			//나의 재산은 감소
		this.myMileage=this.myMileage+p.bonusPoint; //나의 마일리지는 증가
	}//buy() end
	
	//반품하기
	public void refund(Product p) {
		if(item.remove(p)) { //item.remove()는 boolean타입
			System.out.println(p.toString()+"반품되었습니다~");
			this.myMoney=this.myMoney+p.price;			//나의 재산은 증가
			this.myMileage=this.myMileage-p.bonusPoint; //나의 마일리지는 감소
		}else {
			System.out.println("구매내역에 상품이 없습니다!!");
		}//if end
	}//refund() end
	
	
	public void disp() {
		
		if(item.isEmpty()) {
			System.out.println("구매상품 없음!!");
			return;
		}//if end
		
		//구매한 상품 목록
		StringBuilder shoplist=new StringBuilder();		
		//사용금액
		/* item[i]배열
		int hap=0;
		for(int n=0; n<item.length; n++) {
			if(item[n]==null) {
				break;
			}//if end
			shoplist.append(item[n].toString()+" "); //상품명
			hap+=item[n].price;
		}//for end
		*/
		int hap=0;
		for(int n=0; n<item.size(); n++) {
			Product p=item.get(n);			   //상품 하나씩 가져오기
			shoplist.append(p.toString()+" "); //상품명
			hap+=p.price;
		}//for end
		
		System.out.println("구매 상품 목록 : "+shoplist);
		System.out.println("사용금액 : "+hap);
		System.out.println("나의 남은 재산 : "+this.myMoney);
		System.out.println("나의 마일리지 : " +this.myMileage);
		
	}//disp() end
}//class end


