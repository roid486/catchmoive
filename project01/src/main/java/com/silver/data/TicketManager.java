package com.silver.data;

import java.io.Reader;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.silver.vo.MovieVo;
import com.silver.vo.SeatVo;


public class TicketManager {
	private static SqlSessionFactory factory;
	
	static{
		try{
			Reader reader = Resources.getResourceAsReader("com/silver/data/SqlConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public static int seatNum(int theater_num) {
		
		SqlSession session = factory.openSession();
		int num = session.selectOne("ticket.seatNum",theater_num);
		System.out.println("1영화관 좌석수 : "+num);
		return num;
	}

	public static List<SeatVo> theaterSeat(String theater_number, String movietheater_number) {
		
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("theater_number", theater_number);
		map.put("movietheater_number", movietheater_number);
		
		List<SeatVo> list = session.selectList("ticket.theaterseat",map);
		return list;
	}
}
