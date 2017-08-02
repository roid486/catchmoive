package com.jun.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.jun.data.JavajoManager;
import com.jun.vo.ReplyVo;

@Repository
public class ReplyDao {
	
	public int insertRe(ReplyVo vo) {
		// TODO Auto-generated method stub
		return JavajoManager.insertRe(vo);
	}
	//´ñ±Û¸ñ·Ï
	public List<ReplyVo> listRe(int b_number) {
		// TODO Auto-generated method stub
		return JavajoManager.listRe(b_number);
	}
	
	public int getNextRe() {
		// TODO Auto-generated method stub
		return JavajoManager.getNextRe();
	}
	public int deleteRe(int re_number) {
		// TODO Auto-generated method stub
		return JavajoManager.deleteRe(re_number);
	}
	
	



}
