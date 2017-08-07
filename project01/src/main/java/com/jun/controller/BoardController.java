package com.jun.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.javajo.dao.JavajoDao;
import com.javajo.vo.CustomerVo;
import com.jun.dao.BoardDao;
import com.jun.dao.NoticeDao;
import com.jun.vo.BoardVo;

@Controller
public class BoardController {

	@Autowired
	private BoardDao dao;

	public void setDao(BoardDao dao) {
		this.dao = dao;
	}

	@Autowired
	private JavajoDao dao1;// 이삭이다오에서 가져온거에요

	public void setDao1(JavajoDao dao1) {
		this.dao1 = dao1;
	}

	@RequestMapping("/listBoard.com")
	public ModelAndView list(String searchField, String keyword, HttpServletRequest request,
			@RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM) {

		HttpSession session = request.getSession();
		// session.setAttribute("customerid2","비누주스라우");

		String se_id = (String) session.getAttribute("se_id");
		System.out.println("se_id     ::   " + se_id);
		String rSearchField = (String) session.getAttribute("searchField");
		String rKeyword = (String) session.getAttribute("keyword");

		// session.setAttribute("customerid","비누주스라우");

		System.out.println("컨트롤러 검색필드:" + rSearchField);
		System.out.println("컨트롤러 검색어:" + rKeyword);

		if (keyword != null && !keyword.trim().equals("")) {
			rSearchField = searchField;
			rKeyword = keyword;
			session.setAttribute("searchField", rSearchField);
			session.setAttribute("keyword", rKeyword);
		}

		// 현재페이지에 따른 시작레코드의 위치와 마지막 레코드의 위치를 계산
		int start, end;

		// 전체레코드의 수가 24
		// 한화면에 보여줄 레코드의 수 10
		// 현재 페이지가 1
		// start = 1 end 10

		// 현재 페이지가 2
		// start = 11 end 20

		start = (pageNUM - 1) * BoardDao.pageSIZE + 1;
		end = start + BoardDao.pageSIZE - 1;
		
		
		ModelAndView mav = new ModelAndView();

	
		mav.addObject("se_id", se_id);
		mav.addObject("title", "게시판");
		mav.addObject("list", dao.list(start,end,rSearchField, rKeyword));
		mav.addObject("pageStr", dao.getPageStr(pageNUM, rSearchField,rKeyword));
		System.out.println("pageNUM :::::::::::fffffffff"+pageNUM);
		return mav;
	}

	@RequestMapping("/detailBoard.com")
	public ModelAndView getBoard(int b_number) {
		ModelAndView mav = new ModelAndView();
		dao.updateHit(b_number);
		mav.addObject("b", dao.getBoard(b_number));

		return mav;
	}

	@RequestMapping("/deleteBoard.com")
	public ModelAndView delete(int b_number) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("b", dao.delete(b_number));

		dao.delete(b_number);
		mav.setViewName("redirect:/listBoard.com");
		return mav;
	}

}
