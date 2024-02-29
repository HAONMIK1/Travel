package spot.controller;

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

import spot.model.SpotBean;
import spot.model.SpotDao;



@Controller
public class SpotUpdateController {
	private final String command = "spotUpdate.sp";
	private final String viewPage = "spotUpdateForm";
	private final String gotoPage = "redirect:admin.mb";

	
	@Autowired
	SpotDao spotDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String spotUpdate(@RequestParam("snum") int snum, 
							@RequestParam(value="pageNumber",required = false) String pageNumber, 
							HttpServletRequest request) {
		SpotBean sb = spotDao.spotDetail(snum);
		request.setAttribute("spotBean", sb);
		request.setAttribute("pageNumber", pageNumber);
		return viewPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String spotUpdate(@Valid SpotBean sb, BindingResult cResult,  
							@RequestParam(value="pageNumber",required = false) String pageNumber, 
							HttpServletRequest request,@RequestParam(value="cate",required = false) String cate,Model model) throws IllegalStateException, IOException {
		if(cResult.hasErrors()) {
			request.setAttribute("pageNumber", pageNumber);
			return viewPage;
		}
	System.out.println(sb.getSnum());
	System.out.println(sb.getAddress());
	System.out.println(sb.getContent());
	System.out.println(sb.getStime());
	System.out.println(sb.getXpos());
		spotDao.updateSpot(sb);
		model.addAttribute("cate","spot");
		return gotoPage+"?pageNumber="+pageNumber;
	}
}
