package com.javajo.controller;

import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.javajo.dao.JavajoDao;
import com.javajo.vo.CustomerVo;
import com.javajo.vo.EventVo;
import com.javajo.vo.MovieTheaterVo2;

@Controller
@RequestMapping("/inserte.com")
public class InserteController {

	@Autowired
	private JavajoDao dao;

	private int re;
	private String msg;
	
	public void setDao(JavajoDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView inserte()
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("mtlist", dao.mtlist());
		if(re==1)
		{
			mav.addObject("re", re);
			mav.addObject("msg", msg);
		}
		re=0;
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView inserteok(EventVo ev,HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("mtlist", dao.mtlist());
		String path = request.getRealPath("resources/eventimg");
		String path2 = request.getRealPath("com/javajo/img");
		MultipartFile file = ev.getFile();
		String fname = "";
		if(file!=null)
		{
			fname=file.getOriginalFilename();
		}
		ev.setE_img(fname);
		if(!fname.equals(""))
		{
			try{
			byte[]data = file.getBytes();
			FileOutputStream fos= new FileOutputStream(path +"/" +fname);
					fos.write(data);
			}catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
		}
		int re = dao.inserte(ev);
		if(re==1)
		{
			System.out.println("����");
			mav.setViewName("redirect:/eventmail.com?e_content="+ev.getE_content());
		}
		else
		{
			this.re=1;
			this.msg="�Է� ������ Ȯ���Ͻʽÿ�.";
			mav.setViewName("redirect:/inserte.com");
		}
		return mav;
	}
	
}
