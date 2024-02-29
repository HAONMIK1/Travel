package main.controller;
 
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import board.model.BoardBean;
import board.model.BoardDao;
import cafe.model.CafeBean;
import cafe.model.CafeDao;
import hotel.model.HotelBean;
import hotel.model.HotelDao;
import myjourney.model.MyJourneyBean;
import myjourney.model.MyJourneyDao;
import restaurant.model.RestaurantBean;
import restaurant.model.RestaurantDao;
import spot.model.SpotBean;
import spot.model.SpotDao;
import utility.Paging;

@Controller
public class MainController {
	@Autowired
	CafeDao cafeDao;
	
	@Autowired
	HotelDao hotelDao;
	
	@Autowired
	RestaurantDao restaurantDao;
	
	@Autowired
	SpotDao spotDao;
	
	@Autowired
	BoardDao boardDao;
	
	@Autowired
	MyJourneyDao myJourneyDao;

	
	String sTravel2;
	
	private final String command = "/mainTravel.m";
	@RequestMapping(value = command)
	public String hotelList(HttpServletRequest request,HttpSession session,
			@RequestParam(value ="WhatColumn", required = false)String WhatColumn,
			@RequestParam(value ="keyword", required = false)String keyword,
			@RequestParam(value = "pageNumber", required = false) String pageNumber,
			@RequestParam(value = "sTravel", required = false) String sTravel,
			@RequestParam(value = "day", required = false) String day, 
			@RequestParam(value = "date", required = false) String date, 
			@RequestParam(value = "jdate", required = false) String jdate,
			Model model, RedirectAttributes rttr,HttpServletResponse response
			) {
		 response.setContentType("text/html;charset=UTF-8");
		String myemail =(String)session.getAttribute("myemail");
		String myname =(String)session.getAttribute("myname");
		if(sTravel!=null) {
			session.setAttribute("sTravel",sTravel);
		}
		else {
			sTravel = (String)session.getAttribute("sTravel");
		}
		
		if(myemail==null) {
			return "redirect:login.mb";
		}
		else {
			request.setAttribute("myname", myname);
			request.setAttribute("myemail", myemail);
		}
	
		
		if(date==null) {
			date = (String)session.getAttribute("date");
			request.setAttribute("date", date);
		}
		else {
			request.setAttribute("date", date);
			session.setAttribute("date", date);
		}
		
		if(date.isEmpty()) {
			 PrintWriter out;
	         try {
	            out = response.getWriter();
	            out.write("<script>alert('날짜를 선택해주세요');history.go(-1);</script>");
	              out.flush();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
		}
		
		if(sTravel.equals("auto")) {
			request.setAttribute("date", request.getParameter("date"));
			String[] days = date.split(" ");
			request.setAttribute("days", days);
				Map<String, String> map = new HashMap<String, String>();
				
				map.put("WhatColumn", WhatColumn);
				map.put("keyword", "%"+keyword+"%");
				
				String url = request.getContextPath()+command;
				
				//cafe		
				int cafeTotal= cafeDao.getTotalCount(map);
				
				Paging cafePage = new Paging(pageNumber, String.valueOf(cafeTotal), cafeTotal, url, WhatColumn, keyword);
				
				List<CafeBean> cafeList = cafeDao.getAllCafe(map, cafePage);
				
				//restaurant
				int restaurantTotal = restaurantDao.totalCount(map);
				
				Paging restaurantPage = new Paging(pageNumber, String.valueOf(restaurantTotal), restaurantTotal, url, WhatColumn, keyword);
				List<RestaurantBean> restaurantList = restaurantDao.restList(map, restaurantPage);
				System.out.println(restaurantList.get(0).getXpos()+restaurantList.get(0).getYpos());
				//hotel
			      int hoteltotal = hotelDao.totalCount(map);
			      
			      Paging hotelPage = new Paging(pageNumber, String.valueOf(hoteltotal), hoteltotal, url, WhatColumn, keyword);
			      
			      List<HotelBean> hotelList = hotelDao.getAllHotel(map, hotelPage);
				
				//spot
			  	int sptTotal= spotDao.totalCount(map);
				
				Paging spotPaging = new Paging(pageNumber, String.valueOf(sptTotal), sptTotal, url, WhatColumn, keyword);
				List<SpotBean> spotList = spotDao.spotList(map, spotPaging);
				
				request.setAttribute("spotList", spotList);
				request.setAttribute("hotelList", hotelList);
				request.setAttribute("restaurantList", restaurantList);
				request.setAttribute("cafeList", cafeList);
				
				return "mainTravel";
		}else {
		
			  if(sTravel == null) {
	               System.out.println("sTravel is null");
	               sTravel = (String) session.getAttribute("sTravel");
	               System.out.println("session sTravel:"+sTravel);
	            }else {
	               session.setAttribute("sTravel", sTravel);
	            }
	            
	            if(request.getParameter("date")==null) {
	               date = (String)session.getAttribute("date");
	               request.setAttribute("date", date);
	            }
	            else {
	               request.setAttribute("date", request.getParameter("date"));
	            }
	            Map<String, String> map = new HashMap<String, String>();
	            map.put("WhatColumn", WhatColumn);
	            map.put("keyword", "%"+keyword+"%");


	            String url = request.getContextPath()+command;

	            //cafe      
	            int cafeTotal= cafeDao.getTotalCount(map);

	            Paging cafePage = new Paging(pageNumber, String.valueOf(cafeTotal), cafeTotal, url, WhatColumn, keyword);

	            List<CafeBean> cafeList = cafeDao.getAllCafe(map, cafePage);

	            //restaurant
	            int restaurantTotal = restaurantDao.totalCount(map);

	            Paging restaurantPage = new Paging(pageNumber, String.valueOf(restaurantTotal), restaurantTotal, url, WhatColumn, keyword);
	            List<RestaurantBean> restaurantList = restaurantDao.restList(map, restaurantPage);

	            //hotel
	            int hoteltotal = hotelDao.totalCount(map);

	            Paging hotelPage = new Paging(pageNumber, String.valueOf(hoteltotal), hoteltotal, url, WhatColumn, keyword);

	            List<HotelBean> hotelList = hotelDao.getAllHotel(map, hotelPage);

	            //spot
	            int sptTotal= spotDao.totalCount(map);

	            Paging spotPaging = new Paging(pageNumber, String.valueOf(sptTotal), sptTotal, url, WhatColumn, keyword);
	            List<SpotBean> spotList = spotDao.spotList(map, spotPaging);

	            request.setAttribute("spotPage", spotPaging);
	            request.setAttribute("restaurantPage", restaurantPage);
	            request.setAttribute("cafePage", cafePage);
	            request.setAttribute("hotelPage", hotelPage);

	            request.setAttribute("spotList", spotList);
	            request.setAttribute("hotelList", hotelList);
	            request.setAttribute("restaurantList", restaurantList);
	            request.setAttribute("cafeList", cafeList);
	            
	            
	            System.out.println("sTravel:"+sTravel);
	            
	            if(sTravel.equals("auto")) {
	               return "mainTravel";
	            }else {
	               Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
	               if(flashMap != null) {
	                  List<MyJourneyBean> mlists = (List<MyJourneyBean>) flashMap.get("mlists");
	                  model.addAttribute("mlists", mlists);
	               }
	               
	               System.out.println("date:"+date);
	               
	               String[] days = date.split(" ");
	               model.addAttribute("days", days);
	               
	               if(jdate == null) {
	            	   day = "Day1";
	                  jdate = days[0];
	               }
	               
	               
	               model.addAttribute("day", day);
	               model.addAttribute("date", date);
	               model.addAttribute("jdate", jdate);
	               model.addAttribute("sTravel", sTravel);
	               
	               //rttr.addFlashAttribute("date", date);
	               
	               //return "redirect:myjourneyList.mj";
	               return "mainTravel2";

		      }
		   }
	}
	@RequestMapping(value = "mainScreen.m")
	public String mainScreen(HttpSession session,HttpServletRequest request) {
		String myemail =(String)session.getAttribute("myemail");
		String id =(String)session.getAttribute("myemail");
		request.setAttribute("myemail", myemail);
			String WhatColumn=null;
			String keyword=null;
			String pageNumber="1";
		
		          myJourneyDao.deleteJnumZero();
		          
		          Map<String, String> map = new HashMap<String, String>();
			
			map.put("WhatColumn", WhatColumn);
			map.put("keyword", "%"+keyword+"%");
			
			String url = request.getContextPath()+command;
			
			//cafe		
			int cafeTotal= cafeDao.getTotalCount(map);
			
			Paging cafePage = new Paging(pageNumber, String.valueOf(cafeTotal), cafeTotal, url, WhatColumn, keyword);
			
			List<CafeBean> cafeList = cafeDao.getAllCafe(map, cafePage);
			
			//restaurant
			int restaurantTotal = restaurantDao.totalCount(map);
			
			Paging restaurantPage = new Paging(pageNumber, String.valueOf(restaurantTotal), restaurantTotal, url, WhatColumn, keyword);
			List<RestaurantBean> restaurantList = restaurantDao.restList(map, restaurantPage);
			System.out.println(restaurantList.get(0).getXpos()+restaurantList.get(0).getYpos());
			//hotel
		      int hoteltotal = hotelDao.totalCount(map);
		      
		      Paging hotelPage = new Paging(pageNumber, String.valueOf(hoteltotal), hoteltotal, url, WhatColumn, keyword);
		      
		      List<HotelBean> hotelList = hotelDao.getAllHotel(map, hotelPage);
			
			//spot
		  	int sptTotal= spotDao.totalCount(map);
			
			Paging spotPaging = new Paging(pageNumber, String.valueOf(sptTotal), sptTotal, url, WhatColumn, keyword);
			List<SpotBean> spotList = spotDao.spotList(map, spotPaging);
			

			List<BoardBean> boardlists = boardDao.MboardList(map);
			
			request.setAttribute("likelists", boardlists);
			request.setAttribute("boardlists", boardlists);
			request.setAttribute("spotList", spotList);
			request.setAttribute("hotelList", hotelList);
			request.setAttribute("restaurantList", restaurantList);
			request.setAttribute("cafeList", cafeList);
			
		return "mainScreen";
	}
	@RequestMapping(value = "mainCalender.m")
	public String mainCalender(HttpSession session) {
		if(session.getAttribute("myemail")==null) {
			return "redirect:login.mb";
		}
		return "mainCalender";
	}
	

}
