package cafe.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("cafeDao")
public class CafeDao {
	private final String namespace = "cafe.Cafe";

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<CafeBean> getAllCafe(Map<String, String> map, Paging pageInfo) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<CafeBean> lists = sqlSessionTemplate.selectList(namespace+".getAllCafe", map, rowBounds);
		return lists;
	}

	public CafeBean getCafeDetailByCnum(String cnum) {
		CafeBean cb = sqlSessionTemplate.selectOne(namespace+".getCafeDetailByCnum", cnum);
		return cb;
	}

	public void insertCafe(CafeBean cb) {
		int cnt = sqlSessionTemplate.insert(namespace+".insertCafe", cb);
		System.out.println("insertCafe cnt:"+cnt);
	}

	public int getTotalCount(Map<String, String> map) {
		int totalCount = sqlSessionTemplate.selectOne(namespace+".getTotalCount", map);
		return totalCount;
	}

	public void deleteCafe(String cnum) {
		int cnt = sqlSessionTemplate.delete(namespace+".deleteCafe", cnum);
		System.out.println("deleteCafe cnt:"+cnt);
	}
	
	public void updateCafe(CafeBean cb) {
		int cnt = sqlSessionTemplate.update(namespace+".updateCafe", cb);
		System.out.println("updateCafe cnt:"+cnt);
	}
	
}
