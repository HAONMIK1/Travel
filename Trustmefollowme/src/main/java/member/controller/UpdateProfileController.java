package member.controller; 

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class UpdateProfileController {
	private final String command = "updatePf.mb";
	private final String gotoPage = "myPage.mb";

	@Autowired
	private MemberDao mDao;

	@RequestMapping(value = command, method = RequestMethod.POST)
	public void updatePf(@Valid MemberBean mb, BindingResult result,
						HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(result.hasErrors()) {
			out.println("<script>location.href='"+gotoPage+"';</script>");
			out.flush();
		}
		int cnt = mDao.updateProfile(mb);
		if (cnt > 0) {
			out.println("<script>alert('프로필을 수정했습니다.');location.href='"+gotoPage+"';</script>");
			out.flush();
		}else {
			out.println("<script>alert('프로필을 수정하지 못했습니다.');location.href='"+gotoPage+"';</script>");
			out.flush();
		}
	}
}
