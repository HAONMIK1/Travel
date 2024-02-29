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
public class MJDeleteController {
   private final String command = "mjdel.mj";
   private final String gotoPage = "myPage.mb";
   
   @Autowired
   private MemberDao memberDao;
   
   @Autowired
   private MyJourneyDao myJourneyDao;
   
   @RequestMapping(command)
   public void deleteMJ(@RequestParam("jnum") int jnum,
                  HttpServletResponse response,
                  HttpSession session) throws IOException {
      response.setContentType("text/html; charset=UTF-8");
      String id = (String) session.getAttribute("myemail");
      
      System.out.println(id+"/"+jnum);
      
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("id", id);
      map.put("jnum", jnum);
      
      int cnt = myJourneyDao.deleteMyjourney(map);
      PrintWriter out = response.getWriter();
      if(cnt > 0) {
         memberDao.reduceMyjNum(id);
         out.println("<script>alert('여정을 삭제하였습니다.');location.href='"+gotoPage+"'</script>");
      }else {
         out.println("<script>alert('여정을 삭제하지 못했습니다.');location.href='"+gotoPage+"'</script>");
      }
      out.flush();
   }
}