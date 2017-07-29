package com.jun.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jun.dao.BoardDao;
import com.jun.dao.ReplyDao;
import com.jun.vo.ReplyVo;

@Controller
public class ReplyController {

	@Autowired
	private ReplyDao dao;
	
	public void setDao(ReplyDao dao) {
		this.dao = dao;
	}
	@Autowired
	private BoardDao dao1;
	
	public void setDao1(BoardDao dao1) {
		this.dao1 = dao1;
	}

	@RequestMapping("insertReply.com")
	public void insert(@ModelAttribute ReplyVo vo, HttpSession session){
		String se_id= (String)session.getAttribute("se_id");
		int re_number= dao.getNextRe();
		vo.setC_id(se_id);
		dao.insertRe(vo);
	
	
	}
	
	@RequestMapping("listReply.com")
	public ModelAndView list(@RequestParam int b_number, HttpServletRequest request, ModelAndView mav){
		HttpSession session = request.getSession();
//		session.setAttribute("customerid2","비누주스라우");
		
		String se_id=(String)session.getAttribute("se_id");
		List<ReplyVo> listRe = dao.listRe(b_number);
        System.out.println("listRe의  b_number ::     "+listRe);
        System.out.println("  b_number ::     "+b_number);
        // 뷰이름 지정
        mav.setViewName("listReply");
        // 뷰에 전달할 데이터 지정
        mav.addObject("listRe", listRe);
        // replyList.jsp로 포워딩
        return mav;
    }
	

	
}
