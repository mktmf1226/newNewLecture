package kr.co.itwill.product;

import java.io.File;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/product")
public class ProductCont {

	public ProductCont() {
		System.out.println("-----ProductCont() 객체 생성 됨");
	}//end
	
	@Autowired
	ProductDAO productDao;
	
	//결과 확인 http://localhost:9095/product/list	
	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("product/list");
		mav.addObject("list", productDao.list());
		return mav;
	}//list()
	
	//결과 확인 http://localhost:9095/product/write
	@RequestMapping("/write")
	public String write() {
		return "product/write";
	}//write() end
	
	
	@RequestMapping("/insert")
	public String insert( @RequestParam Map<String, Object> map
						, @RequestParam MultipartFile img
						, HttpServletRequest req) {
		//주의사항 : 파일업로드 할 때 리네임되지 않음
		
		//업로드된 파일을 /storage 폴더에 저장
		String filename="-"; //파일명
		long filesize=0;	 //파일사이즈
		if(img != null && !img.isEmpty()) { //파일이 하나라도 있다면
			filename=img.getOriginalFilename(); //파일명 저장
			filesize=img.getSize();				//파일사이즈 저장. 테이블에 filesize칼럼 추가가능
			try {
				ServletContext application=req.getSession().getServletContext(); //application 공용공간에 저장
				String path=application.getRealPath("/storage"); //실제 물리적인 경로
				//System.out.println(path);
				//D:\java202207\workspace_spring\spring07_myshop\src\main\webapp\storage
				img.transferTo(new File(path+"/"+filename)); //경로+파일이름을 File로 저장
															  //역슬래시 두 개중 첫번째는 특수문자 명령어기능 예시) \t
			} catch (Exception e) {
				e.printStackTrace(); //에러메세지 출력
									 //System.out.println(e);와 동일
			}//try end
		}//if end		
		map.put("filename", filename);
		map.put("filesize", filesize);
		productDao.insert(map);
		return "redirect:/product/list"; //명령어 호출, / 절대경로로 시작
	}//insert() end
	
	
	@RequestMapping("/search")
	public ModelAndView search(@RequestParam(defaultValue="") String product_name) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("product/list"); //view단 호출
		mav.addObject("list", productDao.search(product_name));
		mav.addObject("product_name", product_name); //검색어 저장
		return mav;		
	}//search() end
	
	
	@RequestMapping("/detail/{product_code}")
	public ModelAndView detail(@PathVariable String product_code) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("product/detail"); //view단 호출
		mav.addObject("product", productDao.detail(product_code));
		return mav;
	}//detail() end
	/*
		@RequestParam
		http://192.168.0.1:9095?aaa=bbb&ccc=ddd
		
		@PathVariable
		http://192.168.0.1:9095/bbb/ddd
	*/
	
	
	
	@RequestMapping("/update")
	public String update( @RequestParam Map<String, Object> map
						, @RequestParam MultipartFile img
						, HttpServletRequest req) {
		//주의사항 : 파일업로드 할 때 리네임되지 않음
		
		//업로드된 파일을 /storage 폴더에 저장
		String filename="-"; //파일명
		long filesize=0;	 //파일사이즈
		if(img != null && !img.isEmpty()) { //파일을 수정했다면
			//oldFile
			String product_code=map.get("product_code").toString();
			Map<String, Object> product=productDao.detail(product_code);
			String oldFilename=product.get("filename").toString();
			//새 파일
			filename=img.getOriginalFilename(); //파일명 저장
			filesize=img.getSize();				//파일사이즈 저장. 테이블에 filesize칼럼 추가가능
			try {
				ServletContext application=req.getSession().getServletContext(); //application 공용공간에 저장
				String path=application.getRealPath("/storage"); //실제 물리적인 경로
				//System.out.println(path);
				//D:\java202207\workspace_spring\spring07_myshop\src\main\webapp\storage
				
				//oldFile 삭제하기
				File oldFile=new File(path+"/"+oldFilename);
				if(oldFile.exists()) { //실제 파일이 있다면
					oldFile.delete();  //파일 삭제
				}//if end
				//새 파일 저장
				img.transferTo(new File(path+"/"+filename)); //경로+파일이름을 File로 저장
															  //역슬래시 두 개중 첫번째는 특수문자 명령어기능 예시) \t
			} catch (Exception e) {
				e.printStackTrace(); //에러메세지 출력
									 //System.out.println(e);와 동일
			}//try end
		}else { //파일을 수정하지 않았다면
			String product_code=map.get("product_code").toString();
			Map<String, Object> product=productDao.detail(product_code);
			filename=product.get("filename").toString();
			filesize=Long.valueOf(product.get("filesize").toString());
		}//if end
		map.put("filename", filename);
		map.put("filesize", filesize);
		productDao.update(map);
		return "redirect:/product/list"; //명령어 호출, / 절대경로로 시작
	}//update() end
	
	
	@RequestMapping("/delete")
	public String delete(int product_code, HttpServletRequest req) {
		String filename=productDao.filename(product_code); //파일조회
		if(filename != null && !filename.equals("-")) { //삭제할 파일이 있다면
			ServletContext application=req.getSession().getServletContext();
			String path=application.getRealPath("/storage");
			File file=new File(path+"/"+filename);
			if(file.exists()) { //실제 파일이 있다면
				file.delete();  //파일 삭제
			}//if end
		}//if end
		productDao.delete(product_code);//prodcut.xml 행삭제
		return "redirect:/product/list";
	}//delete() end
	
	
	
	
	
}//class end
