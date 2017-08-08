package com.jun.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import com.jun.data.JavajoManager;
import com.jun.vo.BoardVo;

@Repository
public class BoardDao {

	// 한 화면에 보여줄 게시물의 수
	public static int pageSIZE = 10;

	// 전체 레코드수
	public static int totalRecord;

	// 전체 페이지수
	public static int totalPage;

	// 한 화면에 보여줄 페이지수
	public static int pageGRUOP = 5;

	public List<BoardVo> list(int start, int end, String searchField, String keyword) {
		totalRecord = getTotal(searchField, keyword);
		
		totalPage = (int) Math.ceil((double) totalRecord / pageSIZE);
		System.out.println("totalRecord:" + totalRecord);
		System.out.println("totalPage:" + totalPage);
		System.out.println("dao key:"+keyword);
		return JavajoManager.list(start, end, searchField, keyword);
	}

	private int getTotal(String searchField, String keyword) {
		// TODO Auto-generated method stub
		return JavajoManager.getTotal(searchField, keyword);
	}

	public int insert(BoardVo b) {
		// TODO Auto-generated method stub
		return JavajoManager.insert(b);
	}

	public int getNextNo() {
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

	public int updateHit(int b_number) {
		return JavajoManager.updateHit(b_number);
	}

	public int updateStep(int b_b_ref, int b_b_step) {
		// TODO Auto-generated method stub
		return JavajoManager.updateStep(b_b_ref, b_b_step);
	}

	public String getPageStr(int pageNUM, String rSearchField, String rKeyword) {
		// TODO Auto-generated method stub
		// 현재 페이지에 따른 시작페이지와 마지막페이지를 계산한다.
		// 한화면에 보여줄 페이지수를 5
		// 현재페이지가 1,2,3,4,5 라면 start = 1, end 5
		// 현재페이지가 6,7,8,9,10 라면 start = 6, end 10

		// int start = (int) Math.ceil((pageNUM-1)
		// /(double)pageGRUOP)*pageGRUOP+1;
		// int start = (pageNUM + pageGRUOP-1) / pageGRUOP * pageGRUOP -
		// (pageGRUOP-1);
		int start = (pageNUM + pageGRUOP - 1) / pageGRUOP * pageGRUOP - (pageGRUOP - 1);

		int end = start + pageGRUOP - 1;

		if (end > totalPage)
			end = totalPage;

		System.out.println("pageNUM:" + pageNUM);
		System.out.println("start:" + start);
		System.out.println("end:" + end);

		String str = "";

		if (start > pageGRUOP) {
			str = str + "<a href='listBoard.com?pageNUM=" + (start - 1) + "'>[이전]</a>&nbsp;";
		}

		for (int i = start; i <= end; i++) {
			str = str + "<a href='listBoard.com?pageNUM=" + i + "'>" + i + "</a>&nbsp;";
		}

		if (end < totalPage) {
			str = str + "<a href='listBoard.com?pageNUM=" + (end + 1) + "'>[다음]</a>&nbsp;";
		}

		System.out.println("str::::::          "+str);
		return str;
	}

	public List<BoardVo> listBRe(int b_number) {
		// TODO Auto-generated method stub
		return JavajoManager.listBRe(b_number);
	}

}
