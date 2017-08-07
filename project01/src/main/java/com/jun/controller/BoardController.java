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
	private JavajoDao dao1;// �̻��̴ٿ����� �����°ſ���

	public void setDao1(JavajoDao dao1) {
		this.dao1 = dao1;
	}

	@RequestMapping("/listBoard.com")
	public ModelAndView list(String searchField, String keyword, HttpServletRequest request,
			@RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM) {

		HttpSession session = request.getSession();
		// session.setAttribute("customerid2","���ֽ����");

		String se_id = (String) session.getAttribute("se_id");
		System.out.println("se_id     ::   " + se_id);
		String rSearchField = (String) session.getAttribute("searchField");
		String rKeyword = (String) session.getAttribute("keyword");

		// session.setAttribute("customerid","���ֽ����");

		System.out.println("��Ʈ�ѷ� �˻��ʵ�:" + rSearchField);
		System.out.println("��Ʈ�ѷ� �˻���:" + rKeyword);

		if (keyword != null && !keyword.trim().equals("")) {
			rSearchField = searchField;
			rKeyword = keyword;
			session.setAttribute("searchField", rSearchField);
			session.setAttribute("keyword", rKeyword);
		}

		// ������������ ���� ���۷��ڵ��� ��ġ�� ������ ���ڵ��� ��ġ�� ���
		int start, end;

		// ��ü���ڵ��� ���� 24
		// ��ȭ�鿡 ������ ���ڵ��� �� 10
		// ���� �������� 1
		// start = 1 end 10

		// ���� �������� 2
		// start = 11 end 20

		start = (pageNUM - 1) * BoardDao.pageSIZE + 1;
		end = start + BoardDao.pageSIZE - 1;
		
		
		ModelAndView mav = new ModelAndView();

	
		mav.addObject("se_id", se_id);
		mav.addObject("title", "�Խ���");
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
