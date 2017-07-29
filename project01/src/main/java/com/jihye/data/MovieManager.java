package com.jihye.data;

import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.jihye.vo.MovieScoreVo;
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
		SqlSession session = factory.openSession(true); //true는 insert,update,delete할때 commit자동으로 바로 해주는거! 
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
	
	public static List<MovieVo_j> listMovie(String s){
		SqlSession session = factory.openSession();
		//System.out.println("매니저의 select"+ s);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("s", s);
		List<MovieVo_j> list = session.selectList("movie.selectAll",map);
		session.close();
		return list;
	}
	
	public static int insertMovieScore(MovieScoreVo ms){
		
		SqlSession session = factory.openSession(true);
		System.out.println("여기는 매니져 : "+ms.getMs_custid());
		int re = session.insert("moviescore.insertMovieScore",ms);
		session.close();
		return re;
		
	}
	
	public static List<MovieScoreVo> listMovieScore(){
		SqlSession session = factory.openSession();
		List<MovieScoreVo> list = session.selectList("moviescore.selectAll");
		session.close();
		
		return list;
	}
	
	public static List<MovieVo_j> getMovieFinder(String searchField,String keyword,String[] m_genre,String[] m_nation,String[] m_grade,String startyear,String endyear){
		
		SqlSession session = factory.openSession();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		
		
		//if(searchWord != null && !searchWord.equals("")){
			map.put("searchField", searchField);
			System.out.println("매니저에서 "+keyword);
		
			
			map.put("keyword", keyword);
			System.out.println("매니저 map.put keyword: "+map.put("keyword", keyword));
		//}
		
	
		if(m_genre!=null && !m_genre.equals("")){
			
			System.out.println("선택된 장르 갯수 in MFController : "+m_genre.length);
			for(int i=0;i<m_genre.length;i++){
				map.put("m_genre"+(i+1), m_genre[i]);
			}
			
		}
		
		if(m_nation!=null && !m_nation.equals("")){
			
			for(int i=0;i<m_nation.length;i++){
				map.put("m_nation"+(i+1), m_nation[i]);
			}
			
		}
		
		if(m_grade!=null && !m_grade.equals("")){
			
			for(int i=0;i<m_grade.length;i++){
				map.put("m_grade"+(i+1), m_grade[i]);
			}
			
		}
		
		
		int startyear1 = 0;
		int endyear1 = 0;
		if(startyear!=null && !startyear.equals("")){
			startyear1 = Integer.parseInt(startyear);
			map.put("startyear",startyear1);
			//System.out.println("매니저 startyear : "+startyear);
			//System.out.println("map startyear : "+map.put("startyear",startyear1));
			
		}
		
		if(endyear != null && !endyear.equals("")){
			endyear1 = Integer.parseInt(endyear);
			map.put("endyear", endyear1);
			//System.out.println("매니저 endyear : "+endyear);
		}
		
		List<MovieVo_j> list = session.selectList("movieFinder.searchMovie",map);
	
		session.close();
		
		return list;
	}
	
	
}
