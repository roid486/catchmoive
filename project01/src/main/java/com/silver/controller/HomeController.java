package com.silver.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.silver.dao.BookDao;
import com.silver.dao.TicketDao;
import com.silver.vo.MovieVo;
import com.silver.vo.MovietheatersubVo;
import com.silver.vo.RunningVo;
import com.silver.vo.RunningstartVo;
import com.silver.vo.SeatVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	TicketDao tdao;
	BookDao bdao;
	List<SeatVo> list1 =null;

	@Autowired
	public void setTdao(TicketDao tdao) {
		this.tdao = tdao;
	}

	@Autowired
	public void setBdao(BookDao bdao) {
		this.bdao = bdao;
	}

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Scheduled(cron="0 44 12 * * *")
	public void historyscedule()
	{//historyÅ×ÀÌºí insert
		tdao.historyinsert();
	}
	
	@RequestMapping("/fancy_main.com")
	public ModelAndView test() {
		ModelAndView mav = new ModelAndView();

		return mav;
	}

	@RequestMapping("/fancy_sub1.com")
	public ModelAndView test2() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("title", "fancy_sub1 page");

		return mav;
	}

	@RequestMapping("/fancy_sub2.com")
	public ModelAndView test3(String movie_number,String movietheater_number,String running_date,String running_start,String theater_number,String running_number) {
		list1 = tdao.theaterSeat(theater_number,movietheater_number);
		ModelAndView mav = new ModelAndView();
		String movietheater_name = tdao.getmovietheatername(movietheater_number);
		String movie_name = tdao.getmoviename(movie_number);
		System.out.println(movie_name);
		mav.addObject("movietheater_number", movietheater_number);
		mav.addObject("theater_number", theater_number);
		mav.addObject("running_start", running_start);
		mav.addObject("running_date", running_date);
		mav.addObject("running_number", running_number);
		mav.addObject("movie_number", movie_number);
		mav.addObject("movietheater_name", movietheater_name);
		mav.addObject("seat_num", tdao.seatNum(Integer.parseInt(theater_number)));
		mav.addObject("movie_name", movie_name);
		
		return mav;
	}
	
	@RequestMapping(value="/theaterseat.com", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String theaterseat(String movie_number,String movietheater_number,String running_date,String running_start,String theater_number) {
		String str = "";

		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list1);
		} catch (Exception e) {
			System.out.println("first() mapper   ::    " + e.getMessage());
		}
		System.out.println("///////////test3 list" + str);
		return str;
	}
	
	@RequestMapping(value="/ticketingok.com", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String ticketok(HttpServletRequest req,String m_number,String mt_number,String r_number,String t_number,String ticket_peoplenum,String ticket_price,String str){
		String chk ="";
		int num = 0;
		String arr[] = str.split(",");
		//seat table seat_row, seat_column, ticket_number, t_number,mt_number, running_number
		int ticket_number = tdao.getTicketnum();
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		map1.put("ticket_number",ticket_number);
		map1.put("ticket_peoplenum", arr.length);
		map1.put("m_number",m_number);
		map1.put("mt_number",mt_number);
		map1.put("t_number", t_number);
		HttpSession session =req.getSession();
		String id = (String) session.getAttribute("se_id");
		map1.put("c_id", id);
		map1.put("r_number", r_number);
		map1.put("ticket_price", ticket_price);

		if(tdao.insertticket(map1)==1)
		{
			HashMap<String, Object> map2 = new HashMap<String, Object>();
			map2.put("ticket_number", ticket_number);
			map2.put("t_number", t_number);
			map2.put("mt_number", mt_number);
			map2.put("r_number", r_number);
			
			num = tdao.insertseat(map2,arr);
			
		}
		
		if(arr.length==num)
		{
			System.out.println("success");
			chk = "ok";
		}else
		{
			chk = "no";
		}
		return chk;
		
	}
	@RequestMapping(value = "firstList.com", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String firstList() {
		String str = "";

		List<MovieVo> list = bdao.firstList();
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list);
		} catch (Exception e) {
			System.out.println("first() mapper   ::    " + e.getMessage());
		}
		return str;
	}

	@RequestMapping(value = "secondList.com", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String secondList(String movie_number) {
		String str = "";
		List<MovietheatersubVo> list = bdao.secondList(movie_number);
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list);
		} catch (Exception e) {
			System.out.println("second() mapper   ::    " + e.getMessage());
		}
		
		return str;
	}
	
	@RequestMapping(value = "thirdList.com", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String thirdList(String movie_number, String movietheater_number) {
		String str = "";
		List<RunningVo> list = bdao.thirdList(movie_number,movietheater_number);
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list);
		} catch (Exception e) {
			System.out.println("third() mapper   ::    " + e.getMessage());
		}
		
		return str;
	}
	@RequestMapping(value = "fourthList.com", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String fourthList(String movie_number, String movietheater_number, String running_date) {
		String str = "";
		List<RunningstartVo> list = bdao.fourthList(movie_number,movietheater_number,running_date);
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list);
		} catch (Exception e) {
			System.out.println("fourth() mapper   ::    " + e.getMessage());
		}
		
		return str;
	}

}
