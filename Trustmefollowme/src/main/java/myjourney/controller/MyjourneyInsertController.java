package myjourney.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cafe.model.CafeBean;
import cafe.model.CafeDao;
import hotel.model.HotelBean;
import hotel.model.HotelDao;
import myjourney.model.MyJourneyDao;
import restaurant.model.RestaurantBean;
import restaurant.model.RestaurantDao;
import spot.model.SpotBean;
import spot.model.SpotDao;
 
@Controller
public class MyjourneyInsertController {
	private final String command = "myjourneyInsert.mj";
	private final String gotoPage = "redirect:myjourneyList.mj";
	
	@Autowired
	private MyJourneyDao myJourneyDao;
	
	@Autowired
	private CafeDao cafeDao;
	
	@Autowired
	private HotelDao hotelDao;
	
	@Autowired
	private RestaurantDao restaurantDao;
	
	@Autowired
	private SpotDao spotDao;
	
	@RequestMapping(value = command)
	public String myInsert(@RequestParam("cate") String cate, 
							@RequestParam("num") int num,
							@RequestParam("date") String date,
							@RequestParam("jdate") String jdate,
							HttpSession session) {
		String id = (String) session.getAttribute("myemail");
		System.out.println("myInsert join");
		System.out.println("cate:"+cate);
		System.out.println("num:"+num);
		System.out.println("date:"+date);
		System.out.println("id:"+id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cate", cate);
		map.put("jdate", jdate);
		map.put("id", id);
		
		if(cate.equals("cafe")) {
			CafeBean cb = cafeDao.getCafeDetailByCnum(String.valueOf(num));
			map.put("cb", cb);
		}
		
		if(cate.equals("hotel")) {
			HotelBean hb = hotelDao.getHotel(num);
			map.put("hb", hb);
		}
		
		if(cate.equals("restaurant")) {
			RestaurantBean rb = restaurantDao.restOneInfo(num);
			map.put("rb", rb);
		}
		
		if(cate.equals("spot")) {
			SpotBean sb = spotDao.spotDetail(num);
			map.put("sb", sb);
		}
		
		int cnt = myJourneyDao.MinsertMyJourney(map);
		System.out.println("insert cnt:"+cnt);
		
		String sTravel = (String) session.getAttribute("sTravel");
		System.out.println("session sTravel:"+sTravel);
		
		int day = 0;
		String[] days = date.split("  ");
		for(int i=0;i<days.length;i++) {
			if(jdate.equals(days[i])) {
				day = i+1;
				break;
			}
		}
		System.out.println("day:"+day);
		return gotoPage+"?day="+day+"&date="+date+"&jdate="+jdate+"&sTravel="+sTravel;
	}
}
