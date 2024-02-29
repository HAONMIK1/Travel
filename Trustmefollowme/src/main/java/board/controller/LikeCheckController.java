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
public class LikeCheckController {

	private final String command = "likeCheck.bd";
	private final String viewPage = "boardDetailForm";

	@Autowired
	private BoardDao boardDao;

	@ResponseBody
	@RequestMapping(command)
	public String likeCheck(@RequestParam("m_num") String m_num,
						@RequestParam("b_num") String b_num,
						@RequestParam("mEmail") String mEmail) {
		System.out.println(mEmail);
		System.out.println(b_num);
		System.out.println(m_num);
	    
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_num", m_num);
		map.put("b_num", b_num);

		
		LikeBean likeInfo = boardDao.findLike(map);
		if(likeInfo.getLikes() == 0) {
			int cnt = boardDao.likeUp(likeInfo);
			if(cnt != -1) {
			boardDao.boardLikeUp(b_num, mEmail);
			}
			return "YES";
		}else {
			int cnt = boardDao.likeDown(likeInfo);
			if(cnt != -1) {
			boardDao.boardLikeDown(b_num, mEmail);
			}
			return "NO";
		}
	}
}
