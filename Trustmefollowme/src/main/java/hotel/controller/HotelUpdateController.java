package hotel.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import hotel.model.HotelBean;
import hotel.model.HotelDao;

@Controller
public class HotelUpdateController {
	private final String command = "hotelUpdate.ht"; 
	private final String gotoPage ="hotelUpdateForm";
	private final String viewPage ="redirect:admin.mb";
@Autowired
@Qualifier("hotelDao")
private HotelDao hotelDao;
@Autowired
ServletContext servletContext;

@RequestMapping(value=command,method=RequestMethod.GET)
public String updateForm( @RequestParam("hnum")int hnum,@RequestParam(value="pageNumber",required = false)String pageNumber,Model model) {


		HotelBean hotel = hotelDao.getHotel(hnum);
//		System.out.println(hotel.getFacility());
		model.addAttribute("hotel",hotel);
		model.addAttribute("pageNumber",pageNumber);
		return gotoPage;
	}


@RequestMapping(value = command,method = RequestMethod.POST)
public String update(@ModelAttribute("hotel") @Valid HotelBean hb,BindingResult bresult,
					@RequestParam(value="pageNumber",required = false)String pageNumber, 
					@RequestParam(value="cate",required = false)String cate,
					HttpServletRequest request,Model model) throws IllegalStateException, IOException {


	if(bresult.hasErrors()) {
		model.addAttribute("pageNumber", pageNumber);
		return gotoPage;
	}
//
//	if(hb.getUpload() == null) {
//		hb.setImage(hb.getD_image());
//	}
//	if(hb.getUpload2() == null) {
//		hb.setImage2(hb.getD_image2());
//	}
//	if(hb.getUpload3() == null) {
//		hb.setImage3(hb.getD_image3());
//	}
//	if(hb.getUpload4() == null) {
//		hb.setImage4(hb.getD_image4());
//	}
//	if(hb.getUpload5() == null) {
//		hb.setImage5(hb.getD_image5());
//	}
//	if(hb.getUpload6() == null) {
//		hb.setImage6(hb.getD_image6());
//	}
	
	hotelDao.updateHotel(hb);
	//String uploadPath = servletContext.getRealPath("/resources/images/");
	String uploadPath = servletContext.getRealPath("/resources/images/");
	
	File newImage = new File(uploadPath+File.separator+hb.getImage());
	File delImage = new File(uploadPath+File.separator+hb.getD_image());
	
	MultipartFile multi = hb.getUpload();
//	multi.transferTo(newImage);
//	delImage.delete();
//	
//	if(hb.getUpload2() != null) {
//		File newImage2 = new File(uploadPath+File.separator+hb.getImage2());
//		File delImage2 = new File(uploadPath+File.separator+hb.getD_image2());
//		
//		MultipartFile multi2 = hb.getUpload2();
//		multi2.transferTo(newImage2);
//		delImage2.delete();
//	}
//	
//	if(hb.getUpload3() != null) {
//		File newImage3 = new File(uploadPath+File.separator+hb.getImage3());
//		File delImage3 = new File(uploadPath+File.separator+hb.getD_image3());
//		
//		MultipartFile multi3 = hb.getUpload3();
//		multi3.transferTo(newImage3);
//		delImage3.delete();
//	}
//	
//	if(hb.getUpload4() != null) {
//		File newImage4 = new File(uploadPath+File.separator+hb.getImage4());
//		File delImage4 = new File(uploadPath+File.separator+hb.getD_image4());
//		
//		MultipartFile multi4 = hb.getUpload4();
//		multi4.transferTo(newImage4);
//		delImage4.delete();
//	}
//	
//	if(hb.getUpload5() != null) {
//		File newImage5 = new File(uploadPath+File.separator+hb.getImage5());
//		File delImage5 = new File(uploadPath+File.separator+hb.getD_image5());
//		
//		MultipartFile multi5 = hb.getUpload5();
//		multi5.transferTo(newImage5);
//		delImage5.delete();
//	}
//	if(hb.getUpload6() != null) {
//		File newImage6 = new File(uploadPath+File.separator+hb.getImage6());
//		File delImage6 = new File(uploadPath+File.separator+hb.getD_image6());
//		
//		MultipartFile multi6 = hb.getUpload6();
//		multi6.transferTo(newImage6);
//		delImage6.delete();
//	}
//	
	model.addAttribute("cate","hotel");
	return viewPage+"?pageNumber="+pageNumber;
	}
}
