package board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;
import board.model.ChatBean;

@Controller
public class ChatInsertController {

	private final String command = "/chatInsert.bd";
	private final String viewPage = "redirect:/boardDetail.bd";
	
	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String Reply(HttpServletRequest request,Model model, ChatBean cb,
			@RequestParam("mEmail") String mEmail, @RequestParam("jnum") String jnum,
			@RequestParam("minDate") String minDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new Date());
		cb.setReg_date(date);
		cb.setIp(request.getRemoteAddr());
		
		model.addAttribute("jnum", jnum);
		model.addAttribute("mEmail", mEmail);
		model.addAttribute("minDate", minDate);
		boardDao.chatInsert(cb);
		
		return viewPage+"?num="+cb.getB_num();
	}
}
