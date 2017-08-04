package com.javajo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.javajo.data.JavajoManager;
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

@Repository
public class JavajoDao {

	public List<MovieTheaterVo> mtlist() {
		// TODO Auto-generated method stub
		return JavajoManager.mhlist();
	}

	public String loginok(CustomerVo cv) {
		// TODO Auto-generated method stub
		return JavajoManager.loginok(cv);
	}

	public int signup(CustomerVo cv) {
		// TODO Auto-generated method stub
		return JavajoManager.signup(cv);
	}

	public int serchcust(String name, String email) {
		// TODO Auto-generated method stub
		return JavajoManager.serchcust(name,email);
	}

	public int serchid(String id) {
		// TODO Auto-generated method stub
		return JavajoManager.serchid(id);
	}

	public int echeckupdate(String email, String yes) {
		// TODO Auto-generated method stub
		return JavajoManager.echeckupdate(email,yes);
	}

	public List<CustomerVo> clist(int num1, int num2, String key) {
		// TODO Auto-generated method stub
		return JavajoManager.clist(num1,num2,key);
	}

	public int ctotalRecode(String key) {
		// TODO Auto-generated method stub
		return JavajoManager.totalrecode(key);
	}

	public int cdelete(String c_id) {
		// TODO Auto-generated method stub
		return JavajoManager.cdelete(c_id);
	}

	public String scid(String name, String email) {
		// TODO Auto-generated method stub
		return JavajoManager.scid(name,email);
	}

	public String scpw(String id, String name, String email) {
		// TODO Auto-generated method stub
		return JavajoManager.scpw(id,name,email);
	}

	public CustomerVo cdetail(String c_id) {
		// TODO Auto-generated method stub
		return JavajoManager.cdetail(c_id);
	}

	public int cupdate(CustomerVo cv) {
		// TODO Auto-generated method stub
		return JavajoManager.cupdate(cv);
	}

	public int mttotalRecode(String key) {
		// TODO Auto-generated method stub
		return JavajoManager.mttotalrecode(key);
	}

	public List<MovieTheaterVo2> movietlist(int num1, int num2, String key) {
		// TODO Auto-generated method stub
		return JavajoManager.mtl(num1,num2,key);
	}

	public int insertmt(MovieTheaterVo2 mtv2) {
		// TODO Auto-generated method stub
		return JavajoManager.isertmt(mtv2);
	}

	public MovieTheaterVo2 mtdetail(int mt_number) {
		// TODO Auto-generated method stub
		return JavajoManager.mtdetail(mt_number);
	}

	public int mtupdate(MovieTheaterVo2 mtv2) {
		// TODO Auto-generated method stub
		return JavajoManager.mtupdate(mtv2);
	}

	public int mtdelete(int mt_number) {
		// TODO Auto-generated method stub
		return JavajoManager.mtdelete(mt_number);
	}

	public int mtotalRecode(String key) {
		// TODO Auto-generated method stub
		return JavajoManager.mtotalrecode(key);
	}

	public List<MovieVo_j> mlist(int num1, int num2, String key) {
		// TODO Auto-generated method stub
		return JavajoManager.mlist(num1,num2,key);
	}

	public List<MovienameVo> moviename() {
		// TODO Auto-generated method stub
		return JavajoManager.mscorelist();
	}

	public int ttotalRecode(String key) {
		// TODO Auto-generated method stub
		return JavajoManager.ttotalrecode(key);
	}

	public List<TheaterVo> tlist(int num1, int num2, String key) {
		// TODO Auto-generated method stub
		return JavajoManager.tlist(num1,num2,key);
	}

	public int insertt(TheaterVo tv) {
		// TODO Auto-generated method stub
		return JavajoManager.tinsert(tv);
	}

	public List<MovieTheaterVo2> mtlist2() {
		// TODO Auto-generated method stub
		return JavajoManager.mlist2();
	}

	public int sinsert(int row, String string, int t_number, int maxrnum, int mt_number) {
		// TODO Auto-generated method stub
		return JavajoManager.sinsert(row,string,t_number,maxrnum,mt_number);
	}

	public int t_num() {
		// TODO Auto-generated method stub
		return JavajoManager.t_num();
	}

	public int tdelete(int t_number) {
		// TODO Auto-generated method stub
		return JavajoManager.tdelete(t_number);
	}

