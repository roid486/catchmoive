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
		System.out.println(path2);
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
			byte[]data2 = file.getBytes();
			FileOutputStream fos2= new FileOutputStream("C:/lastproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/project01/WEB-INF/classes/com/javajo/img/"+fname);
			fos2.write(data2);
			}catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
		}
		int re = dao.inserte(ev);
		if(re==1)
		{
			System.out.println("성공");
			mav.setViewName("redirect:/eventmail.com?e_content="+ev.getE_content()+"&&e_img="+ev.getE_img());
		}
		else
		{
			this.re=1;
			this.msg="입력 정보를 확인하십시오.";
			mav.setViewName("redirect:/inserte.com");
		}
		return mav;
	}
	
}
