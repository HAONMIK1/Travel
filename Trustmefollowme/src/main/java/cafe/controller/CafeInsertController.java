package cafe.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cafe.model.CafeBean;
import cafe.model.CafeDao;

@Controller
public class CafeInsertController {
	private final String command = "cafeInsert.cf";
	private final String viewPage = "cafeInsertForm";
	private final String gotoPage = "redirect:admin.mb";
	
	@Autowired
	private CafeDao cafeDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String cafeInsert() {
		return viewPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String cafeInsert(@Valid CafeBean cb, BindingResult cResult, HttpServletRequest request,@RequestParam(value="cate",required = false)String cate,Model model) throws IllegalStateException, IOException {
		if(cResult.hasErrors()) {
			return viewPage;
		}
		System.out.println("cb.getImage():"+cb.getImage());
		String uploadPath = request.getContextPath()+"/resources/images/";
		System.out.println("uploadPath:"+uploadPath);
		cafeDao.insertCafe(cb);
		
		File destination = new File(uploadPath+File.separator+cb.getImage());
		if(!destination.exists())
			destination.mkdirs();
		MultipartFile multi = cb.getUpload();
		multi.transferTo(destination);
		
		if(cb.getImage2() != null) {
			File destination2 = new File(uploadPath+File.separator+cb.getImage2());
			MultipartFile multi2 = cb.getUpload2();
			multi2.transferTo(destination2);
		}
		
		if(cb.getImage3() != null) {
			File destination3 = new File(uploadPath+File.separator+cb.getImage3());
			MultipartFile multi3 = cb.getUpload3();
			multi3.transferTo(destination3);
		}
		
		if(cb.getImage4() != null) {
			File destination4 = new File(uploadPath+File.separator+cb.getImage4());
			MultipartFile multi4 = cb.getUpload4();
			multi4.transferTo(destination4);
		}
		
		if(cb.getImage5() != null) {
			File destination5 = new File(uploadPath+File.separator+cb.getImage5());
			MultipartFile multi5 = cb.getUpload5();
			multi5.transferTo(destination5);
		}
		
		
		model.addAttribute("cate","cafe");
		return gotoPage;
	}
}
