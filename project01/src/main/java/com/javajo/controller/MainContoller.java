package com.javajo.controller;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.javajo.dao.JavajoDao;
import com.javajo.vo.CustomerVo;
import com.javajo.vo.MovieTheaterVo;
import com.javajo.vo.MovieTheaterVo2;
import com.javajo.vo.MovienameVo;
import com.javajo.vo.RunningVo;
import com.javajo.vo.RunningVo2;
import com.javajo.vo.RunningVo3;
import com.javajo.vo.TheaterVo;
import com.jihye.vo.MovieVo_j;

import net.sf.json.JSONArray;

@Controller
public class MainContoller {

	@Autowired
	private JavajoDao dao;
	private String id;
	public static String id2;
	private String msg;
	private int re;
	public static String emsg;
	public static int ere;
	public void setDao(JavajoDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/main.com")
	public ModelAndView main(HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("mtlist", dao.mtlist());
		HttpSession session = request.getSession();
		session.setAttribute("se_id", id);
		mav.addObject("signupnum", re);
		if(emsg!=null)
		{
			mav.addObject("ere", ere);
			mav.addObject("emsg", emsg);
		}
		emsg = null;
		re = 0;
		return mav;
	}
	
	@RequestMapping("/emailok.com")
	public ModelAndView emailok(String email)
	{
		String yes = "yes";
		ModelAndView mav = new ModelAndView();
		int echeck = dao.echeckupdate(email,yes);
		mav.addObject("mtlist", dao.mtlist());
		mav.addObject("loginid", id);
		mav.addObject("signupnum", re);
		if(echeck!=0)
		{		
			mav.addObject("msg", "인증에 성공하였습니다.");
		}
		return mav;
	}

	@RequestMapping("/login.com")
	public ModelAndView login(CustomerVo cv)
	{
		ModelAndView mav = new ModelAndView();
		id = dao.loginok(cv);
		if(id == null)
		{
			re = 2;
		}
		mav.setViewName("redirect:/main.com");
		return mav;
	}
	
	@RequestMapping("/logout.com")
	public ModelAndView logout()
	{
		ModelAndView mav = new ModelAndView();
		id = null;
		mav.setViewName("redirect:/main.com");
		return mav;
	}
	
	@RequestMapping("/terms.com")
	public ModelAndView terms()
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("mtlist", dao.mtlist());
		return mav;
	}

	@RequestMapping("/serchcustok.com")
	public ModelAndView serchcustok()
	{
		ModelAndView mav = new ModelAndView();
		mav.addObject("mtlist", dao.mtlist());
		mav.addObject("serchid", id2);
		mav.addObject("msg", msg);
		mav.addObject("name", SerchcustController.name);
		mav.addObject("email", SerchcustController.email);
		if(SignupController.msg!=null && !SignupController.msg.equals(""))
		{			
			mav.addObject("msg", SignupController.msg);
		}
		SignupController.msg=null;
		return mav;
	}

	@RequestMapping("/serchid.com")
	public ModelAndView serchid(String id)
	{
		ModelAndView mav = new ModelAndView("redirect:/serchcustok.com");
		mav.addObject("mtlist", dao.mtlist());
		int re = dao.serchid(id);
		if(re == 0)
		{
			this.id2 = id;
			msg = "사용 가능한 아이디 입니다.";
		}
		else
		{
			msg = "이미 존재하는 아이디 입니다.";
		}
		return mav;
	}
	
	@RequestMapping("/cdelete.com")
	public ModelAndView cdelete(String c_id)
	{
		ModelAndView mav = new ModelAndView("redirect:/masterpage.com");
		int del = dao.cdelete(c_id);
		return mav;
	}
	
	@RequestMapping("/mtdelete.com")
	public ModelAndView mtdelete(int mt_number)
	{
		ModelAndView mav = new ModelAndView("redirect:/mtlist.com");
		int re = dao.mtdelete(mt_number);
		
		return mav;
	}
	
	@RequestMapping("/tdelete.com")
	public ModelAndView tdelete(int t_number)
	{
		ModelAndView mav = new ModelAndView("redirect:/tlist.com");
		int re2 = dao.sdelete(t_number);
		int re = dao.tdelete(t_number);
		return mav;
	}
	
	@RequestMapping("/rdelete.com")
	public ModelAndView rdelete(int r_number)
	{
		ModelAndView mav = new ModelAndView("redirect:/rlist.com");
		int re2 = dao.rdelete(r_number);
		return mav;
	}
	
	@RequestMapping("/edelete.com")
	public ModelAndView edelete(int e_number)
	{
		ModelAndView mav = new ModelAndView("redirect:/elist.com");
		int re2 = dao.edelete(e_number);
		return mav;
	}
	
	@RequestMapping("/movietheater.com")
	public ModelAndView movietheater(int mt_number)
	{
		ModelAndView mav = new ModelAndView();
		MovieTheaterVo2 mtv2 = dao.mtdetail(mt_number);
		mav.addObject("mtd", mtv2);
		mav.addObject("mtl", dao.mtlist());
		mav.addObject("theaterlist", dao.tsele(mt_number));
		return mav;
	}
	
	@RequestMapping("/eventdetail.com")
	public ModelAndView eventdetail(int e_number)
	{
		ModelAndView mav = new ModelAndView();
		dao.hitupdate(e_number);
		mav.addObject("ede", dao.edetail(e_number));
		return mav;
	}
	
	@RequestMapping(value="/movieselect.com",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String movieselect()
	{
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		List<MovieVo_j> list = dao.msele();
		try{
			str = mapper.writeValueAsString(list);
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
	
	@RequestMapping(value="/mtselect.com",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String mtselect()
	{
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		List<MovieTheaterVo2> list = dao.mtsele();
		try{
			str = mapper.writeValueAsString(list);
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
	
	@RequestMapping(value="/tselect.com",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String tselect(int mt_number)
	{
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		List<TheaterVo> list = dao.tsele(mt_number);
		try{
			str = mapper.writeValueAsString(list);
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
	
	@RequestMapping(value="/mslist.com",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String mslist()
	{
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		List<MovieVo_j> list = dao.mslist();
		try{
			str = mapper.writeValueAsString(list);
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
	
	@RequestMapping(value="/runninglist.com",produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String theaterlist(int t_number)
	{
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		List<RunningVo3> list = dao.runninglist(t_number);
		try{
			str = mapper.writeValueAsString(list);
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
}
