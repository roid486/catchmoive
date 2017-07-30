package com.jun.controller;

import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.javajo.dao.JavajoDao;
import com.javajo.vo.CustomerVo;
import com.jun.dao.BoardDao;
import com.jun.vo.BoardVo;

@Controller
@RequestMapping("/insertBoard.com")
public class InsertBoardController {

	@Autowired
	private BoardDao dao;

	public void setDao(BoardDao dao) {
		this.dao = dao;
	}
	
	private JavajoDao dao1;
	
	public void setDao1(JavajoDao dao1) {
		this.dao1 = dao1;
	}

	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView form(@RequestParam(value="b_number",defaultValue="0") int pb_number)
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("head", "게시물 등록");
		
		int b_number= dao.getNextNo();
		
		int b_b_ref= b_number;
		//새글 =글번호
		
		int b_b_level = 0;
		int b_b_step = 0;
		if(pb_number !=0)
		{
			BoardVo b = dao.getBoard(pb_number);
			mav.addObject("head", "답글작성");
			b_b_ref = b.getB_b_ref();
			b_b_level = b.getB_b_level();
			b_b_step = b.getB_b_step();
		}
		
		mav.addObject("b_number",	b_number);
		mav.addObject("b_ref", b_b_ref);
		mav.addObject("b_level", b_b_level);
		mav.addObject("b_step", b_b_step);
		return mav;
	}
	
	
	
	
	
	
	@RequestMapping(value="/insertBoard.com",method=RequestMethod.POST)
	public ModelAndView submit(BoardVo b,HttpServletRequest request,CustomerVo cv,HttpSession session, String c_id)
	{
		
		ModelAndView mav = new ModelAndView();
		String id=(String)session.getAttribute("c_id");
		String re = dao1.loginok(cv);

		mav.setViewName("redirect:login.com");
		if (re == null)
			mav.setViewName("redirect:/login.com");
		else {
			session.setAttribute("c_id", c_id);
		}
		System.out.println("인서트 id:"+id);
		System.out.println("인서트 re:"+re);
		
		b.setB_ip(request.getRemoteAddr());
		String path = request.getRealPath("resources/jun");
		String fname = "";
		byte data[] = new byte[100];
		
		try {
			MultipartFile multi = b.getUploadFile();
			fname = multi.getOriginalFilename();
			
			if(fname !=null && !fname.equals(""))
			{
				data = multi.getBytes();
				FileOutputStream fos = new FileOutputStream(path+"/"+fname);
				fos.write(data);
			}
	
			b.setB_fname(fname);
			b.setB_fsize(data.length);
			System.out.println("fname: "+fname);
			System.out.println("fos: "+path);
			System.out.println("board_title   ::   "+b.toString());
		} catch (Exception e) {
			// TODO: handle exc	``eption
			System.out.println("submit : "+e.getMessage());
		}
		
		//이미 달려있는 답글들의 b_step을 증가시킨다.
		
				/*새글,
					  no = b_ref
				 답글 
				 	no != b_ref
				 */
		if(b.getB_number() != b.getB_b_ref())
		{
			dao.updateStep(b.getB_b_ref(), b.getB_b_step() );		
			b.setB_b_step(b.getB_b_step()+1);
			b.setB_b_level(b.getB_b_level()+1);
		}
		
		
		dao.insert(b);
		
		
		mav.setViewName("redirect:/listBoard.com");
		
		
		return mav;
	}
	
	
}
