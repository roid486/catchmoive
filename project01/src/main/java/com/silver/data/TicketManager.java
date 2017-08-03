package com.silver.data;

import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.silver.vo.MovieVo;
import com.silver.vo.SeatVo;
import com.silver.vo.TicketVo;


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

	public static String getmovietheatername(String movietheater_number) {
		SqlSession session = factory.openSession();
		String movietheatername = session.selectOne("ticket.getname", movietheater_number);
		return movietheatername;
	}

	public static int getTicketnum() {
		int num = 0;
		SqlSession session = factory.openSession();
		num = session.selectOne("ticket.getticket");
		
		return num;
	}

	public static int insertticket(HashMap<String, Object> map1) {
		SqlSession session = factory.openSession(true);
		
		int num = session.insert("ticket.insert", map1);
		return num;
	}

	public static int insertseat(HashMap<String, Object> map2, String arr[]) {
		SqlSession session = factory.openSession(true);
		int num = 0;
		System.out.println(arr.length);
		for(int i = 0; i < arr.length;i++)
		{
			
			map2.put("a",arr[i].substring(0, 1) );
			map2.put("b",arr[i].substring(1, 2) );
			num+=session.update("ticket.update",map2);
			
		}
		
		System.out.println("num"+num);
		return num;
	}
	public static String getmoviename(String movie_number) {
		SqlSession session = factory.openSession();
		String str = session.selectOne("ticket.getmovie", movie_number);
		return str;
	}
	public static int inserthistory() {
		SqlSession session = factory.openSession(true);
		List<TicketVo> list = session.selectList("ticket.tlist");
		int re=0;
		for(int i=0; i < list.size(); i++)
		{
		re+= session.insert("ticket.historyinsert",list.get(i));
		
		}
		if(re==list.size())
		{
			session.update("ticket.resetSeat");
			session.delete("ticket.deleteTicket");
		}
		System.out.println(re);
		return 2;
	}
}
