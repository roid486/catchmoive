package com.jihye.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jihye.dao.MovieDao;
import com.jihye.vo.MovieScoreVo;

@Controller
public class InsertMovieScoreController {

	@Autowired
	private MovieDao dao;

	public void setDao(MovieDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/insertMovieScore.com")
	public ModelAndView submit(MovieScoreVo ms,HttpServletRequest request/*,HttpSession session*/){
		ModelAndView mav = new ModelAndView();
		int re = dao.insertMovieScore(ms);
		
		mav.addObject("m_number",ms.getMs_mid());
		//mav.setViewName("detailMovie.com");
		request.setAttribute("m_number", ms.getMs_mid()); //request�� ������ �ѹ� �Ѿ���� ��ȿ! session�� ������ ���մ� ���� ��ȿ 
		
		if(re==1){
			System.out.println("������ ���� ����!!!");
		}
		else{
			System.out.println("���� ���� �Ф�");
		}
		return mav;
	}
	
}
