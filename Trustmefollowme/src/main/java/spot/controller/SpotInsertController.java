package spot.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import spot.model.SpotBean;
import spot.model.SpotDao;

@Controller
public class SpotInsertController {

	private final String command = "/spotInsert.sp";
	private final String viewPage = "spotInsertForm";
	private final String gotoPage = "redirect:admin.mb";
	
	@Autowired
	private SpotDao  spotdao;

	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String spotInsertForm() {
		return viewPage;
	}
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String spotInsert(SpotBean sb, BindingResult result,HttpServletRequest request
			,Model model,@RequestParam(value="cate",required = false)String cate)throws IllegalStateException, IOException  {
		
		System.out.println("sb.getImage():"+sb.getAddress());
		System.out.println("sb.getImage():"+sb.getName());
		System.out.println("sb.getImage():"+sb.getContent());
		System.out.println("sb.getImage():"+sb.getImage());
	
		
		spotdao.spotInsert(sb);
		String uploadPath = servletContext.getRealPath("/resources/images/");
		System.out.println("uploadPath:"+uploadPath);
	
		
		File destination = new File(uploadPath+File.separator+sb.getImage());
		if(!destination.exists())
			destination.mkdirs();
		MultipartFile multi = sb.getUpload();
		multi.transferTo(destination);
		
		if(sb.getImage2() != null) {
			File destination2 = new File(uploadPath+File.separator+sb.getImage2());
			MultipartFile multi2 = sb.getUpload2();
			multi2.transferTo(destination2);
		}
		
		if(sb.getImage3() != null) {
			File destination3 = new File(uploadPath+File.separator+sb.getImage3());
			MultipartFile multi3 = sb.getUpload3();
			multi3.transferTo(destination3);
		}
		if(sb.getImage4() != null) {
			File destination4 = new File(uploadPath+File.separator+sb.getImage4());
			MultipartFile multi4 = sb.getUpload4();
			multi4.transferTo(destination4);
		}
		
		if(sb.getImage5() != null) {
			File destination5 = new File(uploadPath+File.separator+sb.getImage5());
			MultipartFile multi5 = sb.getUpload5();
			multi5.transferTo(destination5);
		}
		model.addAttribute("cate","spot");
		return gotoPage;
	}
}
