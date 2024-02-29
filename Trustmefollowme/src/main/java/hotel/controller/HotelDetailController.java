package hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hotel.model.HotelBean;
import hotel.model.HotelDao;

@Controller
public class HotelDetailController {

	private final String command = "hotelDetail.ht";
	private final String viewPage = "hotelDetailForm";

	@Autowired
	@Qualifier("hotelDao")
	private HotelDao hotelDao;

	@RequestMapping(value = command)
	public String detail(Model model, @RequestParam("hnum") int hnum,
			@RequestParam(value = "pageNumber", required = false) String pageNumber) {

		HotelBean hotel = hotelDao.getHotel(hnum);
		model.addAttribute("hotel", hotel);
		model.addAttribute("pageNumber", pageNumber);

		return viewPage;
	}
}
