package myjourney.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import myjourney.model.MyJourneyBean;
import myjourney.model.MyJourneyDao;

@Controller
public class MyjourneyListController {

	private final String command = "/myjourneyList.mj";
	private final String gotoPage = "redirect:/mainTravel.m";
	//private final String gotoPage = "myjourneyListForm";
	
	@Autowired
	private MyJourneyDao myJourneyDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String myjourneyList(@RequestParam(value = "day", required = false) String day,
								@RequestParam(value = "date", required = false) String date,
								@RequestParam(value = "jdate", required = false) String jdate,
								@RequestParam(value = "sTravel", required = false) String sTravel,
								HttpSession session, Model model, RedirectAttributes rttr,
								HttpServletRequest request) {
		System.out.println("myjourneyList day:"+day);
		System.out.println("myjourneyList date:"+date);
		System.out.println("myjourneyList jdate:"+jdate);
		
		if(date == null) {
			Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
			if (flashMap != null) {
				date = (String) flashMap.get("date");
			}
		}
	 	
		System.out.println("flashMap date:"+date);
		if(day == null || jdate == null) {
			String[] days = date.split("  ");
			System.out.println("days.length:"+days.length);
			day = "1";
			jdate = days[0];
		}
		
		List<MyJourneyBean> lists = myJourneyDao.MgetAllMyJourneyByJdate(jdate);
		System.out.println("MJL lists.size():"+lists.size());
		
		//model.addAttribute("mlists", lists);
		rttr.addFlashAttribute("mlists", lists);
		
//		model.addAttribute("day", day);
//		model.addAttribute("date", date);
//		model.addAttribute("jdate", jdate);
		
//		rttr.addFlashAttribute("day", day);
//		rttr.addFlashAttribute("date", date);
//		rttr.addFlashAttribute("jdate", jdate);
		
		sTravel = (String) session.getAttribute("sTravel");
		System.out.println("session sTravel:"+sTravel);
		
		return gotoPage+"?day="+day+"&date="+date+"&jdate="+jdate+"&sTravel="+sTravel;
	}
}
