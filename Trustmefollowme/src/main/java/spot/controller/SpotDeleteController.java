package spot.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cafe.model.CafeBean;
import cafe.model.CafeDao;
import spot.model.SpotBean;
import spot.model.SpotDao;

@Controller
public class SpotDeleteController {
	private final String command = "spotDelete.sp";
	private final String gotoPage = "redirect:admin.mb";
	
	@Autowired
	private SpotDao  spotdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(command)
	public String spotDelete(@RequestParam("snum") int snum,@RequestParam(value="cate",required = false) String cate,
			@RequestParam(value="pageNumber",required = false) String pageNumber,Model model) {

		
		spotdao.deleteSpot(snum);
		
		model.addAttribute("cate","spot");
		return gotoPage+"?pageNumber="+pageNumber;
	}
}
