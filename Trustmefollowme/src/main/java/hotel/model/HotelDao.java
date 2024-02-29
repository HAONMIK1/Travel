package hotel.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("hotelDao")
public class HotelDao {
	private final String namespace = "hotel.Hotel";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void insertHotel(HotelBean hb) {
		sqlSessionTemplate.insert(namespace+".insertHotel",hb);
	}

	public List<HotelBean> getAllHotel(Map<String, String> map,Paging pageInfo) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		
		List<HotelBean> list=sqlSessionTemplate.selectList(namespace+".getAllHotel",map,rowBounds);
		
		
		
		return list;
	}

	public int totalCount(Map<String, String> map) {
	int cnt = sqlSessionTemplate.selectOne(namespace+".totalCount",map);
		
		return cnt;
	}


	public HotelBean getHotel(int hnum) {
	HotelBean hotel = sqlSessionTemplate.selectOne(namespace+".getHotel",hnum);
	return hotel;
	}

	public void updateHotel(HotelBean hb) {
		sqlSessionTemplate.update(namespace+".updateHotel",hb);
	}

	public void deleteHotel(int hnum) {
		sqlSessionTemplate.delete(namespace+".deleteHotel",hnum);
	}


	
}
