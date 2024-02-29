package board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import board.model.BoardBean;
import board.model.BoardDao;
import member.model.MemberBean;
import member.model.MemberDao;
import myjourney.model.MyJourneyBean;
import myjourney.model.MyJourneyDao;

@Controller
public class BoardInsertController {

	private final String command = "/boardInsert.bd";
	private final String viewPage = "boardInsertForm";
	private final String viewPage2 = "boardInsertForm2";
	private final String gotoPage = "redirect:/boardList.bd";
	
	@Autowired
	private BoardDao boardDao;

	@Autowired
	private MemberDao memberDao;

	@Autowired
	MyJourneyDao myJourneyDao;
	
	@Autowired
	private ServletContext servletContext;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String boardInsertForm(HttpServletResponse response, Model model,
								HttpSession session) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out;
		out = response.getWriter();
		String myemail=(String)session.getAttribute("myemail");
		
		String customer = "";
		if(myemail == null) {
			out.write("<script>alert('로그인이 필요합니다.');"
					+ "location.href='boardList.bd'</script>");
			out.flush();
		}
		
		List<MyJourneyBean> getJnum2 = myJourneyDao.getjNum(myemail);
		String getJnum = "";
		for(int i=0;i<getJnum2.size();i++) {
			getJnum += getJnum2.get(i).getJnum()+",";
		}
		
		try {
			out = response.getWriter();
			if(getJnum == "") {
				out.write("<script>alert('공유가능한 여정이 없습니다.');"
						+ "location.href='boardList.bd'</script>");
				out.flush();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		
		model.addAttribute("getJnum", getJnum);
		System.out.println(getJnum);
		return viewPage;
	}
	
	@RequestMapping("boardInsert2.bd")
	public String boardInsertForm2(HttpSession session, HttpServletRequest request,
			@RequestParam("jnum") String jnum, MyJourneyBean mb) {
		

		String id=(String)session.getAttribute("myemail");

		String minDate = myJourneyDao.minDate(jnum,id);
		
		String maxDate = myJourneyDao.maxDate(jnum,id);
		
		mb.setId(id);
		
		List<MyJourneyBean> list = myJourneyDao.boardList(id, jnum);

		List<MyJourneyBean> dateCount = myJourneyDao.boardListCount(id, jnum);
		String date = "";
		for(int i=0; i<dateCount.size();i++) {
			date += dateCount.get(i).getJdate()+",";
		}
		System.out.println("date : "+date);
		request.setAttribute("jnum", jnum);
		request.setAttribute("list", list);
		request.setAttribute("myemail", id);
		request.setAttribute("minDate", minDate);
		request.setAttribute("maxDate", maxDate);
		request.setAttribute("date", date);
		return viewPage2;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String boardInsert(Model model, HttpServletRequest request,
							@Valid BoardBean bb, BindingResult result) {


		List<MyJourneyBean> list = myJourneyDao.boardList(bb.getmEmail(), bb.getJnum());

		List<MyJourneyBean> dateCount = myJourneyDao.boardListCount(bb.getmEmail(), bb.getJnum());
		String date = "";
		for(int i=0; i<dateCount.size();i++) {
			date += dateCount.get(i).getJdate()+",";
		}
		
		if(result.hasErrors()) {	
			model.addAttribute("jnum", bb.getJnum());
			model.addAttribute("list", list);
			model.addAttribute("myemail", bb.getmEmail());
			model.addAttribute("minDate", bb.getMinDate());
			model.addAttribute("maxDate", bb.getMaxDate());
			model.addAttribute("date", date);

			return viewPage2;
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date2 = sdf.format(new Date());
		
		bb.setReg_date(date2);
		bb.setIp(request.getRemoteAddr());
		
		int cnt = boardDao.boardInsert(bb);
		if(cnt < 0) {
			model.addAttribute("jnum", bb.getJnum());
			model.addAttribute("list", list);
			model.addAttribute("myemail", bb.getmEmail());
			model.addAttribute("minDate", bb.getMinDate());
			model.addAttribute("maxDate", bb.getMaxDate());
			model.addAttribute("date", date);
			
			return viewPage2;
		}else {

		String upload = servletContext.getRealPath("/resources/images/");
		
			
		File file = new File(upload+File.separator+bb.getImage());
		
		MultipartFile multi = bb.getImgUpload();
		
		try {
			multi.transferTo(file);
			
		} catch (Exception e) {
			e.printStackTrace();
			}
		}
		return gotoPage;
	}
}
