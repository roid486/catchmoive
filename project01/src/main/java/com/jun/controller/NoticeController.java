package com.jun.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jun.dao.NoticeDao;

@Controller
public class NoticeController {

	@Autowired
	private NoticeDao dao;

	public void setDao(NoticeDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/listNotice.com")
	public ModelAndView list(String orderField,  String searchField, String keyword,  HttpServletRequest request, 
				@RequestParam(value="pageNUM",defaultValue="1") int pageNUM)
	
	{
		
		System.out.println("controller의 orderField:"+orderField);
		HttpSession session= request.getSession();
		String se_id=(String)session.getAttribute("se_id");
		System.out.println("se_id     ::   "+se_id);
		
		String pSearchField = (String) session.getAttribute("searchField");
		String pKeyword = (String) session.getAttribute("keyword");
		String pOrderField = (String) session.getAttribute("orderField");
		
		System.out.println("검색필드:"+pSearchField);
		System.out.println("검색어:"+pKeyword);
		System.out.println("orderField:"+pOrderField);
		
		
		if(keyword != null && !keyword.trim().equals(""))
		{
			pSearchField = searchField;
			pKeyword = keyword;
			session.setAttribute("searchField", pSearchField);
			session.setAttribute("keyword", pKeyword);
		}
		
		if(orderField != null)
		{
			pOrderField = orderField;			
			session.setAttribute("orderField", pOrderField);			
		}
		//현재페이지에 따른 시작레코드의 위치와 마지막 레코드의 위치를 계산
		int start, end;
		
		//전체레코드의 수가 24
		//한화면에 보여줄 레코드의 수 10
		//현재 페이지가 1
		//start = 1			end 10
		
		//현재 페이지가 2
		//start = 11		end 20
		
		start = (pageNUM-1) * NoticeDao.pageSIZE + 1;
		end = start+ NoticeDao.pageSIZE-1;		 
				
		String path = request.getRealPath("resources/noticejun");
		System.out.println("path:"+path);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.listNb(start, end,pSearchField,pKeyword, pOrderField));
		mav.addObject("pageStr", dao.getPageStrNb(pageNUM, pSearchField,pKeyword,pOrderField));
			
		return mav;
	}
	
	@RequestMapping("/detailNotice.com")
	public ModelAndView getBoard(int nb_number)
	{			
		ModelAndView mav = new ModelAndView();
		dao.noticeHit(nb_number);
		mav.addObject("n", dao.getNotice(nb_number));
		return mav;
	}

	@RequestMapping("/deleteNotice.com")
	public ModelAndView delete(int nb_number)
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("n", dao.deleteNb(nb_number));
		
		dao.deleteNb(nb_number);
		mav.setViewName("redirect:/listNotice.com");
		return mav;
	}
}
