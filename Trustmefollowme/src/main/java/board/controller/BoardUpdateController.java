package board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.Box.Filler;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import board.model.BoardBean;
import board.model.BoardDao;
import myjourney.model.MyJourneyBean;
import myjourney.model.MyJourneyDao;

@Controller
public class BoardUpdateController {

	private final String command = "/boardUpdate.bd";
	private final String viewPage = "boardUpdateForm";
	private final String gotoPage = "redirect:/boardList.bd";
	
	@Autowired
	private BoardDao boardDao;

	@Autowired
	MyJourneyDao myJourneyDao;
	
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String boardUpdateForm(Model model, HttpSession session, @RequestParam("num") int num,
								@RequestParam("jnum") String jnum,
								MyJourneyBean mb) {
		
		BoardBean bb = boardDao.oneData(num);
		
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
		
		model.addAttribute("jnum", jnum);
		model.addAttribute("list", list);
		model.addAttribute("myemail", id);
		model.addAttribute("minDate", minDate);
		model.addAttribute("maxDate", maxDate);
		model.addAttribute("date", date);
		
		model.addAttribute("bb", bb);
		return viewPage;
	}
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String boardUpdate(Model model, HttpServletRequest request,
			@ModelAttribute("bb") @Valid BoardBean bb, BindingResult result) {
		
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

			return viewPage;
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date2 = sdf.format(new Date());
		
		bb.setReg_date(date2);
		bb.setIp(request.getRemoteAddr());
		
		
		boardDao.boardUpdate(bb);
		
		String upload = servletContext.getRealPath("/resources/images/");
		
		File file = new File(upload+File.separator+bb.getImage());
		File delfile = new File(upload+File.separator+bb.getImgdel());
		
		MultipartFile multi = bb.getImgUpload();

		try {
			multi.transferTo(file);

			delfile.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return gotoPage;
	}
}
