package board.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;
import board.model.ChatBean;

@Controller
public class ReplyInsertController {


    private final String command = "/replyInsert.bd";
    private final String viewPage = "boardReplyForm";
    private final String gotoPage = "redirect:/boardDetail.bd";

    @Autowired
    private BoardDao boardDao;

    @RequestMapping(value = command, method = RequestMethod.GET)
    public String replyInsert(HttpServletRequest request,ChatBean cb,
    		@RequestParam("mEmail") String mEmail, @RequestParam("jnum") String jnum,
    		@RequestParam("minDate") String minDate){

    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String date = sdf.format(new Date());
    	cb.setReg_date(date);
    	cb.setIp(request.getRemoteAddr());
    	boardDao.replyInsert(cb);
    	
    	
    	return gotoPage+"?num="+cb.getB_num()+"&mEmail="+mEmail+"&jnum="+jnum+"&minDate="+minDate;
    }
}
