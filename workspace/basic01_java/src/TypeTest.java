import java.io.FileReader;

public class TypeTest {

	public static void main(String[] args) {


		String filename=args[0];
		FileReader fr=null;
		
		try {
			
			fr=new FileReader(filename);
			
			while(true) {
				int data=fr.read();
				if(data==-1) { 
					break; 
				}//if end
				System.out.printf("%c", data); 
			}//while end
			
		}catch (Exception e) {
			System.out.println("file not found!! : " + e);
		}finally {
			
			try {
				if(fr!=null) {fr.close();} 
			}catch (Exception e) {}
		}//end
		
		
	}//main() end
}//class end