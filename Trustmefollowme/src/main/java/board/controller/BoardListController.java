package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
public class BoardListController {

	private final String command = "/boardList.bd";
	private final String viewPage = "boardListForm";
	
	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String boardList(Model model,HttpSession session,
							@RequestParam(value = "WhatColumn", required = false) String WhatColumn,
							@RequestParam(value = "keyword", required = false) String keyword,
								BoardBean bb, ChatBean cb) {
		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", "%"+keyword+"%");
		map.put("WhatColumn", WhatColumn);
		
		List<BoardBean> lists = boardDao.boardList(map);
		model.addAttribute("lists", lists);
		
		return viewPage;
	}
}
