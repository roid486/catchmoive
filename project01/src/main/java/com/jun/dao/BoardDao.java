package com.jun.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jun.data.JavajoManager;
import com.jun.vo.BoardVo;

@Repository
public class BoardDao {

	public List<BoardVo> list()
	{
		return JavajoManager.list();
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
}
