package com.silver.data;

import java.io.ObjectOutputStream.PutField;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.silver.vo.MovieVo;
import com.silver.vo.MovietheatersubVo;
import com.silver.vo.RunningVo;
import com.silver.vo.RunningstartVo;

public class BookManager {

	private static SqlSessionFactory factory;

	static {
		try {
			Reader reader = Resources.getResourceAsReader("com/silver/data/SqlConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (Exception e) {

			System.out.println(e.getMessage());
		}
	}

	public static List<MovieVo> firstList() {

		SqlSession session = factory.openSession();
		List<MovieVo> list = session.selectList("book.firstList");
		session.close();
		return list;
	}

	public static List<MovietheatersubVo> secondList(String movie_number) {
		SqlSession session = factory.openSession();
		List<MovietheatersubVo> list = session.selectList("book.secondList", Integer.parseInt(movie_number));
		session.close();

		return list;
	}

	public static List<RunningVo> thirdList(String movie_number, String movietheater_number) {

		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("movie_number", Integer.parseInt(movie_number));
		map.put("movietheater_number", Integer.parseInt(movietheater_number));
		List<RunningVo> list = session.selectList("book.thirdList", map);
		session.close();

		return list;
	}

	public static List<RunningstartVo> fourthList(String movie_number, String movietheater_number,
			String running_date) {
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("movie_number", movie_number);
		map.put("movietheater_number", movietheater_number);
		map.put("running_date", running_date);
		List<RunningstartVo> list = session.selectList("book.fourthList", map);
		session.close();
		return list;
	}

	public static String fifthList(String running_start, String running_date) {
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("running_start", running_start);
		map.put("running_date", running_date);
		
		String list = session.selectOne("book.fifthList", map);
		session.close();
		return list;
	}

}
