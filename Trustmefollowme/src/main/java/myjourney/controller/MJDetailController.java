package myjourney.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import myjourney.model.MyJourneyBean;
import myjourney.model.MyJourneyDao;

@Controller
public class MJDetailController{
	private final String command = "mjDetail.mj";
	private final String viewPage = "mainJourney";

	@Autowired
	private MyJourneyDao myJourneyDao;

	@RequestMapping(command)
	public String mjDetail(@RequestParam(value = "jnum", required = false) int jnum,
						@RequestParam(value = "jdate", required = false) String jdate,
						@RequestParam(value = "daynum", required = false) String daynum,
						HttpSession session, Model model) {
		String id = (String) session.getAttribute("myemail");

		System.out.println("id:"+id);
		System.out.println("jNum:"+jnum);
		System.out.println("jdate:"+jdate);
		System.out.println("daynum:"+daynum);

		List<MyJourneyBean> daylist = myJourneyDao.getDayListByJnum(jnum);

		if(jdate == null) {
			System.out.println("jdate null");
			jdate = daylist.get(0).getJdate();
			System.out.println("after jdate:"+jdate);
		}

		if(daynum == null) {
			daynum = "1";
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("jnum", jnum);
		map.put("jdate", jdate);

		List<MyJourneyBean> myjlist = myJourneyDao.getMJDetailByIdAndMyjnum(map);
		List<String> myjXpos = new ArrayList<String>();
		List<String> myjYpos = new ArrayList<String>();

		for (int i=0;i<myjlist.size();i++) {
			myjXpos.add(myjlist.get(i).getXpos());
			myjYpos.add(myjlist.get(i).getYpos());
		}


		model.addAttribute("id", id);
		model.addAttribute("jnum", jnum);
		model.addAttribute("jdate", jdate);
		model.addAttribute("daynum", daynum);

		model.addAttribute("myjXpos", myjXpos);
		model.addAttribute("myjYpos", myjYpos);

		model.addAttribute("daylist", daylist);
		model.addAttribute("myjlist", myjlist);
		return viewPage;
	}

}