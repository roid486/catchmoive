package com.hanb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hanb.dao.BoardDao;

@Controller
public class BoardController {

	@Autowired
	private BoardDao dao;
		
	public void setDao(BoardDao dao) {
		this.dao = dao;
	}

	@RequestMapping("/listBoard.do")
	public ModelAndView list(HttpServletRequest request, 
				@RequestParam(value="pageNUM",defaultValue="1") int pageNUM)
	
	{
		//현재페이지에 따른 시작레코드의 위치와 마지막 레코드의 위치를 계산
		int start, end;
		
		//전체레코드의 수가 24
		//한화면에 보여줄 레코드의 수 10
		//현재 페이지가 1
		//start = 1			end 10
		
		//현재 페이지가 2
		//start = 11		end 20
		
		start = (pageNUM-1) * BoardDao.pageSIZE + 1;
		end = start+ BoardDao.pageSIZE-1;		 
				
		
		
		
		String path = request.getRealPath("resources/upload");
		System.out.println("path:"+path);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.list(start, end));
		mav.addObject("pageStr", dao.getPageStr(pageNUM));
			
		
		return mav;
	}
	
	@RequestMapping("/detailBoard.do")
	public ModelAndView getBoard(int no)
	{			
		ModelAndView mav = new ModelAndView();
		dao.updateHit(no);
		mav.addObject("b", dao.getBoard(no));
		return mav;
	}
}








