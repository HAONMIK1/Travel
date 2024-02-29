package board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class LikesListController {

	private final String command = "/likesList.bd";
	private final String viewPage = "boardListForm";
	
	@Autowired
	private BoardDao boardDao;
	
	@RequestMapping(command)
	public String likesList(Model model) {
		
		List<BoardBean> lists = boardDao.likesList();
		model.addAttribute("lists", lists);
		
		return viewPage;
	}

}
