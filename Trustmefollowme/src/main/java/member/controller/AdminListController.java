package member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;
import cafe.model.CafeBean;
import cafe.model.CafeDao;
import hotel.model.HotelBean;
import hotel.model.HotelDao;
import member.model.MemberBean;
import member.model.MemberDao;
import restaurant.model.RestaurantBean;
import restaurant.model.RestaurantDao;
import spot.model.SpotBean;
import spot.model.SpotDao;
import utility.Paging;

@Controller
public class AdminListController {
	@Autowired
	HotelDao hotelDao;

	@Autowired
	SpotDao spotdao;

	@Autowired
	CafeDao cafeDao;

	@Autowired
	RestaurantDao restaurantDao;

	@Autowired
	MemberDao memberDao;

//	@Autowired
//	BoardDao boardDao;

	String command = "/admin.mb";

	@RequestMapping(value = "admin.mb")
	public String adminMainForm(HttpServletRequest request, Model model,
			@RequestParam(value = "cate", required = false) String cate,
			@RequestParam(value = "WhatColumn", required = false) String WhatColumn,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "pageNumber", required = false) String pageNumber) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("WhatColumn", WhatColumn);
		map.put("keyword", "%" + keyword + "%");

		String pageSize = "5";

		String url = request.getContextPath() + command+"?cate="+cate;
		if (cate == null) {
			return "adminMainForm";
		}
		// cafe
		if (cate.equals("cafe")) {

			int cafeTotal = cafeDao.getTotalCount(map);

			Paging cafePage = new Paging(pageNumber, pageSize, cafeTotal, url, WhatColumn, keyword);

			List<CafeBean> cafeList = cafeDao.getAllCafe(map, cafePage);

			model.addAttribute("lists", cafeList);
			model.addAttribute("cate", "cafe");
			model.addAttribute("paging", cafePage);
			

			return "adminListForm";
		}

		// restaurant
		if (cate.equals("restaurant")) {

			int restaurantTotal = restaurantDao.totalCount(map);

			Paging restaurantPage = new Paging(pageNumber, null, restaurantTotal, url, WhatColumn, keyword);

			List<RestaurantBean> restaurantList = restaurantDao.restList(map, restaurantPage);

			model.addAttribute("lists", restaurantList);
			model.addAttribute("cate", "restaurant");
			model.addAttribute("paging", restaurantPage);
			return "adminListForm";

		}
		// hotel
		if (cate.equals("hotel")) {

			int hoteltotal = hotelDao.totalCount(map);

			Paging hotelPage = new Paging(pageNumber, pageSize, hoteltotal, url, WhatColumn, keyword);

			List<HotelBean> list = hotelDao.getAllHotel(map, hotelPage);
			model.addAttribute("lists", list);
			model.addAttribute("cate", "hotel");
			model.addAttribute("paging", hotelPage);
			/* model.addAttribute("pageNumber", pageNumber); */

			return "adminListForm";

		}
		// spot
		if (cate.equals("spot")) {

			int spotTotal = spotdao.totalCount(map);

			Paging spotPaging = new Paging(pageNumber, pageSize, spotTotal, url, WhatColumn, keyword);

			List<SpotBean> spotList = spotdao.spotList(map, spotPaging);

			model.addAttribute("lists", spotList);
			model.addAttribute("cate", "spot");
			model.addAttribute("paging", spotPaging);

			return "adminListForm";
		}
		if (cate.equals("member")) {
			
			int totalCount = memberDao.totalCount(map);
			Paging memberPaging = new Paging(pageNumber, null, totalCount, url, WhatColumn, keyword);
			List<MemberBean> memberlist = memberDao.getAllMember(map,memberPaging);
			
			model.addAttribute("lists", memberlist);
			model.addAttribute("cate", "member");
			model.addAttribute("paging", memberPaging);
			
			return "adminListForm";

		}
//		if(cate.equals("board")) {
//			List<BoardBean> boardList = boardDao.boardList(map);
//			model.addAttribute("lists",boardList);
//			model.addAttribute("cate","board");
//			
//			return "adminListForm";
//			
//		}
		else {
			return "adminMainForm";
		}

	}

}
