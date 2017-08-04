package com.javajo.data;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.javajo.vo.CustomerVo;
import com.javajo.vo.EventVo;
import com.javajo.vo.MovieTheaterVo;
import com.javajo.vo.MovieTheaterVo2;
import com.javajo.vo.MovienameVo;
import com.javajo.vo.MyhistoryVo;
import com.javajo.vo.MyticketVo;
import com.javajo.vo.NoticeboardVo;
import com.javajo.vo.RunningVo;
import com.javajo.vo.RunningVo2;
import com.javajo.vo.RunningVo3;
import com.javajo.vo.TheaterVo;
import com.jihye.vo.MovieVo_j;
import com.jun.vo.BoardVo;
import com.jun.vo.NoticeVo;

public class JavajoManager {
	private static SqlSessionFactory factory;
	
	static{
		try{
			Reader reader = Resources.getResourceAsReader("com/javajo/data/SqlConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}

	public static List<MovieTheaterVo> mhlist() {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		List<MovieTheaterVo> list = session.selectList("javajo.mtAll");
		session.close();
		return list;
	}

	public static String loginok(CustomerVo cv) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		String id = session.selectOne("javajo.login", cv);
		session.close();
		return id;
	}

	public static int signup(CustomerVo cv) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.insert("javajo.signup", cv);
		session.close();
		return re;
	}

	public static int serchcust(String name, String email) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		int re = session.selectOne("javajo.serchcust", map);
		session.close();
		return re;
	}

