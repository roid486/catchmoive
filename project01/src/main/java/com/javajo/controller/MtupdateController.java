
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
import com.javajo.vo.MovieTheaterVo2;

@Controller
@RequestMapping("/mtupdate.com")
public class MtupdateController {

	@Autowired
	private JavajoDao dao;
	private int re;
	private String msg;

	public void setDao(JavajoDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView mtupdate(int mt_number)
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("mtlist", dao.mtlist());
		mav.addObject("mtdetail", dao.mtdetail(mt_number));
		if(re==1)
		{
			mav.addObject("re", re);
			mav.addObject("msg", msg);
		}
		re=0;
		return mav;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView mtupdateok(MovieTheaterVo2 mtv2,HttpServletRequest request,String img)
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("mtlist", dao.mtlist());
		String path = request.getRealPath("resources/mt_img");
		MultipartFile file = mtv2.getFile();
		String fname = "";
		if(file!=null)
		{
			fname=file.getOriginalFilename();
			mtv2.setMt_img(fname);
		}
		else
		{
			mtv2.setMt_img(img);
		}
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
		int re = dao.mtupdate(mtv2);
		if(re==1)
		{
			mav.setViewName("redirect:/mtlist.com");
		}
		else
		{
			this.re=1;
			this.msg="입력 정보를 확인하십시오.";
			mav.setViewName("redirect:/insertmt.com");
		}
		return mav;
	}
}
