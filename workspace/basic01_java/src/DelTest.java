import java.io.File;

public class DelTest {

	public static void main(String[] args) {
		
		try {			
			File file=new File(args[0]);
			
			if(file.exists()) {
				if(file.delete()) {
					System.out.println("1 file deleted");
				}else {
					System.out.println("deletion failure");
				}//if end
			}else {
				System.out.println("File Not Found!!");
			}//if end
			
		}catch (Exception e) {
			System.out.println("deletion failure"+ e);
		}//end

		
		
		
		
	}//main() end
}//class end