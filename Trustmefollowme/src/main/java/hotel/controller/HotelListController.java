package hotel.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import hotel.model.HotelBean;
import hotel.model.HotelDao;
import utility.Paging;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
public class HotelListController {

	private final String command = "/hotelList.ht";
	private final String viewPage = "redirect:admin.mb";
@Autowired
@Qualifier("hotelDao")
private HotelDao hotelDao;


	@RequestMapping(value = command)
	public String hotelList(Model model, HttpServletRequest request,
			@RequestParam(value = "WhatColumn", required = false) String WhatColumn,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "pageNumber", required = false) String pageNumber,
			@RequestParam(value = "cate", required = false) String cate) throws UnsupportedEncodingException {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("WhatColumn", WhatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		System.out.println("WhatColumn: " + WhatColumn);
		System.out.println("keyword: " + keyword);
		
		int totalCount = hotelDao.totalCount(map);
		String url = request.getContextPath()+command;
		String pageSize = "10";
		
		Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, WhatColumn, keyword);
		System.out.println("map: " + map);
		System.out.println("pageInfo: " + pageInfo);
		
		List<HotelBean> list = hotelDao.getAllHotel(map, pageInfo);
		System.out.println("list.size()"+list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("paging", pageInfo);
		model.addAttribute("cate", "hotel");
		
		String encodedKeyword = URLEncoder.encode(keyword, "UTF-8");
		
		return "redirect:admin.mb?WhatColumn=" + WhatColumn + "&keyword=" + encodedKeyword;
	}
}
