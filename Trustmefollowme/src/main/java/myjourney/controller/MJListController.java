package myjourney.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.MemberDao;
import myjourney.model.MyJourneyDao;

@Controller
public class MJListController {
	private final String command = "mjList.mj";
	private final String viewPage = "mjlist";

	@Autowired
	private MemberDao mDao;

	@RequestMapping(command)
	public String mjList(HttpSession session, Model model) {
		String id = (String) session.getAttribute("myemail");
		int myjNum = mDao.getMyjNum(id);
		model.addAttribute("myjNum", myjNum);
		return viewPage;
	}
}
