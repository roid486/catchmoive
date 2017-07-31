package com.jun.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import com.jun.data.JavajoManager;
import com.jun.vo.BoardVo;

@Repository
public class BoardDao {

	public List<BoardVo> list(String searchField, String keyword)
	{
		return JavajoManager.list(searchField,keyword);
	}

	public int insert(BoardVo b) {
		// TODO Auto-generated method stub
		return JavajoManager.insert(b);
	}
	
	public int getNextNo()
	{
		return JavajoManager.getNextNo();
	}

	public BoardVo getBoard(int b_number) {
		// TODO Auto-generated method stub
		return JavajoManager.getBoard(b_number);
	}

	public int update(BoardVo b) {
		// TODO Auto-generated method stub
		return JavajoManager.update(b);
	}

	public int delete(int b_number) {
		// TODO Auto-generated method stub
		return JavajoManager.delete(b_number);
	}
	
	public int updateHit(int b_number)
	{
		return JavajoManager.updateHit(b_number);
	}

	public int updateStep(int b_b_ref, int b_b_step) {
		// TODO Auto-generated method stub
		return JavajoManager.updateStep(b_b_ref,b_b_step);
	}


	
}
