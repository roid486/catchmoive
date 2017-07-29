package com.jun.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

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
	
	public int getNextNo()
	{
		return JavajoManager.getNextNo();
	}



}
