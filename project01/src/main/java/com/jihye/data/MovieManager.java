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
		System.out.println("����� �Ŵ��� : "+m.getM_grade());
		int re = session.insert("movie.insertMovie",m);
		session.close();
		return re;
		
	}
}