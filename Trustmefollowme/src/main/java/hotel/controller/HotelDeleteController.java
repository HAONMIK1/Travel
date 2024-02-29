package hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hotel.model.HotelDao;

@Controller
public class HotelDeleteController {
	private final String command = "hotelDelete.ht";
	private final String gotoPage = "redirect:/admin.mb";
	@Autowired
	@Qualifier("hotelDao")
	private HotelDao hotelDao;

	@RequestMapping(value = command)
	public String delete(@RequestParam("hnum") int hnum, @RequestParam(value="cate",required = false) String cate, Model model,
			@RequestParam(value="pageNumber",required = false) String pageNumber) {

		hotelDao.deleteHotel(hnum);
		model.addAttribute("cate", "hotel");
		return gotoPage+"?pageNumber="+pageNumber;
	}

}
