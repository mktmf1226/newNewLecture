import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;

public class CopyTest {

	public static void main(String[] args) {
		
		
		String inName = args[0]; 
		String outName= args[1];
		
		FileReader fr=null;
		FileWriter fw=null;
		PrintWriter out=null;
		
		try {
			fr=new FileReader(inName);
			fw=new FileWriter(outName, false);
			out=new PrintWriter(fw, true);
			
			while(true) {
				int data=fr.read();
				if(data==-1) {
					break;
				}//if end
				out.printf("%c", data);
			}//while end
			System.out.println("1 file copied");
			
		}catch (Exception e) {
			System.out.println("copy failure "+ e);
		}finally {
			try {
				if(fr!=null) {fr.close();}
			}catch (Exception e) {}
			try {
				if(out!=null) {out.close();}
			}catch (Exception e) {}
			try {
				if(fw!=null) {fw.close();}
			}catch (Exception e) {}
		}//end
		
		

	}//main() end
}//class end