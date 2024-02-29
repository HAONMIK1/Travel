package board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;
import board.model.ChatBean;
import board.model.LikeBean;
import myjourney.model.MyJourneyBean;
import myjourney.model.MyJourneyDao;

@Controller
public class BoardDetailController {

    private final String command = "/boardDetail.bd";
    private final String viewPage = "boardDetailForm";

    @Autowired
    private BoardDao boardDao;
    
    @Autowired
    MyJourneyDao myJourneyDao;

    @RequestMapping(value = command, method = RequestMethod.GET)
    public String boardDetailForm(HttpServletRequest request, HttpSession session, Model model, @RequestParam("num") String num
    		,@RequestParam("mEmail") String mEmail, @RequestParam("jnum") String jnum,
    		@RequestParam("minDate") String minDate, LikeBean lb) {
    	
        BoardBean bb = boardDao.boardDetail(num);
        model.addAttribute("bb", bb);
        
        String id = (String)session.getAttribute("myemail");
        Map<String, String> map = new HashMap<String, String>();

        String customer = "";
        if(id == null) {
        	customer += "customer";
        	map.put("b_num", num);
        	map.put("m_num", customer);
        }else {
        	map.put("b_num", num);
        	map.put("m_num", id);
        }
        
        int likecount = boardDao.likeCount(num); // 좋아요 갯수
        
        LikeBean likeInfo = boardDao.findLike(map); // 좋아요 기능 시작
        if (likeInfo == null) {
            int cnt = boardDao.likeInsert(map);
            if (cnt != -1) {
                LikeBean getInfo = boardDao.findLike(map);
                model.addAttribute("likeInfo", getInfo);
            }
        } else {
            model.addAttribute("likeInfo", likeInfo); 
        }											// 좋아요 기능 끝
        
        model.addAttribute("likecount", likecount); // 좋아요 갯수 속성
        // 리스트 가져오기 시작
        
        List<MyJourneyBean> boardListCount = myJourneyDao.boardListCount(mEmail,jnum);
        int dateCount = myJourneyDao.dateCount(mEmail,jnum);
        String date = "";
        for(int i=0;i<boardListCount.size();i++) {
        	date += boardListCount.get(i).getJdate()+",";
        }	
        
        String minDate2 = myJourneyDao.minDate(jnum, mEmail);
        String maxDate = myJourneyDao.maxDate(jnum, mEmail);
        
        MyJourneyBean mb = new MyJourneyBean();
        mb.setId(mEmail);
        mb.setJnum(Integer.parseInt(jnum));
        mb.setJdate(minDate);
        
        List<MyJourneyBean> myjList = myJourneyDao.myjSelect(mb);
        List<ChatBean> lists = boardDao.chatList(num);
        if(myjList.isEmpty()) {
        	model.addAttribute("num", num);
        	
        	return "redirect:/boardDelete.bd";
      }

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
		
		request.setAttribute("lists", lists);
		request.setAttribute("list", myjList);
		request.setAttribute("date", date);
		request.setAttribute("dateCount", dateCount);
		request.setAttribute("likeInfo", likeInfo);
		request.setAttribute("minDate", minDate2);
		request.setAttribute("maxDate", maxDate);
        
        return viewPage;
        
    }
}