package myjourney.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberDao;
import myjourney.model.MyJourneyDao;

@Controller
public class MyJourneySaveController {
   private final String command = "saveMyjourney.mj";
   private final String gotoPage = "mainScreen.m";
   
   @Autowired
   private MyJourneyDao myJourneyDao;
   
   @Autowired
   MemberDao mDao;
   
   @RequestMapping(command)
   public void saveMJ(HttpSession session, HttpServletResponse response,
                  @RequestParam("date")String date) {
      response.setContentType("text/html;charset=UTF-8");
      System.out.println("date:"+date);
      String id = (String) session.getAttribute("myemail");
      System.out.println("saveMJ id:"+id);
      
      Map<String, String> map0 = new HashMap<String, String>();
      map0.put("id", id);
      
      int count = 0;
      String[] days = date.split(" ");
      for(int i=0;i<days.length;i++) {
         System.out.println(days[i]);
         map0.put("jdate", days[i]);
         count = myJourneyDao.searchByJateAndJnumZero(map0);
         if(count < 3) {
            break;
         }
      }
      
      if(count < 3) {
         PrintWriter out;
         try {
            out = response.getWriter();
            out.write("<script>alert('한 일차 당 장소를 3개 이상 선택하셔야 생성됩니다.');history.go(-1);</script>");
              out.flush();
         } catch (IOException e) {
            e.printStackTrace();
         }
      }else {
         myJourneyDao.updateMJList(id);
         int jnum = mDao.getMyjNum(id);
         System.out.println("getMyjNum jnum:"+jnum);
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("id", id);
         map.put("jnum", jnum+1);
         int cnt = myJourneyDao.saveMyJourney(map);
         PrintWriter out;
         if (cnt > 0) {    
            try {
               mDao.updateMyjNum(id);
               out = response.getWriter();
               out.write("<script>alert('여정을 생성하였습니다.');location.href='"+gotoPage+"'</script>");
               out.flush();
            } catch (IOException e) {
               e.printStackTrace();
            }
         }else {
            try {
               out = response.getWriter();
               out.write("<script>alert('여정을 생성하지 못했습니다.');history.go(-1);</script>");
               out.flush();
            } catch (IOException e) {
               e.printStackTrace();
            }
         }//cnt else
      }//count else
   }//saveMJ

}