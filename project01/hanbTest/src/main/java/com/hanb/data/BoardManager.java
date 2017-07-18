package com.hanb.data;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import javax.security.sasl.SaslServerFactory;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hanb.vo.BoardVo;

public class BoardManager {

	private static SqlSessionFactory factory;
	
	static
	{
		try{
			Reader reader = Resources.getResourceAsReader("com/hanb/data/sqlMapConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
	
	public static BoardVo getBoard(int no)
	{
		SqlSession session = factory.openSession();
		BoardVo b = session.selectOne("board.getBoard", no);
		session.close();
		return b;
	}
	
	
	public static int insertBoard(BoardVo b)
	{
		SqlSession session = factory.openSession(true);
		int re =  session.insert("board.insertBoard", b);
		session.close();
		return re;
	}
	
	public static int getNextNo()
	{
		SqlSession session = factory.openSession(true);
		int re =  session.selectOne("board.getNextNo");
		session.close();
		return re;
	}
	
	public static int getTotal()
	{
		SqlSession session = factory.openSession(true);
		int re =  session.selectOne("board.getTotal");
		session.close();
		return re;
	}
	
	public static int updateHit(int no)
	{
		SqlSession session = factory.openSession(true);
		int re =  session.update("board.updateHit", no);
		session.close();
		return re;
	}
	
	
	public static List<BoardVo> list(int start, int end)
	{
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		List<BoardVo> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("board.selectAll", map);
		session.close();
		return list;
	}


	public static int updateStep(int b_ref, int b_step) {
		// TODO Auto-generated method stub
		
		SqlSession session = factory.openSession(true);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("b_ref", b_ref);
		map.put("b_step", b_step);
		int re =  session.update("board.updateStep", map);
		session.close();
		return re;
	}
}







