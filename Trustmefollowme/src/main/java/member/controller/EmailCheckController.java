package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberDao;

@Controller
public class EmailCheckController {
	private final String command = "email_check_proc.mb";

	@Autowired
	private MemberDao memberDao;

	@RequestMapping(value = command)
	@ResponseBody
	public String emailCheck(@RequestParam(value = "inputemail") String inputemail) {
		System.out.println("inputemail:" + inputemail);
		int cnt = memberDao.findEmail(inputemail);
		if (cnt == 0) {// 사용가능
			return "YES"; 
		} else {// 사용불가능
			return "NO"; 
		}

	}

}