	public int sdelete(int t_number) {
		// TODO Auto-generated method stub
		return JavajoManager.sdelete(t_number);
	}

	public int rtotalRecode(String key) {
		// TODO Auto-generated method stub
		return JavajoManager.rtotal(key);
	}

	public List<RunningVo2> rlist(int num1, int num2, String key) {
		// TODO Auto-generated method stub
		return JavajoManager.rlist(num1,num2,key);
	}

	public int insertr(RunningVo rv) {
		// TODO Auto-generated method stub
		return JavajoManager.insertr(rv);
	}

	public List<MovieVo_j> msele() {
		// TODO Auto-generated method stub
		return JavajoManager.msele();
	}

	public List<MovieTheaterVo2> mtsele() {
		// TODO Auto-generated method stub
		return JavajoManager.mtsele();
	}

	public List<TheaterVo> tsele(int mt_number) {
		// TODO Auto-generated method stub
		return JavajoManager.tsele(mt_number);
	}

	public int rdelete(int r_number) {
		// TODO Auto-generated method stub
		return JavajoManager.rdelete(r_number);
	}

	public RunningVo2 rdetail(int r_number) {
		// TODO Auto-generated method stub
		return JavajoManager.rdetail(r_number);
	}

	public int rupdate(RunningVo rv) {
		// TODO Auto-generated method stub
		return JavajoManager.rupdate(rv);
	}

	public int etotalRecode(String key) {
		// TODO Auto-generated method stub
		return JavajoManager.etotal(key);
	}

	public List<EventVo> elist(int num1, int num2, String key) {
		// TODO Auto-generated method stub
		return JavajoManager.elist(num1,num2,key);
	}

	public int inserte(EventVo ev) {
		// TODO Auto-generated method stub
		return JavajoManager.inserte(ev);
	}

	public List<CustomerVo> celist() {
		// TODO Auto-generated method stub
		return JavajoManager.celist();
	}

	public int edelete(int e_number) {
		// TODO Auto-generated method stub
		return JavajoManager.edelete(e_number);
	}

	public EventVo edetail(int e_number) {
		// TODO Auto-generated method stub
		return JavajoManager.edetail(e_number);
	}

	public int eupdate(EventVo ev) {
		// TODO Auto-generated method stub
		return JavajoManager.eupdate(ev);
	}

	public List<MovieVo_j> mslist() {
		// TODO Auto-generated method stub
		return JavajoManager.mslist();
	}

	public List<RunningVo3> runninglist(int t_number) {
		// TODO Auto-generated method stub
		return JavajoManager.runninglist(t_number);
	}

	public int hitupdate(int e_number) {
		// TODO Auto-generated method stub
		return JavajoManager.hitupdate(e_number);
	}

	public int tseat(int t_number) {
		// TODO Auto-generated method stub
		return JavajoManager.tseat(t_number);
	}

	public int maxrnum() {
		// TODO Auto-generated method stub
		return JavajoManager.maxrnum();
	}

	public List<MyticketVo> myt(String c_id) {
		// TODO Auto-generated method stub
		return JavajoManager.myt(c_id);
	}

	public List<MyhistoryVo> mth(String c_id) {
		// TODO Auto-generated method stub
		return JavajoManager.myh(c_id);
	}

	public int btotalRecode(String key) {
		// TODO Auto-generated method stub
		return JavajoManager.btotal(key);
	}

	public List<BoardVo> blist(int num1, int num2, String key) {
		// TODO Auto-generated method stub
		return JavajoManager.blist(num1,num2,key);
	}

	public int nbtotalRecode(String key) {
		// TODO Auto-generated method stub
		return JavajoManager.nbtotal(key);
	}

	public List<NoticeboardVo> nblist(int num1, int num2, String key) {
		// TODO Auto-generated method stub
		return JavajoManager.nblist(num1,num2,key);
	}

	public int mybtotalRecode(String key, String c_id) {
		// TODO Auto-generated method stub
		return JavajoManager.mybtotal(key,c_id);
	}

	public List<BoardVo> myblist(int num1, int num2, String key, String c_id) {
		// TODO Auto-generated method stub
		return JavajoManager.myblist(num1,num2,key,c_id);
	}

	public List<BoardVo> myb(String c_id) {
		// TODO Auto-generated method stub
		return JavajoManager.myb(c_id);
	}

}
