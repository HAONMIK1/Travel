package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class FindPasswordController {
   private final String command = "findPassword.mb";
   private final String viewPage = "findPasswordForm";
   @Autowired
   private MemberDao memberDao;

   @RequestMapping(value = command, method = RequestMethod.GET)
   public String findPwForm() {
      return viewPage;
   }

   @RequestMapping(value = command, method = RequestMethod.POST)
   public String findPW(MemberBean mb, HttpServletResponse response) throws IOException {
      List<MemberBean>lists = memberDao.findPassword(mb);
      response.setContentType("text/html;charset=UTF-8");
      PrintWriter out = response.getWriter();

      if (!lists.isEmpty()) {
         String password = lists.get(0).getPassword();
         out.print("<script>alert('회원님의 비밀번호는 " + password + " 입니다.');</script>");
         out.flush();
         return "login";

      } else {
         out.print("<script>alert('가입하지 않은 회원입니다.');</script>");
         out.flush();
         return "findPasswordForm";
      }
   }

}