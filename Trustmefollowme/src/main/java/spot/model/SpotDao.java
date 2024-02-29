package spot.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("spotDao")
public class SpotDao {
	private final String namespace = "spot.Spot";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<SpotBean> spotList(Map<String, String> map, Paging paging) {
		RowBounds row =new RowBounds(paging.getOffset(), paging.getLimit());
		List<SpotBean> lists =sqlSessionTemplate.selectList(namespace+".spotList",map, row);
		return lists;
	}

	public int totalCount(Map<String, String> map) {
		int total = sqlSessionTemplate.selectOne(namespace+".listTotal",map);
		return total;
	}

	public void spotInsert(SpotBean sb) {
		sqlSessionTemplate.insert(namespace+".spotInsert",sb);
	}

	public SpotBean spotDetail(int snum) {
		SpotBean sb = sqlSessionTemplate.selectOne(namespace+".spotDetail",snum);
		return sb;
	}

	public void deleteSpot(int snum) {
		sqlSessionTemplate.delete(namespace+".spotDelete",snum);
	}

	public void updateSpot(SpotBean sb) {
		sqlSessionTemplate.update(namespace+".spotUpdate",sb);

	}


}
