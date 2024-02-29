
package member.controller; 

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.MemberBean;
import member.model.MemberDao;
import myjourney.model.MyJourneyBean;
import myjourney.model.MyJourneyDao;

@Controller
public class MyPageController {
   private final String command = "myPage.mb";
   private final String viewPage = "myPage";

   @Autowired
   private MemberDao mDao;
   
   @Autowired
   private MyJourneyDao myJourneyDao;

   @RequestMapping(command)
   public String myPage(Model model, HttpSession session) {
      String myemail = (String) session.getAttribute("myemail");
      MemberBean mb = mDao.getMemberInfoByMyEmail(myemail);
      List<MyJourneyBean> lists = myJourneyDao.getMJNums(myemail);
      //int jnum = mDao.getMyjNum(myemail);
      model.addAttribute("memberBean", mb);
      model.addAttribute("lists", lists);
      //model.addAttribute("jnum", jnum);
      return viewPage;
   }
}