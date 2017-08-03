package com.jun.controller;

import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.jun.dao.NoticeDao;
import com.jun.vo.NoticeVo;

@Controller
@RequestMapping("insertNotice.com")
public class InsertNoticeController {

	@Autowired
	private NoticeDao dao;

	public void setDao(NoticeDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView form(@RequestParam(value="nb_number",defaultValue="0") int pno)
	{	
		ModelAndView mav = new ModelAndView();
		int nb_number = dao.getNextNb();
		mav.addObject("nb_number", nb_number);
		
		
		
		return mav;
	}
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView submit(NoticeVo n, HttpServletRequest request)
	{
		
		String path = request.getRealPath("resources/noticejun");
		String nb_fname = "";
		byte data[] = new byte[100];;
		try{
			MultipartFile multi  = n.getUploadFile();
			nb_fname = multi.getOriginalFilename();
			
			if(nb_fname != null && !nb_fname.equals(""))
			{
				data = multi.getBytes();				
				FileOutputStream fos = new FileOutputStream(path + "/"+ nb_fname);
				fos.write(data);				
			}
			n.setNb_fname(nb_fname);
			n.setNb_fsize(data.length);
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	
		ModelAndView mav = new ModelAndView("redirect:/listNotice.com");
		dao.insertNb(n);
		
		
		
		return mav;
	}	
}
