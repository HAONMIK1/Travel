package hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import hotel.model.HotelBean;
import hotel.model.HotelDao;

@Controller
public class HotelInsertController {
	private final String command = "/hotelInsert.ht";
	private final String viewPage = "hotelInsertForm";
	private final String gotoPage = "redirect:/admin.mb";

	@Autowired
	@Qualifier("hotelDao")
	private HotelDao hotelDao;

	@Autowired
	ServletContext servletContext;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String insertForm() {
		return viewPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public String insert(@ModelAttribute("HotelBean") @Valid HotelBean hb, BindingResult bResult,
			HttpServletRequest request, Model model, @RequestParam(value = "cate", required = false) String cate,
			@RequestParam(value = "pageNumber", required = false) String pageNumber)
			throws IllegalStateException, IOException {

		if (bResult.hasErrors()) {
			return viewPage;
		}
		hotelDao.insertHotel(hb);

		String uploadPath = servletContext.getRealPath("/resources/images/");
		System.out.println("uploadPath:" + uploadPath);

//			File destination = new File(uploadPath+File.separator+hb.getImage());
//			if(!destination.exists())
//				destination.mkdirs();
//			MultipartFile multi = hb.getUpload();
//			multi.transferTo(destination);
//			
//			if(hb.getImage2() != null) {
//				File destination2 = new File(uploadPath+File.separator+hb.getImage2());
//				MultipartFile multi2 = hb.getUpload2();
//				multi2.transferTo(destination2);
//			}
//			
//			if(hb.getImage3() != null) {
//				File destination3 = new File(uploadPath+File.separator+hb.getImage3());
//				MultipartFile multi3 = hb.getUpload3();
//				multi3.transferTo(destination3);
//			}
//			if(hb.getImage4() != null) {
//				File destination4 = new File(uploadPath+File.separator+hb.getImage4());
//				MultipartFile multi4 = hb.getUpload4();
//				multi4.transferTo(destination4);
//			}
//			
//			if(hb.getImage5() != null) {
//				File destination5 = new File(uploadPath+File.separator+hb.getImage5());
//				MultipartFile multi5 = hb.getUpload5();
//				multi5.transferTo(destination5);
//			}
//			if(hb.getImage6() != null) {
//				File destination6 = new File(uploadPath+File.separator+hb.getImage6());
//				MultipartFile multi6 = hb.getUpload6();
//				multi6.transferTo(destination6);
//			}
		model.addAttribute("cate", "hotel");
		model.addAttribute("pageNumber", pageNumber);
		return gotoPage;

	}
}
