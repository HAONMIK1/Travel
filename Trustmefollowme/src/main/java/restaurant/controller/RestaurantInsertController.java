package restaurant.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import restaurant.model.RestaurantBean;
import restaurant.model.RestaurantDao;

@Controller
public class RestaurantInsertController {


	private final String command = "/restInsert.re";
	private final String viewPage = "restaurantInsertForm";
	private final String gotoPage = "redirect:admin.mb";
	
	@Autowired
	private RestaurantDao restaurantDao;

	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String restInsertForm() {
		
		
		return viewPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String restInsert(@Valid RestaurantBean rb, BindingResult result,Model model,
			@RequestParam(value="cate",required = false)String cate,
			@RequestParam(value="pageNumber", required = false)String pageNumber) throws IllegalStateException, IOException {
		
		if(result.hasErrors()) {
			return viewPage;
		}
		
		String upload = servletContext.getRealPath("/resources/images/");
		
		restaurantDao.restInsert(rb);
		
		File file = new File(upload+File.separator+rb.getImage());
		File file2 = new File(upload+File.separator+rb.getImage2());
		File file3 = new File(upload+File.separator+rb.getImage3());
		File file4 = new File(upload+File.separator+rb.getImage4());
		File file5 = new File(upload+File.separator+rb.getImage5());
		
		MultipartFile multi = rb.getImgUpload();
		MultipartFile multi2 = rb.getImgUpload2();
		MultipartFile multi3 = rb.getImgUpload3();
		MultipartFile multi4 = rb.getImgUpload4();
		MultipartFile multi5 = rb.getImgUpload5();
		
			multi.transferTo(file);
			multi2.transferTo(file2);
			multi3.transferTo(file3);
			multi4.transferTo(file4);
			multi5.transferTo(file5);
			
			model.addAttribute("cate","restaurant");
			model.addAttribute("pageNumber", pageNumber);
		
		return gotoPage;
	}
}
