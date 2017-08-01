package com.javajo.controller;

import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.javajo.dao.JavajoDao;
import com.javajo.vo.EventVo;
import com.javajo.vo.RunningVo;

@Controller
@RequestMapping("/eupdate.com")
public class EupdateController {

	@Autowired
	private JavajoDao dao;

	public void setDao(JavajoDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView mtupdate(int e_number)
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("mtlist", dao.mtlist());
		mav.addObject("edetail", dao.edetail(e_number));
		return mav;
		
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView mtupdateok(EventVo ev,String fname,HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("mtlist", dao.mtlist());
		String path = request.getRealPath("resources/eventimg");
		MultipartFile file = ev.getFile();
		String fname2 = "";
		ev.setE_img(fname);
		if(file.getOriginalFilename()!=null && !file.getOriginalFilename().equals(""))
		{
			fname2=file.getOriginalFilename();
			ev.setE_img(fname2);
		}
		if(!fname2.equals(""))
		{
			try{
			byte[]data = file.getBytes();
			FileOutputStream fos= new FileOutputStream(path +"/" +fname2);
					fos.write(data);
			}catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
		}
		int re = dao.eupdate(ev);
		if(re==1)
		{
			mav.setViewName("redirect:/elist.com");
		}
		else
		{
			mav.setViewName("redirect:/inserte.com");
		}
		return mav;
	}
}
