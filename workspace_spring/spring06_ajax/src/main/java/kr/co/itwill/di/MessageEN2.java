package kr.co.itwill.di;

import javax.swing.JOptionPane;

public class MessageEN2 implements IHello {

	public MessageEN2() {
		System.out.println("-----MessageEN2() 객체 생성 됨");
	}//end

	@Override
	public void sayHello(String name) {
		JOptionPane.showMessageDialog(null, "Hello~~" + name);		
	}//end
	
}//class end
