package myhotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyhotelListController {

	private final String command = "/myhotelList.mh";
	private final String viewPage = "myhotelListForm";

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String myhotelList() {
		
		return viewPage;
	}
}
