package restaurant.controller;

import java.io.File;

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

import restaurant.model.RestaurantBean;
import restaurant.model.RestaurantDao;

@Controller
public class RestaurantUpdateController {


	private final String command = "/restUpdate.re";
	private final String viewPage = "restaurantUpdateForm";
	private final String gotoPage = "redirect:/admin.mb";
	
	@Autowired
	private RestaurantDao restaurantDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String restUpdateForm(Model model, @RequestParam("rnum") int rnum,
			@RequestParam(value="pageNumber",required = false)String pageNumber) {
		
		RestaurantBean restaurantBean = restaurantDao.restOneInfo(rnum);
		
		model.addAttribute("restaurantBean", restaurantBean);
		model.addAttribute("pageNumber",pageNumber);
		return viewPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String restUpdate(Model model, HttpServletRequest request,
							@Valid RestaurantBean rb, BindingResult result,
							@RequestParam(value="cate",required = false)String cate) {
		
		
		if(result.hasErrors()) {
			
			return viewPage;
		}
		
		
		restaurantDao.restUpdate(rb);
		
		String upload = servletContext.getRealPath("/resources/images/");
		
		File file = new File(upload+File.separator+rb.getImage());
		File delfile = new File(upload+File.separator+rb.getImgdel());
		
		File file2 = new File(upload+File.separator+rb.getImage2());
		File delfile2 = new File(upload+File.separator+rb.getImgdel2());
		
		File file3 = new File(upload+File.separator+rb.getImage3());
		File delfile3 = new File(upload+File.separator+rb.getImgdel3());
		
		File file4 = new File(upload+File.separator+rb.getImage4());
		File delfile4 = new File(upload+File.separator+rb.getImgdel4());
		
		File file5 = new File(upload+File.separator+rb.getImage5());
		File delfile5 = new File(upload+File.separator+rb.getImgdel5());
		
		MultipartFile multi = rb.getImgUpload();
		MultipartFile multi2 = rb.getImgUpload2();
		MultipartFile multi3 = rb.getImgUpload3();
		MultipartFile multi4 = rb.getImgUpload4();
		MultipartFile multi5 = rb.getImgUpload5();
		
		try {
			multi.transferTo(file);
			multi2.transferTo(file2);
			multi3.transferTo(file3);
			multi4.transferTo(file4);
			multi5.transferTo(file5);
			
			delfile.delete();
			delfile2.delete();
			delfile3.delete();
			delfile4.delete();
			delfile5.delete();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("cate", "restaurant");
		return gotoPage;
	}
}
