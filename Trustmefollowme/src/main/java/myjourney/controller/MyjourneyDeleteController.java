package myjourney.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import myjourney.model.MyJourneyDao;
 
@Controller
public class MyjourneyDeleteController {
   private final String command = "myJourneyDelete.mj";
   private final String gotoPage = "redirect:myjourneyList.mj";
   
   @Autowired
   private MyJourneyDao myJourneyDao;
   
   @RequestMapping(value = command, method = RequestMethod.GET)
   public String mjDelete(@RequestParam("turn") int turn,
                     @RequestParam("day") String day,
                     @RequestParam("date") String date,
                     @RequestParam("jdate") String jdate,
                     HttpSession session){
      String id = (String) session.getAttribute("myemail");
      
      System.out.println(turn+"/"+day+"/"+date+"/"+jdate);
      
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("turn", turn);
      map.put("id", id);
      
      int cnt = myJourneyDao.deleteMjCart(map);
      System.out.println("mjDelete cnt:"+cnt);
      
      String sTravel = (String) session.getAttribute("sTravel");
      System.out.println("session sTravel:"+sTravel);
      
      return gotoPage+"?day="+day+"&date="+date+"&jdate="+jdate+"&sTravel="+sTravel;
   }
   
}