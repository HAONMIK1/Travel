package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class JoinController {
	@Autowired
	private MemberDao memberDao;

	@RequestMapping(value = "/join.mb", method = RequestMethod.GET)
	public String joinForm() {
		return "join";
	}

	@RequestMapping(value = "join.mb", method = RequestMethod.POST)
	public String join(@Valid MemberBean mb,BindingResult bresult,HttpServletResponse response,
						Model model) throws IOException {
		 response.setContentType("text/html;charset=UTF-8");
		 
		if(bresult.hasErrors()) {
			 PrintWriter out;
	         try {
	            out = response.getWriter();
	            out.write("<script>alert('누락되었습니다.');</script>");
	              out.flush();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
			return "join";  
		}
		
		memberDao.insertMember(mb);
		model.addAttribute("redirectUrl", "login.mb");
	    return "redirect";
		
		
	}
	

	

}
