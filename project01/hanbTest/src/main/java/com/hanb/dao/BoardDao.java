package com.hanb.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hanb.data.BoardManager;
import com.hanb.vo.BoardVo;

@Repository
public class BoardDao {
	
	//한 화면에 보여줄 게시물의 수
	public static int pageSIZE= 3;
	
	//전체 레코드수 
	public static int totalRecord;
	
	//전체 페이지수
	public static int totalPage;
	
	//한 화면에 보여줄 페이지수
	public static int pageGRUOP=3;
	
	

	public int getNextNo()
	{
		return BoardManager.getNextNo();
	}
	
	public int getTotal()
	{
		return BoardManager.getTotal();
	}
	
	public BoardVo getBoard(int no)
	{
		return BoardManager.getBoard(no);
	}
	
	
	public String getPageStr(int pageNUM)
	{
		// 현재 페이지에 따른 시작페이지와 마지막페이지를 계산한다.
		// 한화면에 보여줄 페이지수를 5
		// 현재페이지가 1,2,3,4,5 라면 start = 1, end 5
		// 현재페이지가 6,7,8,9,10 라면 start = 6, end 10
		                             
		//int start = (int) Math.ceil((pageNUM-1) /(double)pageGRUOP)*pageGRUOP+1;		
		//int start = (pageNUM + pageGRUOP-1) / pageGRUOP * pageGRUOP - (pageGRUOP-1);		
		int start = 
		(pageNUM + pageGRUOP-1) / pageGRUOP * pageGRUOP - (pageGRUOP-1);				
		
		int end = start+pageGRUOP-1;
		
		System.out.println("pageNUM:"+pageNUM);
		System.out.println("start:"+start);
		System.out.println("end:"+end);
		
		String str = "";
		
		if( start > pageGRUOP  )
		{
			str = str + "<a href='listBoard.do?pageNUM="+(start-1)+"'>[이전]</a>&nbsp;";
		}
		
		
		for(int i=start; i<= end; i++)
		{
			str = str + "<a href='listBoard.do?pageNUM="+i+"'>"+ i + "</a>&nbsp;";
		}
		
		if( end < totalPage  )
		{
			str = str + "<a href='listBoard.do?pageNUM="+(end+1)+"'>[다음]</a>&nbsp;";
		}
		
		return str;
	}
	
	
	
	public List<BoardVo> list(int start, int end)
	{
		totalRecord= getTotal();
		totalPage = (int)Math.ceil((double)totalRecord/pageSIZE);
		System.out.println("totalRecord:"+ totalRecord);
		System.out.println("totalPage:"+ totalPage);
		return BoardManager.list(start,end);
	}
	
	public int insertBoard(BoardVo b)
	{
		return BoardManager.insertBoard(b);
	}
	
	public int updateHit(int no)
	{
		return BoardManager.updateHit(no);
	}

	public int updateStep(int b_ref, int b_step) {
		// TODO Auto-generated method stub
		return BoardManager.updateStep(b_ref, b_step);
	}
}
