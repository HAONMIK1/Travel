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
public class CafeUpdateController {
	private final String command = "cafeUpdate.cf";
	private final String viewPage = "cafeUpdateForm";
	private final String gotoPage = "redirect:/admin.mb";
	
	@Autowired
	private CafeDao cafeDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String cafeUpdate(@RequestParam("cnum") String cnum, 
							@RequestParam("pageNumber") String pageNumber, 
							Model model) {
		CafeBean cb = cafeDao.getCafeDetailByCnum(cnum);
		model.addAttribute("cafeBean", cb);
		model.addAttribute("pageNumber", pageNumber);
		return viewPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String cafeUpdate(@Valid CafeBean cb, BindingResult cResult,  
							@RequestParam("pageNumber") String pageNumber, 
							Model model, HttpServletRequest request,@RequestParam(value="cate",required = false) String cate) throws IllegalStateException, IOException {
		if(cResult.hasErrors()) {
			model.addAttribute("pageNumber", pageNumber);
			return viewPage;
		}
		String uploadPath = servletContext.getRealPath("/resources/images/");
		cafeDao.updateCafe(cb);
		
		File newImage = new File(uploadPath+File.separator+cb.getImage());
		File delImage = new File(uploadPath+File.separator+cb.getD_image());
		
		MultipartFile multi = cb.getUpload();
		multi.transferTo(newImage);
		delImage.delete();
		
		if(cb.getUpload2() != null) {
			File newImage2 = new File(uploadPath+File.separator+cb.getImage2());
			File delImage2 = new File(uploadPath+File.separator+cb.getD_image2());
			
			MultipartFile multi2 = cb.getUpload2();
			multi2.transferTo(newImage2);
			delImage2.delete();
		}
		
		if(cb.getUpload3() != null) {
			File newImage3 = new File(uploadPath+File.separator+cb.getImage3());
			File delImage3 = new File(uploadPath+File.separator+cb.getD_image3());
			
			MultipartFile multi3 = cb.getUpload3();
			multi3.transferTo(newImage3);
			delImage3.delete();
		}
		
		if(cb.getUpload4() != null) {
			File newImage4 = new File(uploadPath+File.separator+cb.getImage4());
			File delImage4 = new File(uploadPath+File.separator+cb.getD_image4());
			
			MultipartFile multi4 = cb.getUpload4();
			multi4.transferTo(newImage4);
			delImage4.delete();
		}
		
		if(cb.getUpload5() != null) {
			File newImage5 = new File(uploadPath+File.separator+cb.getImage5());
			File delImage5 = new File(uploadPath+File.separator+cb.getD_image5());
			
			MultipartFile multi5 = cb.getUpload5();
			multi5.transferTo(newImage5);
			delImage5.delete();
		}
		model.addAttribute("cate","cafe");
		return gotoPage+"?pageNumber="+pageNumber;
	}
}
