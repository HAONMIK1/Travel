package myjourney.model;
 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import member.model.MemberBean;

@Component("myJourneyDao")
public class MyJourneyDao {
	private final String namespace = "myjourney.Myjourney";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;


	public void insertTravel(MyJourneyBean mjb) {
		System.out.println("mjb.getId()"+mjb.getId());
		System.out.println("mjb.getJdate()"+mjb.getJdate());
		System.out.println("mjb.getCate()"+mjb.getCate());
		System.out.println("mjb.getNumber()"+mjb.getNum());
		System.out.println("mjb.getTurn()"+mjb.getTurn());
		System.out.println("mjb.getXpos()"+mjb.getXpos());
		System.out.println("mjb.getYpos()"+mjb.getYpos());
		
		sqlSessionTemplate.insert(namespace+".insertjourney",mjb);
		
	}


	public int insertMyJourney(Map<String, Object> map) {
		int cnt = sqlSessionTemplate.insert(namespace+".insertMyJourney", map);
		System.out.println("insertMyJourney cnt:"+cnt);
		return cnt;
	}
	public int MinsertMyJourney(Map<String, Object> map) {
		int cnt = sqlSessionTemplate.insert(namespace+".MinsertMyJourney", map);
		System.out.println("insertMyJourney cnt:"+cnt);
		return cnt;
	}
	
	public List<MyJourneyBean> getAllMyJourney() {
		List<MyJourneyBean> lists = sqlSessionTemplate.selectList(namespace+".getAllMyJourney");
		System.out.println("lists.size():"+lists.size());
		return lists;
	}

	public List<MyJourneyBean> getAllMyJourneyByJdate(String jdate) {
		List<MyJourneyBean> lists = sqlSessionTemplate.selectList(namespace+".getAllMyJourneyByJdate",jdate);
		System.out.println("lists.size():"+lists.size());
		return lists;
	}
	
	public List<MyJourneyBean> MgetAllMyJourneyByJdate(String jdate) {
		List<MyJourneyBean> lists = sqlSessionTemplate.selectList(namespace+".MgetAllMyJourneyByJdate",jdate);
		System.out.println("lists.size():"+lists.size());
		return lists;
	}

	public int saveMyJourney(String id) {
		int cnt = sqlSessionTemplate.update(namespace+".saveMyJourney", id);
		System.out.println("saveMyJourney cnt:"+cnt);
		return cnt;
	}

	public int searchTurnMore(String id) {
		int tCheck = sqlSessionTemplate.selectOne(namespace+".searchTurnMore", id);
		System.out.println("searchTurnMore tCheck:"+tCheck);
		return tCheck;
	}

	public void updateMJList(String id) {
		int cnt = sqlSessionTemplate.update(namespace+".updateMJList", id);
		System.out.println("saveMyJourney cnt:"+cnt);
	}

	public List<MyJourneyBean> myjDateSelect(MyJourneyBean mb) {
		List<MyJourneyBean> list = sqlSessionTemplate.selectList(namespace+".myjDaySelect",mb);
		return list;
	}


	public List<MyJourneyBean> myjSelect(MyJourneyBean mb) {
		List<MyJourneyBean> list = sqlSessionTemplate.selectList(namespace+".myjSelect",mb);
		return list;
	}

	public List<MyJourneyBean> myjSelect(MemberBean mb) {
		List<MyJourneyBean> list = sqlSessionTemplate.selectList(namespace+".myjSelect",mb);
		return list;
	}


	public int saveMyJourney(Map<String, Object> map) {
		int cnt = sqlSessionTemplate.update(namespace+".saveMyJourney", map);
		System.out.println("saveMyJourney cnt:"+cnt);
		return cnt;
	}

	

	public void updateMJList(Map<String, Object> map) {
		int cnt = sqlSessionTemplate.update(namespace+".updateMJList", map);
		System.out.println("saveMyJourney cnt:"+cnt);
	}

	public int searchJnumZero(String id) {
		System.out.println("id:"+id);
		int check = sqlSessionTemplate.selectOne(namespace+".searchJnumZero", id);
		System.out.println("check:"+check);
		return check;
	}

	public List<MyJourneyBean> getMJDetailByIdAndMyjnum(Map<String, Object> map) {
		List<MyJourneyBean> list = sqlSessionTemplate.selectList(namespace+".getMJDetail", map);
		System.out.println("list.size():"+list.size());
		return list;
	}

	public List<MyJourneyBean> getDayListByJnum(int jnum) {
		List<MyJourneyBean> daylist = sqlSessionTemplate.selectList(namespace+".getDayListByJnum", jnum);
		return daylist;
	}


	public int deleteMjCart(Map<String, Object> map) {
		int cnt = sqlSessionTemplate.delete(namespace+".deleteMjCart", map);
		System.out.println("deleteMyjourney cnt:"+cnt);
		return cnt;
	}

	   // board 시작
	   public List<MyJourneyBean> boardList(String id, String jnum) {      // board 추가
	      Map<String, String> map = new HashMap<String, String>();
	      map.put("jnum", jnum);
	      map.put("id", id);
	      
	      List<MyJourneyBean> list = sqlSessionTemplate.selectList(namespace+".boardList",map);
	      
	      return list;
	      
	   }


	   public List<MyJourneyBean> getjNum(String id) {
	      
	      List<MyJourneyBean> lists = sqlSessionTemplate.selectList(namespace+".getjNum",id);
	      
	      return lists;
	      
	   }

	   public String minDate(String jnum, String id) {
	      Map<String, String> map = new HashMap<String, String>();
	      map.put("jnum", jnum);
	      map.put("id", id);
	      
	      String minDate = sqlSessionTemplate.selectOne(namespace+".minDate",map);
	      
	      return minDate;
	      
	   }
	   public String maxDate(String jnum, String id) {
	      Map<String, String> map = new HashMap<String, String>();
	      map.put("jnum", jnum);
	      map.put("id", id);
	      
	      String maxDate = sqlSessionTemplate.selectOne(namespace+".maxDate",map);
	      
	      return maxDate;
	      
	   }


	   public List<MyJourneyBean> boardListCount(String mEmail, String jnum) {
	      Map<String, String> map = new HashMap<String, String>();
	      map.put("mEmail", mEmail);
	      map.put("jnum", jnum);
	      
	      List<MyJourneyBean> lists = sqlSessionTemplate.selectList(namespace+".boardListCount",map);
	      
	      return lists;
	   }


	   public int dateCount(String mEmail, String jnum) {
	      Map<String, String> map = new HashMap<String, String>();
	      map.put("mEmail", mEmail);
	      map.put("jnum", jnum);
	      
	      int cnt = sqlSessionTemplate.selectOne(namespace+".dateCount",map);
	      
	      return cnt;
	   }

	   public int deleteMyjourney(Map<String, Object> map) {
	      int cnt = sqlSessionTemplate.delete(namespace+".deleteMyjourney", map);
	      System.out.println("deleteMyjourney cnt:"+cnt);
	      return cnt;
	   }
	   public List<MyJourneyBean> getMJNums(String id) {
		      List<MyJourneyBean> lists = sqlSessionTemplate.selectList(namespace+".getMJNums", id);
		      System.out.println("lists.size():"+lists.size());
		      return lists;
		   }


	  public void deleteJnumZero() {
		  sqlSessionTemplate.selectList(namespace+".deleteJnumZero");
		
	}


	  public int searchByJateAndJnumZero(Map<String, String> map) {
	      int count = sqlSessionTemplate.selectOne(namespace+".searchByJateAndJnumZero", map);
	      return count;
	   }

}
