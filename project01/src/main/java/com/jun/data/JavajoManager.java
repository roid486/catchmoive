package com.jun.data;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.jun.vo.BoardVo;
import com.jun.vo.ReplyVo;

public class JavajoManager {
	
	private static SqlSessionFactory factory;
	
	static{
		try{
			Reader reader = Resources.getResourceAsReader("com/jun/data/sqlMapConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}

	public static List<BoardVo> list(String searchField, String keyword) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchField", searchField);
		map.put("keyword", keyword);
		
		SqlSession session = factory.openSession();
		List<BoardVo> list=session.selectList("javajo.selectAll",map);
		
		//List<BoardVo> list=session.selectList("javajo.selectAll");
		System.out.println("manager    ::    "+list.get(0).getB_regdate());
		session.close();
		return list;
		
	}

	public static int insert(BoardVo b) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.insert("javajo.insertBoard", b);
		session.close();
		
		return re;
	}

	public static int getNextNo() {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re =  session.selectOne("javajo.getNextNo");
		session.close();
		return re;
		
		
	}

	public static BoardVo getBoard(int b_number) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		BoardVo b = session.selectOne("javajo.getBoard", b_number);
		session.close();
		return b;
	}

	public static int update(BoardVo b) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.insert("javajo.updateBoard",b);
		session.close();
		
		return re;
	}

	public static int delete(int b_number) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.delete("javajo.deleteBoard", b_number);
		session.close();
		return re;
	}
	
	public static int updateHit(int b_number)
	{
		SqlSession session = factory.openSession(true);
		int re =  session.update("javajo.updateHit", b_number);
		session.close();
		return re;
	}

	public static int updateStep(int b_b_ref, int b_b_step) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("b_b_ref", b_b_ref);
		map.put("b_b_step", b_b_step);
		int re = session.update("javajo.updateStep", map);
		return re;
	}

	public static List<ReplyVo> listRe(int b_number) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		List<ReplyVo> listRe = session.selectList("javajo.selectRe",b_number);
		session.close();
		return listRe;
	}

	public static int insertRe(ReplyVo vo) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.insert("javajo.insertRe",vo);
		session.close();
		
		return re;
	}

	public static int getNextRe() {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		
		int re =  session.selectOne("javajo.getNextRe");
		session.close();
		return re;
	}
	
	/*public static List<BoardVo> list(String searchField, String keyword) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchField", searchField);
		map.put("keyword", keyword);
		
		SqlSession session = factory.openSession();
		List<BoardVo> list=session.selectList("javajo.selectAll",map);
		
		//List<BoardVo> list=session.selectList("javajo.selectAll");
		System.out.println("manager    ::    "+list.get(0).getB_regdate());
		session.close();
		return list;
		
	}*/
		
}
