package com.jun.data;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.jun.vo.BoardVo;

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

	public static List<BoardVo> list() {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		List<BoardVo> list=session.selectList("javajo.selectAll");
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
	
		
}
