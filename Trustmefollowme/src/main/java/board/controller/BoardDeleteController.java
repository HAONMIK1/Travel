package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;

@Controller
public class BoardDeleteController {

	private final String command = "/boardDelete.bd";
	private final String viewPage = "redirect:/boardList.bd";
	
	@Autowired
	private BoardDao boardDao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String boardDelete(@RequestParam("num") int num) {

		boardDao.boardDelete(num);
		
		return viewPage;
	}
}
