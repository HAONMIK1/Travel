package cafe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import cafe.model.CafeBean;
import cafe.model.CafeDao;

@Controller
public class CafeDetailController {
	private final String command = "/cafeDetail.cf";
	private final String viewPage = "CafeDetail";
	
	@Autowired
	private CafeDao cafeDao;
	
	@RequestMapping(command)
	public String cafeDetail(@RequestParam("cnum") String cnum, 
							@RequestParam(value="pageNumber",required = false) String pageNumber, 
							Model model) {
		CafeBean cb = cafeDao.getCafeDetailByCnum(cnum);
		model.addAttribute("cb", cb);
		return viewPage;
	}
	
}
