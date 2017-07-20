package com.javajo.data;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.javajo.vo.CustomerVo;
import com.javajo.vo.MovieTheaterVo;

public class JavajoManager {
	private static SqlSessionFactory factory;
	
	static{
		try{
			Reader reader = Resources.getResourceAsReader("com/javajo/data/SqlConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}

	public static List<MovieTheaterVo> mhlist() {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		List<MovieTheaterVo> list = session.selectList("javajo.mtAll");
		session.close();
		return list;
	}

	public static String loginok(CustomerVo cv) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		String id = session.selectOne("javajo.login", cv);
		session.close();
		return id;
	}

	public static int signup(CustomerVo cv) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.insert("javajo.signup", cv);
		session.close();
		return re;
	}

	public static int serchcust(String name, String email) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		int re = session.selectOne("javajo.serchcust", map);
		session.close();
		return re;
	}

	public static int serchid(String id) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		int re = session.selectOne("javajo.serchid",id);
		session.close();
		return re;
	}

}
