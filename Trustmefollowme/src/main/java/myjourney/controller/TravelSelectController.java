package myjourney.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TravelSelectController {
	@RequestMapping("travelSelect.mj")
	public String travelSelct() {
		return "travelSelect";
	}
}