	public static int serchid(String id) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		int re = session.selectOne("javajo.serchid",id);
		session.close();
		return re;
	}

	public static int echeckupdate(String email, String yes) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("yes", yes);
		int echeck = session.update("javajo.echeckupdate", map);
		session.close();
		return echeck;
	}

	public static List<CustomerVo> clist(int num1, int num2, String key) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("key", key);
		map.put("num1", num1);
		map.put("num2", num2);
		List<CustomerVo> list = session.selectList("javajo.clist",map);
		session.close();
		return list;
	}

	public static int totalrecode(String key) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("key", key);
		int totalrecode = session.selectOne("javajo.crecode",map);
		session.close();
		return totalrecode;
	}

	public static int cdelete(String c_id) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int del = session.delete("javajo.cdelete", c_id);
		session.close();
		return del;
	}

	public static String scid(String name, String email) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		String scid = session.selectOne("javajo.scid", map);
		session.close();
		return scid;
	}

	public static String scpw(String id, String name, String email) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		String scpw = session.selectOne("javajo.scpw", map);
		session.close();
		return scpw;
	}

	public static CustomerVo cdetail(String c_id) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		CustomerVo cv = session.selectOne("javajo.cdetail", c_id);
		session.close();
		return cv;
	}

	public static int cupdate(CustomerVo cv) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.update("javajo.cupdate", cv);
		session.close();
		return re;
	}

	public static int mttotalrecode(String key) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("key", key);
		int re = session.selectOne("javajo.mttotalrecode", map);
		session.close();
		return re;
	}

	public static List<MovieTheaterVo2> mtl(int num1, int num2, String key) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num1", num1);
		map.put("num2", num2);
		map.put("key", key);
		List<MovieTheaterVo2> list = session.selectList("javajo.mtl", map);
		return list;
	}

	public static int mtautonum()
	{
		int re = 0;
		SqlSession session = factory.openSession();
		re = session.selectOne("javajo.mtautonum");
		session.close();
		return re;
	}
	
	public static int isertmt(MovieTheaterVo2 mtv2) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		mtv2.setMt_number(mtautonum());
		int re = session.insert("javajo.insertmt",mtv2);
		session.close();
		return re;
	}

	public static MovieTheaterVo2 mtdetail(int mt_number) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		MovieTheaterVo2 mtv2 = session.selectOne("javajo.mtdetail", mt_number);
		session.close();
		return mtv2;
	}

	public static int mtupdate(MovieTheaterVo2 mtv2) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.update("javajo.mtupdate", mtv2);
		session.close();
		return re;
	}

	public static int mtdelete(int mt_number) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.delete("javajo.mtdelete", mt_number);
		session.close();
		return re;
	}

	public static int mtotalrecode(String key) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("key", key);
		int re = session.selectOne("javajo.mtotalrecode", map);
		session.close();
		return re;
	}

	public static List<MovieVo_j> mlist(int num1, int num2, String key) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num1", num1);
		map.put("num2", num2);
		map.put("key", key);
		List<MovieVo_j> list = session.selectList("javajo.mlist", map);
		session.close();
		return list;
	}

	public static List<MovieVo_j> scoremlist() {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		List<MovieVo_j> list = session.selectList("javajo.scoremlist");
		session.close();
		return list;
	}

	public static List<MovienameVo> mscorelist() {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		List<MovienameVo> list = session.selectList("javajo.mscorelist");
		session.close();
		return list;
	}

	public static int ttotalrecode(String key) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("key", key);
		int re = session.selectOne("javajo.ttotal", map);
		session.close();
		return re;
	}

	public static List<TheaterVo> tlist(int num1, int num2, String key) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num1", num1);
		map.put("num2", num2);
		map.put("key", key);
		List<TheaterVo> list = session.selectList("javajo.tlist", map);
		session.close();
		return list;
	}

	public static int tinsert(TheaterVo tv) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.insert("javajo.tinsert", tv);
		session.close();
		return re;
	}

	public static List<MovieTheaterVo2> mlist2() {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		List<MovieTheaterVo2> list = session.selectList("javajo.mlist2");
		session.close();
		return list;
	}

	public static int sinsert(int row, String col, int t_number, int maxrnum, int mt_number) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("row", (char)row);
		map.put("col", col);
		map.put("ft", "n");
		map.put("t_number", t_number);
		map.put("maxrnum", maxrnum);
		map.put("mt_number", mt_number);
		int re = session.insert("javajo.sinsert", map);
		session.close();
		return re;
	}

	public static int t_num() {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		int re = session.selectOne("javajo.t_num");
		session.close();
		return re;
	}

	public static int tdelete(int t_number) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("t_number", t_number);
		System.out.println(t_number);
		int re = session.delete("javajo.tdelete", map);
		session.close();
		return re;
	}

	public static int sdelete(int t_number) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("t_number", t_number);
		int re = session.delete("javajo.sdelete", map);
		session.close();
		return re;
	}

	public static int rtotal(String key) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		if(key==null || key.length()<10)
		{
			key=null;
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("key", key);
		int re = session.selectOne("javajo.rtotal", map);
		session.close();
		return re;
	}

	public static List<RunningVo2> rlist(int num1, int num2, String key) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		if(key==null || key.length()<10)
		{
			key=null;
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num1", num1);
		map.put("num2", num2);
		map.put("key", key);
		List<RunningVo2> list = session.selectList("javajo.rlist", map);
		return list;
	}

	public static int insertr(RunningVo rv) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.insert("javajo.insertr", rv);
		session.close();
		return re;
	}

	public static List<MovieVo_j> msele() {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		List<MovieVo_j> list = session.selectList("javajo.msele");
		session.close();
		return list;
	}

	public static List<MovieTheaterVo2> mtsele() {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		List<MovieTheaterVo2> list = session.selectList("javajo.mtsele");
		session.close();
		return list;
	}

	public static List<TheaterVo> tsele(int mt_number) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mt_number", mt_number);
		List<TheaterVo> list = session.selectList("javajo.tsele", map);
		session.close();
		return list;
	}

	public static int rdelete(int r_number) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("r_number", r_number);
		int re = session.delete("javajo.rdelete", map);
		session.close();
		return re;
	}

	public static RunningVo2 rdetail(int r_number) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("r_number", r_number);
		RunningVo2 rv2 = session.selectOne("javajo.rdetail", map);
		session.close();
		return rv2;
	}

	public static int rupdate(RunningVo rv) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.update("javajo.rupdate", rv);
		session.close();
		return re;
	}

	public static int etotal(String key) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("key", key);
		int re = session.selectOne("javajo.etotal", map);
		return re;
	}

	public static List<EventVo> elist(int num1, int num2, String key) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num1", num1);
		map.put("num2", num2);
		map.put("key", key);
		List<EventVo> list = session.selectList("javajo.elist", map);
		session.close();
		return list;
	}

	public static int inserte(EventVo ev) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.insert("javajo.inserte", ev);
		session.close();
		return re;
	}

	public static List<CustomerVo> celist() {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		List<CustomerVo> celist = session.selectList("javajo.celist");
		session.close();
		return celist;
	}

	public static int edelete(int e_number) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("e_number", e_number);
		int re = session.delete("javajo.edelete", map);
		session.close();
		return re;
	}

	public static EventVo edetail(int e_number) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("e_number", e_number);
		EventVo ev = session.selectOne("javajo.edetail", map);
		session.close();
		return ev;
	}

	public static int eupdate(EventVo ev) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.update("javajo.eupdate", ev);
		session.close();
		return re;
	}

	public static List<MovieVo_j> mslist() {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		List<MovieVo_j> list = session.selectList("javajo.mslist");
		session.close();
		return list;
	}

	public static List<RunningVo3> runninglist(int t_number) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("t_number", t_number);
		List<RunningVo3> list = session.selectList("javajo.runninglist", map);
		session.close();
		return list;
	}

	public static int hitupdate(int e_number) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("e_number", e_number);
		int re = session.update("javajo.hitupdate", map);
		session.close();
		return re;
	}

	public static int tseat(int t_number) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("t_number", t_number);
		int tseat = session.selectOne("javajo.tseat", map);
		session.close();
		return tseat;
	}

	public static int maxrnum() {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		int maxrnum = session.selectOne("javajo.maxrnum");
		session.close();
		return maxrnum;
	}

	public static List<MyticketVo> myt(String c_id) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("c_id", c_id);
		List<MyticketVo> list = session.selectList("javajo.myt", map);
		session.close();
		return list;
	}

	public static List<MyhistoryVo> myh(String c_id) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("c_id", c_id);
		List<MyhistoryVo> list = session.selectList("javajo.myh", map);
		session.close();
		return list;
	}

	public static int btotal(String key) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("key", key);
		int re = session.selectOne("javajo.btotal", map);
		session.close();
		return re;
	}

	public static List<BoardVo> blist(int num1, int num2, String key) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num1", num1);
		map.put("num2", num2);
		map.put("key", key);
		List<BoardVo> list = session.selectList("javajo.blist", map);
		session.close();
		return list;
	}

	public static int nbtotal(String key) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("key", key);
		int re = session.selectOne("javajo.nbtotal", map);
		session.close();
		return re;
	}

	public static List<NoticeboardVo> nblist(int num1, int num2, String key) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num1", num1);
		map.put("num2", num2);
		map.put("key", key);
		List<NoticeboardVo> list = session.selectList("javajo.nblist", map);
		session.close();
		return list;
	}

	public static int mybtotal(String key, String c_id) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("key", key);
		map.put("c_id", c_id);
		int re = session.selectOne("javajo.mybtotal", map);
		session.close();
		return re;
	}

	public static List<BoardVo> myblist(int num1, int num2, String key, String c_id) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num1", num1);
		map.put("num2", num2);
		map.put("key", key);
		map.put("c_id", c_id);
		List<BoardVo> list = session.selectList("javajo.myblist", map);
		session.close();
		return list;
	}

	public static List<BoardVo> myb(String c_id) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("c_id", c_id);
		List<BoardVo> list = session.selectList("javajo.myb", map);
		session.close();
		return list;
	}
	
}
