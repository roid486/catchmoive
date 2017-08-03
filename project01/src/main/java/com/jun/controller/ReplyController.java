package com.jun.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jun.dao.BoardDao;
import com.jun.dao.ReplyDao;
import com.jun.vo.BoardVo;
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
	//��� �󼼺���
	@RequestMapping("detailReply.com")
    public ModelAndView getReply(int re_number, ModelAndView mav){
        ReplyVo r = dao.getReply(re_number);
        // ���̸� ����
        mav.setViewName("detailReply");
        // �信 ������ ������ ����
        mav.addObject("r", r);
        // replyDetail.jsp�� ������
        return mav;
    }
	//��ۼ���
	@RequestMapping(value="updateReply.com",method=RequestMethod.POST)
	public ModelAndView submit(ReplyVo r, HttpServletRequest request)
	{
		
		ModelAndView mav = new ModelAndView();
		int re = dao.updateRe(r);
	
		mav.setViewName("listReply.com");
		return mav;
	}

	
	
	
    // ��� ����ó��
    @RequestMapping("deleteReply.com")
    public ModelAndView delete(int re_number)
    {
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("r", dao.deleteRe(re_number));
    	
    	dao.deleteRe(re_number);
    	mav.setViewName("listReply");
    	return mav;
    }
	
	
	
	@RequestMapping("insertReply.com")
	public void insert(@ModelAttribute ReplyVo vo, HttpSession session){
		
		//ModelAndView mav = new ModelAndView();
		String se_id= (String)session.getAttribute("se_id");
		int re_number= dao.getNextRe();
		vo.setRe_number(re_number);
		vo.setC_id(se_id);
		dao.insertRe(vo);
		//mav.setViewName("detailBoard");
		

	}

	@RequestMapping("listReply.com")
	public ModelAndView list(@RequestParam int b_number, HttpSession session){
//		HttpSession session = request.getSession();
//		session.setAttribute("customerid2","���ֽ����");
		
//		String se_id=(String)session.getAttribute("se_id");
		ModelAndView mav = new ModelAndView();
		String se_id = (String) session.getAttribute("se_id");
		List<ReplyVo> items = dao.listRe(b_number);
        for(ReplyVo vo : items){
        	System.out.println("vo    ::"+vo);
        	System.out.println("items   ::"+items);
        	System.out.println("getRe_secretreply   ::"+vo.getRe_secretreply());
        	
            // ��� ����߿� �߿� ��� ����� ���� ���
            if(vo.getRe_secretreply()==null){
                if(se_id== null){ // ��α��� ���¸� ��� ��۷� ó��
                    vo.setRe_content("��� ����Դϴ�.");
                } else { // �α��� ������ ���
                    //String writer = vo.getWriter(); // �Խù� �ۼ��� ����
                    String replyer = vo.getC_id(); // ��� �ۼ��� ����
                    // �α����� ����ڰ� �Խù��� �ۼ���X ��� �ۼ��ڵ� X ��д�۷� ó��
                    	if(/*!se_id.equals(writer) &&*/ !se_id.equals(replyer)) {
                        vo.setRe_content("��� ����Դϴ�.");
                    }
                }
            }
        }
		
		List<ReplyVo> listRe = dao.listRe(b_number);
        // ���̸� ����
        mav.setViewName("listReply");
        // �信 ������ ������ ����
        mav.addObject("listRe", items);
        
        // replyList.jsp�� ������
        return mav;
    }
	


	
}
