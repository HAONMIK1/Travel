package cafe.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cafe.model.CafeBean;
import cafe.model.CafeDao;

@Controller
public class CafeDeleteController {
	private final String command = "cafeDelete.cf";
	private final String gotoPage = "redirect:/admin.mb";
	
	@Autowired
	private CafeDao cafeDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(command)
	public String cafeDelete(@RequestParam("cnum") String cnum, 
							@RequestParam("pageNumber") String pageNumber,
							@RequestParam(value="cate",required = false) String cate,Model model) {
		CafeBean cb = cafeDao.getCafeDetailByCnum(cnum);
		
		cafeDao.deleteCafe(cnum);
		model.addAttribute("cate","cafe");
		return gotoPage+"?pageNumber="+pageNumber;
	}
}
