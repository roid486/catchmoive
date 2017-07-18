package com.jun.controller;

import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView form()
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("head", "게시물 등록");
		
		int b_number= dao.getNextNo();
		mav.addObject("b_number",	b_number);
		return mav;
	}
	
	@RequestMapping(value="/insertBoard.com",method=RequestMethod.POST)
	public ModelAndView submit(BoardVo b,HttpServletRequest request)
	{
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
		
		dao.insert(b);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:/listBoard.com");
		
		
		return mav;
	}
	
	
}
