package spot.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spot.model.SpotBean;
import spot.model.SpotDao;
import utility.Paging;

@Controller
public class SpotListController {

	private final String command = "/spotList.sp";
	private final String viewPage = "redirect:/admin.mb";
	
	@Autowired
	private SpotDao  spotdao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String spotList(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "WhatColumn", required = false) String WhatColumn,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "pageNumber", required = false) String pageNumber,
			@RequestParam(value = "cate", required = false) String cate) throws UnsupportedEncodingException {
		
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("WhatColumn", WhatColumn);
			map.put("keyword", "%"+keyword+"%");

			int totalCount = spotdao.totalCount(map);
			String pageSize = "6";
			String url = request.getContextPath()+command;
			
			Paging paging = new Paging(pageNumber, pageSize, totalCount, url, WhatColumn, keyword);
			List<SpotBean> lists = spotdao.spotList(map, paging);
			
			model.addAttribute("list", lists);
			model.addAttribute("paging", paging);
			model.addAttribute("cate", "spot");
		
			String encodedKeyword = URLEncoder.encode(keyword, "UTF-8");
			
			return "redirect:admin.mb?WhatColumn=" + WhatColumn + "&keyword=" + encodedKeyword;
	}
	

	@RequestMapping(value = "mainSpotList.sp", method = RequestMethod.GET)
	public String mainspotList(HttpServletRequest request, 
			@RequestParam(value = "WhatColumn", required = false) String WhatColumn,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "pageNumber", required = false) String pageNumber) {
		
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("keyword", "%"+keyword+"%");
			map.put("WhatColumn", WhatColumn);

			int totalCount = spotdao.totalCount(map);
			String pageSize = "6";
			String url = request.getContextPath()+command;
			
			Paging paging = new Paging(pageNumber, pageSize, totalCount, url, WhatColumn, keyword);
			List<SpotBean> lists = spotdao.spotList(map, paging);
			
			request.setAttribute("cate", "spot");
			request.setAttribute("detail", "spotDetail.sp");
			request.setAttribute("list", lists);
			request.setAttribute("paging", paging);
			
		
		return "redirect:mainTravel.m";
	}

}
