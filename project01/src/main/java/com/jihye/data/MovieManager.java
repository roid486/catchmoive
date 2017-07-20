package com.jihye.data;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.jihye.vo.MovieVo_j;



public class MovieManager {

	private static SqlSessionFactory factory;
	
	static{
		try{
			
			Reader reader = Resources.getResourceAsReader("com/jihye/data/sqlMapConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
			
		}catch(Exception e){System.out.println(e.getMessage());}
		
	}
	
	public static int insertMovie(MovieVo_j m){
		
		SqlSession session = factory.openSession(true);
		System.out.println("여기는 매니져 : "+m.getM_grade());
		int re = session.insert("movie.insertMovie",m);
		session.close();
		return re;
		
	}
	
	public static int updateMovie(MovieVo_j m){
		SqlSession session = factory.openSession(true);
		int re = session.update("movie.updateMovie", m);
		session.close();
		return re;
	}

	public static MovieVo_j getMovie(int m_number) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		MovieVo_j m = session.selectOne("movie.selectOne",m_number);
		session.close();
		return m;
	}
}
