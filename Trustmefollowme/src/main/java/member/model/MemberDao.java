package member.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("memberDao")
public class MemberDao {

	private final String namespace = "member.Member";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

		public MemberBean getMemberInfoByMyEmail(String myemail) {
		MemberBean mb = sqlSessionTemplate.selectOne(namespace+".getMemberInfoByMyEmail", myemail);
		return mb;
	}

	public int changePw(Map<String, String> map) {
		int cnt = sqlSessionTemplate.update(namespace+".changePw", map);
		return cnt;
	}

	public int updateProfile(MemberBean mb) {
		int cnt = sqlSessionTemplate.update(namespace+".updateProfile", mb);
		return cnt;
	}
	
	public int findEmail(String inputemail) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".findEmail",inputemail);
		return cnt;
	}

	public void insertMember(MemberBean mb) {
		sqlSessionTemplate.insert(namespace+".insertMember",mb);
	}


	public MemberBean getMemberInfo(MemberBean mb) {
		MemberBean member = sqlSessionTemplate.selectOne(namespace+".getMemberInfo",mb);
		return member;
	}

	public List<MemberBean> findPassword(MemberBean mb) {
		List<MemberBean>lists = new ArrayList<MemberBean>();
		lists = sqlSessionTemplate.selectList(namespace+".findPassword",mb);
		return lists;
	}

	public MemberBean getMemberByEmail(String kakaoEmail) {
		MemberBean member = sqlSessionTemplate.selectOne(namespace + ".getMemberByEmail", kakaoEmail);
		return member;
	}

	public List<MemberBean> getAllMember() {
		List<MemberBean> list = sqlSessionTemplate.selectList(namespace+".getAllMember");
		System.out.println("lists.size()"+list.size());
		return list;
	}

	public int getMyjNum(String myemail) {
		int myjNum = sqlSessionTemplate.selectOne(namespace+".getMyjNum",myemail);
		return myjNum;
	}

	public void updateMyjNum(String myemail) {
		sqlSessionTemplate.selectOne(namespace+".updateMyjNum",myemail);
		
	}
	   public void reduceMyjNum(String myemail) {
		      int cnt = sqlSessionTemplate.update(namespace+".reduceMyjNum", myemail);
		      System.out.println("reduceMyjNum cnt:"+cnt);
		   }

	
		public MemberBean getName(String email) {
			MemberBean member = sqlSessionTemplate.selectOne(namespace+".getName",email);
			return member;
		}

		public List<MemberBean> getAllMember(Map<String, String> map, Paging pageInfo) {
			
			RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
			List<MemberBean> list = sqlSessionTemplate.selectList(namespace+".getAllMember",map,rowBounds);
			System.out.println("lists.size()"+list.size());
			return list;
		}

		public int totalCount(Map<String, String> map) {
			int cnt = sqlSessionTemplate.selectOne(namespace+".totalCount",map);
			
			return cnt;
		}

	
}
