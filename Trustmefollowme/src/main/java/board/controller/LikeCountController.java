package board.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import board.model.BoardDao;
import board.model.LikeBean;

@Controller
public class LikeCountController {

	private final String command = "likeCount.bd";

	@Autowired
	private BoardDao boardDao;

	@ResponseBody
	@RequestMapping(command)
	public Map<String, Integer> likeCheck(@RequestParam("b_num") String b_num) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		int count = boardDao.likeCount(b_num);
		map.put("count", count);

		return map;
	}
}
