package board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import board.model.BoardDao;
import board.model.ChatBean;

@Controller
public class ReplyDeleteController {

	private final String command = "replyDelete.bd";

    @Autowired
    private BoardDao boardDao;
	
    @ResponseBody
    @RequestMapping(command)
    public String replyDelete(@RequestParam("ref2") int ref2,
				    		@RequestParam("reStep2") int reStep2,
				    		@RequestParam("reLevel2") int reLevel2,
				    		@RequestParam("bNum2") int bNum2,
				    		HttpServletResponse response) {
    	Map<String, Integer> map = new HashMap<String, Integer>();
    	map.put("ref", ref2);
    	map.put("re_step", reStep2);
    	map.put("re_level", reLevel2);
    	map.put("b_num", bNum2);
    	if(reStep2 == 0 && reLevel2 == 0) {
    		int cnt = boardDao.replyAllDelete(map);
    		if(cnt != -1) {
    			return "YES";
    		}
    		return "NO";
    	}else {
    		int cnt = boardDao.replyDelete(map);
    		if(cnt != -1) {
    			return "YES";
    		}
    		return "NO";
    	}
    	}
    	
}
