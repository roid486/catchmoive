package com.jun.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.javajo.dao.JavajoDao;
import com.javajo.vo.CustomerVo;
import com.jun.dao.BoardDao;
import com.jun.vo.BoardVo;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDao dao;
	
	public void setDao(BoardDao dao) {
		this.dao = dao;
	}
	@Autowired
	private JavajoDao dao1;//�̻��̴ٿ����� �����°ſ���

	public void setDao1(JavajoDao dao1) {
		this.dao1 = dao1;
	}
	

	@RequestMapping("/listBoard.com")
	public ModelAndView list(String searchField, String keyword, HttpServletRequest request)
	{
		
		HttpSession session = request.getSession();
//		String customer_id=(String)session.getAttribute("customer_id");
		String rSearchField=(String) session.getAttribute("searchField");
		String rKeyword=(String) session.getAttribute("keyword");
		session.setAttribute("customerid","���ֽ����");
		System.out.println("��Ʈ�ѷ� �˻��ʵ�:"+rSearchField);
		System.out.println("��Ʈ�ѷ� �˻���:"+rKeyword);
		
		if(keyword != null && !keyword.trim().equals(""))
		{
			rSearchField = searchField;
			rKeyword = keyword;
			session.setAttribute("searchField", rSearchField);
			session.setAttribute("keyword", rKeyword);
		}
	
//		System.out.println("customer id : "+customer_id);//���⼱ ���̶���
		ModelAndView mav = new ModelAndView();
		
//		mav.addObject("customerid", "���´�");
		mav.addObject("title", "�Խ���");
		mav.addObject("list", dao.list(rSearchField,rKeyword));
		
		
		return mav;
	}
	
	
	@RequestMapping("/detailBoard.com")
	public ModelAndView getBoard(int b_number)
	{
		ModelAndView mav = new ModelAndView();
		dao.updateHit(b_number);
		mav.addObject("b", dao.getBoard(b_number));
		
		return mav;
	}
	@RequestMapping("/deleteBoard.com")
	public ModelAndView delete(int b_number)
	{
		ModelAndView mav = new ModelAndView();
		//mav.addObject("b", dao.delete(b_number));
		dao.delete(b_number);
		mav.setViewName("redirect:/listBoard.com");
		return mav;
	}
	
	
	
}
