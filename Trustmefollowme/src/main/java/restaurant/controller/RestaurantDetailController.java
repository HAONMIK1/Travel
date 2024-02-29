package restaurant.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import restaurant.model.RestaurantBean;
import restaurant.model.RestaurantDao;

@Controller
public class RestaurantDetailController {


	private final String command = "/restDetail.re";
	private final String viewPage = "restaurantDetailForm";
	
	@Autowired
	private RestaurantDao restaurantDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String restDetail(Model model, @RequestParam("rnum") int rnum) {
		
		RestaurantBean rb = restaurantDao.restOneInfo(rnum);
		
		
		model.addAttribute("rb", rb);
		
		return viewPage;
		
	}
}
