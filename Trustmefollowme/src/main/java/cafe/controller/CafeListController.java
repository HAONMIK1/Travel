package cafe.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cafe.model.CafeBean;
import cafe.model.CafeDao;
import utility.Paging;

@Controller
public class CafeListController {

	private final String command = "/mainCafeList.cf";
	private final String viewPage = "cafeListForm";
	
	@Autowired
	private CafeDao cafeDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String cafeList(@RequestParam(value = "WhatColumn", required = false) String WhatColumn, 
						@RequestParam(value = "keyword", required = false) String keyword, 
						@RequestParam(value = "pageNumber", required = false) String pageNumber, 
						@RequestParam(value = "cate", required = false) String cate,
						HttpServletRequest request,Model model) throws UnsupportedEncodingException {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("WhatColumn", WhatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = cafeDao.getTotalCount(map);
		
		String url = request.getContextPath()+command;
		
		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, WhatColumn, keyword);
		
		List<CafeBean> lists = cafeDao.getAllCafe(map, pageInfo);
		model.addAttribute("lists", lists);
		model.addAttribute("paging", pageInfo);
		model.addAttribute("cate", "cafe");
		
		String encodedKeyword = URLEncoder.encode(keyword, "UTF-8");
		
		return "redirect:admin.mb?WhatColumn=" + WhatColumn + "&keyword=" + encodedKeyword;
	}
	
}
