package myjourney.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import main.model.CartBean;
import main.model.MainBean;
import main.model.StartBean;
import member.model.MemberDao;
import myjourney.model.MyJourneyBean;
import myjourney.model.MyJourneyDao;


@Controller
public class JourneyController {
	@Autowired
	MyJourneyDao myjDao;
	@Autowired
	MemberDao mDao;
	   private final String gotoPage = "mainScreen.m";
	@RequestMapping("mainJourney.mj")
	public void journey(HttpServletRequest request,HttpServletResponse response,MainBean mb, HttpSession session) {
		
		 response.setContentType("text/html;charset=UTF-8");
		 PrintWriter out;
		if(mb.getHotel()==null) {
//			session.setAttribute("date", session.getAttribute("date"));
//			session.setAttribute("sTravel", session.getAttribute("sTravel"));
//			return "redirect:mainTravel.m";
		         try {
		            out = response.getWriter();
		            out.write("<script>alert('출발지(호텔)를 선택하셔야 생성됩니다.');history.go(-1);</script>");
		              out.flush();
		         } catch (IOException e) {
		            e.printStackTrace();
		         }
		}
		
		String myemail = (String)session.getAttribute("myemail");
		String id = myemail;
		int myjNum = 1;
		myjDao.updateMJList(id);
		
		String date[]=request.getParameter("date").split(" ");

		List<CartBean> cartlist=new ArrayList<CartBean>();
		List<StartBean> startlist=new ArrayList<StartBean>();
		
			System.out.println("mb.getHotel()" + mb.getHotel());
			String hotels[] = mb.getHotel().split(",");
			
			System.out.println("hotels.length"+hotels.length);
			System.out.println("date.length"+date.length);
			
			if(hotels.length>date.length) {
			         try {
			            out = response.getWriter();
			            out.write("<script>alert('출발지(호텔)가 여행 날보다 많습니다');history.go(-1);</script>");
			              out.flush();
			         } catch (IOException e) {
			            e.printStackTrace();
			         }
			}

			String[][]  hotel = new String[hotels.length][];

			for (int i = 0; i < hotels.length; i++) {
				hotel[i] = hotels[i].split("/");
				System.out.println("hotel["+i+"][0]"+hotel[i][0]);
				System.out.println("hotel["+i+"][1]"+hotel[i][1]);
				System.out.println("hotel["+i+"][2]"+hotel[i][2]);
			}


			if(mb.getCafe()!=null) {
				System.out.println("mb.getCafe()" + mb.getCafe());
				String cafes[] = mb.getCafe().split(",");
				String[][] cafe = new String[cafes.length][];

				for (int i = 0; i < cafes.length; i++) {
					cafe[i] = cafes[i].split("/");
					System.out.println("hotel["+i+"][0]"+cafe[i][0]);
					System.out.println("hotel["+i+"][1]"+cafe[i][1]);
					System.out.println("hotel["+i+"][2]"+cafe[i][2]);
				}

				for (int i = 0; i < cafe.length; i++) {

					CartBean cb = new CartBean();
					cb.setCate("cafe");
					cb.setNum(cafe[i][0]); 
					cb.setXpos(cafe[i][1]); 
					cb.setYpos(cafe[i][2]); 
					cartlist.add(cb);
					System.out.println("cart :"+cartlist.size());
				}
			}
			if(mb.getRestaurant()!=null) {

				String restaurants[] = mb.getRestaurant().split(",");
				String[][] restaurant = new String[restaurants.length][];
				if(restaurants.length!=0) {
					for (int i = 0; i < restaurants.length; i++) {
						restaurant[i] = restaurants[i].split("/");
						System.out.println("restaurant["+i+"][0]"+restaurant[i][0]);
						System.out.println("restaurant["+i+"][1]"+restaurant[i][1]);
						System.out.println("restaurant["+i+"][2]"+restaurant[i][2]);
					}

					for (int i = 0; i < restaurant.length; i++) {

						CartBean cb = new CartBean();
						cb.setCate("restaurant");
						cb.setNum(restaurant[i][0]); 
						cb.setXpos(restaurant[i][1]); 
						cb.setYpos(restaurant[i][2]); 
						cartlist.add(cb);
					}}
			}

			if (mb.getSpot()!=null) {
				System.out.println("mb.getSpot()" + mb.getSpot());
				String spots[] = mb.getSpot().split(",");
				String[][] spot = new String[spots.length][];

				for (int i = 0; i < spots.length; i++) {
					spot[i] = spots[i].split("/");
					System.out.println("spot["+i+"][0]"+spot[i][0]);
					System.out.println("spot["+i+"][1]"+spot[i][1]);
					System.out.println("spot["+i+"][2]"+spot[i][2]);
				}

				for (int i = 0; i < spot.length; i++) {
					System.out.println();
					CartBean cb = new CartBean();
					cb.setCate("spot");
					cb.setNum(spot[i][0]); 
					cb.setXpos(spot[i][1]); 
					cb.setYpos(spot[i][2]); 
					cartlist.add(cb);

					System.out.println("spot"+cartlist.size());
				}
			}

			System.out.println("cartlist.size()"+cartlist.size());
			if(cartlist.size()<(date.length*3)) {
			         try {
			            out = response.getWriter();
			            out.write("<script>alert('선택한 여정이 적습니다 더 선택해주세요');window.history.back();</script>");
			              out.flush();
			         } catch (IOException e) {
			            e.printStackTrace();
			         }
			         
			}
			else {
			System.out.println("====================================================");
			
			int turnSize = (int) Math.ceil((double) cartlist.size() / date.length);
		System.out.println("turnSize"+turnSize);
			int last =hotel.length-1;
			
			int h=0;
			for(int d =0;d<date.length;d++) {
					int turn=1;
					StartBean cb = new StartBean();
					if(h>=hotel.length) {
					cb.setDate(date[d]); 
					cb.setNumber(hotel[last][0]);
					cb.setXpos(hotel[last][1]); 
					cb.setYpos(hotel[last][2]); 
					startlist.add(cb);
					}else {
						cb.setDate(date[d]); 
						cb.setNumber(hotel[h][0]);
						cb.setXpos(hotel[h][1]); 
						cb.setYpos(hotel[h][2]); 
						startlist.add(cb);
					}
					System.out.println("======================="+d+" "+turn+" "+ (startlist.get(startlist.size()-1).getXpos()+","+startlist.get(startlist.size()-1).getYpos())+"======================");
					
					MyJourneyBean mjb = new MyJourneyBean();
					if(h>=hotel.length) {
						mjb.setJnum(myjNum);
						mjb.setId(id);
						mjb.setCate("hotel");
						mjb.setRef(hotel[last][0]);
						mjb.setTurn(turn);
						turn ++;
						mjb.setXpos(hotel[last][1]);
						mjb.setYpos(hotel[last][2]);
						mjb.setJdate(date[d]);	
					}else {
						mjb.setJnum(myjNum);
					mjb.setId(id);
					mjb.setCate("hotel");
					mjb.setRef(hotel[h][0]);
					mjb.setTurn(turn);
					turn ++;
					mjb.setXpos(hotel[h][1]);
					mjb.setYpos(hotel[h][2]);
					mjb.setJdate(date[d]);
					}
					myjDao.insertTravel(mjb);
					
				
			
			
		
		System.out.println("startlist.size()"+startlist.size());
		System.out.println("turnSize"+turnSize);
				for(int t=0;t<turnSize;t++) {
					if(cartlist.size()==0) {
						break;
					}
					
					double[] result =new double[cartlist.size()];
					double minDistance=Double.MAX_VALUE;;
					int minIndex =0;
					System.out.println("Double.parseDouble(startlist.get(startlist.size()-1).getXpos()),Double.parseDouble(startlist.get(startlist.size()-1).getXpos())"+Double.parseDouble(startlist.get(startlist.size()-1).getXpos())+"/"+Double.parseDouble(startlist.get(startlist.size()-1).getXpos()));
					for(int i =0 ; i<cartlist.size();i++) {
						result[i] = Distance(Double.parseDouble(startlist.get(startlist.size()-1).getXpos()),Double.parseDouble(startlist.get(startlist.size()-1).getYpos()), cartlist.get(i).getXpos(), cartlist.get(i).getYpos());
						if (result[i] < minDistance) {
							minDistance = result[i];
							minIndex = i;
						}
					}


					for(int i1=0; i1<result.length;i1++) {
						System.out.println(cartlist.get(i1).getCate()+cartlist.get(i1).getNum()+" result"+i1+":"+result[i1]);

					}

					System.out.println("minDistance"+minDistance);
					System.out.println("minIndex"+minIndex);
					
					System.out.println("======================="+d+" "+turn+" "+ (startlist.get(startlist.size()-1).getXpos()+","+startlist.get(startlist.size()-1).getYpos())+"======================");
					
					MyJourneyBean s = new MyJourneyBean();
					s.setJnum(myjNum);
					s.setId(id);
					s.setCate(cartlist.get(minIndex).getCate());
					s.setRef(cartlist.get(minIndex).getNum());
					s.setTurn(turn);
					turn ++;
					s.setXpos(String.valueOf(cartlist.get(minIndex).getXpos()));
					s.setYpos(String.valueOf(cartlist.get(minIndex).getYpos()));
					s.setJdate(date[d]);

					myjDao.insertTravel(s);

					StartBean sb = new StartBean();
					
					sb.setDate(date[d]);
					sb.setNumber(cartlist.get(minIndex).getNum());
					sb.setXpos(Double.toString(cartlist.get(minIndex).getXpos()));
					sb.setYpos(Double.toString(cartlist.get(minIndex).getYpos()));
					startlist.add(sb);
					cartlist.remove(minIndex);
					
					System.out.println("d"+d+"date.length"+date.length+"cartlist.size"+cartlist.size());
					System.out.println((d+1)+" "+date.length+"&&"+cartlist.size());
					
					if(d+1==date.length&&cartlist.size()!=0) {
						System.out.println("cartlist.size()"+cartlist.size());
						while(cartlist.size()!=0) {
							double[] result1 =new double[cartlist.size()];
							double minDistance1=Double.MAX_VALUE;;
							int minIndex1 =0;
							for(int i =0 ; i<cartlist.size();i++) {
								result1[i] = Distance(Double.parseDouble(startlist.get(startlist.size()-1).getXpos()),Double.parseDouble(startlist.get(startlist.size()-1).getYpos()), cartlist.get(i).getXpos(), cartlist.get(i).getYpos());
								if (result1[i] < minDistance1) {
									minDistance1 = result1[i];
									minIndex1 = i;
								}
							}


							for(int i1=0; i1<result1.length;i1++) {
								System.out.println(cartlist.get(i1).getCate()+cartlist.get(i1).getNum()+" result"+i1+":"+result1[i1]);

							}

							System.out.println("minDistance"+minDistance1);
							System.out.println("minIndex"+minIndex1);
							
							System.out.println("======================="+d+" "+turn+" "+ (startlist.get(startlist.size()-1).getXpos()+","+startlist.get(startlist.size()-1).getYpos())+"======================");
							
							MyJourneyBean s1 = new MyJourneyBean();
							s1.setJnum(myjNum);
							s1.setId(id);
							s1.setCate(cartlist.get(minIndex1).getCate());
							s1.setRef(cartlist.get(minIndex1).getNum());
							s1.setTurn(turn);
							turn ++;
							s1.setXpos(String.valueOf(cartlist.get(minIndex1).getXpos()));
							s1.setYpos(String.valueOf(cartlist.get(minIndex1).getYpos()));
							s1.setJdate(date[d]);

							myjDao.insertTravel(s1);

							StartBean sb1 = new StartBean();
							
							sb1.setDate(date[d]);
							sb1.setNumber(cartlist.get(minIndex1).getNum());
							sb1.setXpos(Double.toString(cartlist.get(minIndex1).getXpos()));
							sb1.setYpos(Double.toString(cartlist.get(minIndex1).getYpos()));
							startlist.add(sb1);
							cartlist.remove(minIndex1);
							
							
						}
					}
					
				}
				h++;
			}
			mDao.updateMyjNum(myemail);
			
	            try {
	               mDao.updateMyjNum(id);
	               out = response.getWriter();
	               out.write("<script>alert('여정을 생성하였습니다.');location.href='"+gotoPage+"'</script>");
	               out.flush();
	            } catch (IOException e) {
	               e.printStackTrace();
	            }}
//		return "redirect:mainScreen.m";

	}

    public static double Distance(double lat1, double lon1, double lat2, double lon2) {
        double theta, dist;
        if ((lat1 == lat2) && (lon1 == lon2)) {
            return 0;
        } else {
            theta = lon1 - lon2;
            dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1))
                    * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
            dist = Math.acos(dist);
            dist = rad2deg(dist);
            dist = dist * 60 * 1.1515;
            dist = dist * 1.609344;
  
            return dist;
        }
    }

    // This function converts decimal degrees to radians
    public static double deg2rad(double deg) {
        return deg * Math.PI / 180;
    }

    // This function converts radians to decimal degrees
    public static double rad2deg(double rad) {
        return rad * 180 / Math.PI;
    }


}
