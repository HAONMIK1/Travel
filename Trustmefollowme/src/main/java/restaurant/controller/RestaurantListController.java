package restaurant.controller;

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

import restaurant.model.RestaurantBean;
import restaurant.model.RestaurantDao;
import utility.Paging;

@Controller
public class RestaurantListController {

	private final String command = "/mainRestaurantList.re";
	private final String viewPage = "restaurantListForm";
	
	@Autowired
	private RestaurantDao restaurantDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String restList(Model model, HttpServletRequest request, HttpServletResponse response,
						@RequestParam(value = "WhatColumn", required = false) String WhatColumn,
						@RequestParam(value = "keyword", required = false) String keyword,
						@RequestParam(value = "pageNumber", required = false) String pageNumber,
						@RequestParam(value = "cate", required = false) String cate) throws UnsupportedEncodingException {
		
		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("WhatColumn", WhatColumn);
		map.put("keyword", "%"+keyword+"%");

		int totalCount = restaurantDao.totalCount(map);
		
		String url = request.getContextPath()+command;
		
		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, WhatColumn, keyword);
		List<RestaurantBean> lists = restaurantDao.restList(map, pageInfo);
		
		model.addAttribute("cate", "restaurant");
		model.addAttribute("detail", "mainRestaurantList.re");
		model.addAttribute("lists", lists);
		model.addAttribute("pageInfo", pageInfo);
		
		String encodedKeyword = URLEncoder.encode(keyword, "UTF-8");
		return  "redirect:admin.mb?WhatColumn=" + WhatColumn + "&keyword=" + encodedKeyword;
	}
}
