package main.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import myjourney.model.MyJourneyBean;
import myjourney.model.MyJourneyDao;

@Controller
public class MainJourneyController {
	@Autowired
	MyJourneyDao myJourneyDao;
	
	@RequestMapping("mainJourney.m")
	public String mainJourney(HttpServletRequest request,HttpSession session,
			@RequestParam(value = "jdate",required = false)String jdate,
			@RequestParam(value = "myjNum",required = false)int myjNum
			) {
		
		String id=(String)session.getAttribute("myemail");
		MyJourneyBean mb= new MyJourneyBean();
		if(myjNum!=0) {
		mb.setJnum(myjNum);
		}
		mb.setId(id);
		List<MyJourneyBean> myjDayList=myJourneyDao.myjDateSelect(mb);
		
		mb.setJdate(myjDayList.get(0).getJdate());
		
		if(jdate!=null) {
			mb.setJdate(jdate);
		}
		
		List<MyJourneyBean> myjList=myJourneyDao.myjSelect(mb);
		List<String> myjXpos = new ArrayList<String>();
		List<String> myjYpos=new ArrayList<String>() ;
		
	for(int i=0 ;i<=myjList.size()-1;i++) {
		myjXpos.add(myjList.get(i).getXpos());
		myjYpos.add(myjList.get(i).getYpos());
		System.out.println(myjList.get(i).getXpos()+"/"+
		myjList.get(i).getYpos()+" /");
	}
		for(int i=0;i<myjXpos.size();i++) {
			System.out.println("myjXpos.get"+myjXpos.get(i));
		}
		request.setAttribute("startXpos", myjXpos.get(0));
		request.setAttribute("startYpos", myjYpos.get(0));

		request.setAttribute("lastXpos", myjXpos.get(myjList.size()-1));
		request.setAttribute("lastYpos", myjYpos.get(myjList.size()-1));

		request.setAttribute("myjXpos", myjXpos);
		request.setAttribute("myjYpos", myjYpos);

		request.setAttribute("myjNum", myjNum);
		request.setAttribute("myemail", id);
		request.setAttribute("list", myjList);
		request.setAttribute("daylist", myjDayList);
		
	return "mainJourney";	
	}
}
