package com.jun.data;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.web.servlet.ModelAndView;

import com.jun.vo.BoardVo;
import com.jun.vo.NoticeVo;
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

	//Reply 부분
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

	public static int deleteRe(int re_number) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		
		int re = session.delete("javajo.deleteRe", re_number);
		session.close();
		return re;
	}

	public static ReplyVo getReply(int re_number) {
		// TODO Auto-generated method stub
		
		SqlSession session = factory.openSession();
		ReplyVo r = session.selectOne("javajo.getReply",re_number);
		session.close();
		return r;
	}

	public static int updateRe(ReplyVo r) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		System.out.println("매니저 r.get     :::"+r.getRe_content()+r.getRe_number());
		int re = session.update("javajo.updateReply",r);
	
		session.close();
		
		return re;
	}
	//공지사항부분
	
	public static List<NoticeVo> listNb(int start, int end, String searchField, String keyword, String pOrderField) {
		// TODO Auto-generated method stub
		System.out.println("pOrderField:"+pOrderField);
		System.out.println(start);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("searchField", searchField);
		map.put("keyword", keyword);
		map.put("orderField", pOrderField);
		
		SqlSession session = factory.openSession();
		List<NoticeVo> listNb = session.selectList("javajo.selectNb", map);
		System.out.println("Notice Manager :::   "+listNb.get(0).getNb_number());
		
		session.close();
		
		
		return listNb;
	}

	
	
	public static int getTotal(String searchField, String keyword) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("searchField", searchField);
		map.put("keyword", keyword);
		int re = session.selectOne("javajo.getTotal", map);
		session.close();
		return re;
	}

	public static NoticeVo getNotice(int nb_number) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		NoticeVo n = session.selectOne("javajo.getNotice",nb_number);
		session.close();
		return n;
	}

	public static int noticeHit(int nb_number) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.update("javajo.noticeHit",nb_number);
		session.close();
		return re;
	}

	public static int getNextNb() {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re =  session.selectOne("javajo.getNextNb");
		session.close();
		return re;
	}

	public static int insertNb(NoticeVo n) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.insert("javajo.insertNotice",n);
		session.close();
		return re;
	}

	public static int updateNb(NoticeVo n) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.update("javajo.updateNotice", n);
		session.close();
		return re;
	}

	public static int deleteNb(int nb_number) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.delete("javajo.deleteNotice",nb_number);
		session.close();
		return re;
	}
	

	
		
}
