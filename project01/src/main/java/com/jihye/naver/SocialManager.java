package com.jihye.naver;

import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.javajo.vo.CustomerVo;
import com.jihye.vo.MovieScoreVo;
import com.jihye.vo.MovieVo_j;



public class SocialManager {

	private static SqlSessionFactory factory;
	
	static{
		try{
			
			Reader reader = Resources.getResourceAsReader("com/jihye/data/sqlMapConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
			
		}catch(Exception e){System.out.println(e.getMessage());}
		
	}
	
	public static int insertNaverMember(String c_id,String c_email,String c_gender){
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("c_id", c_id);
		map.put("c_email", c_email);
		map.put("c_gender", c_gender);
		
		System.out.println("소셜매니저컨트롤러에서 : "+c_id+" / "+c_email+" / "+c_gender);
		SqlSession session = factory.openSession(true);
		int re = session.insert("SocialLogin.insertnaverMember",map);
		System.out.println("매니저가 묻기를 성공했니? "+re);
		session.close();
		return re;
	}
	
	public static List<CustomerVo> getCustomer(){
		SqlSession session = factory.openSession();
		List<CustomerVo> list = session.selectList("SocialLogin.selectAll");
		session.close();
		return list;
	}
	
	
}
