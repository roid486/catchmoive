package com.silver.data;

import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.silver.vo.BoxofficeVo;
import com.silver.vo.MovieVo;
import com.silver.vo.SeatVo;
import com.silver.vo.TicketCheckVo;
import com.silver.vo.TicketInfo;
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
	public static List<SeatVo> theaterSeat(String theater_number, String movietheater_number, String running_number) {
		
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("theater_number", theater_number);
		map.put("movietheater_number", movietheater_number);
		map.put("running_number",running_number);
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
		System.out.println("arr.length    ::       "+arr.length);
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
	public static String getpost(String movie_number) {
		SqlSession session = factory.openSession();
		String str = session.selectOne("ticket.getpost", movie_number);
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
			session.delete("ticket.resetSeat");
			session.delete("ticket.deleteTicket");
		}
		System.out.println(re);
		return 2;
	}
	public static TicketCheckVo ticketcheck(int ticket_number) {
		SqlSession session = factory.openSession();
		TicketCheckVo t = session.selectOne("ticket.ticketcheck", ticket_number);
		
		return t;
	}
	public static TicketInfo ticketinfo(int ticket_number) {
		SqlSession session = factory.openSession();
		TicketInfo info = session.selectOne("ticket.ticketinfo", ticket_number);
		
		
		return info;
	}
	public static Object boxoffice() {
		SqlSession session = factory.openSession(true);
		int total = session.selectOne("ticket.histotal");
		List<BoxofficeVo> list = session.selectList("ticket.hislis"); 
		System.out.println("되라 업데이트 제발1");
		
		for(int i=0; i < list.size(); i++)
		{
			System.out.println("되라 업데이트 제발2");
			HashMap<String, Object> map = new HashMap<String, Object>();
			System.out.println();
			double box = (list.get(i).getCnt()/(double)total)*100;
			box = Math.round(box * 10) / 10.0;
			System.out.println("list.get(i).getCnt()   :"+list.get(i).getCnt()+"  // total :: "+total);
			System.out.println("box   ::     "+box);
			
			map.put("boxoffice", box);
			map.put("m_number", list.get(i).getM_number());
			session.update("ticket.updateboxoffice", map);
			System.out.println("되라 업데이트 제발3");
		}
		
		return 1;
	}
	private static double format(String string, double box) {
		// TODO Auto-generated method stub
		return 0;
	}
}
