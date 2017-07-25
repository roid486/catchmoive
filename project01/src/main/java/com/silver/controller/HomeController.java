package com.silver.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
		//running_start, movietheater_name, theater_number, runnning_date
		System.out.println(running_start+"//"+ movietheater_name+"//"+  theater_number+"//"+  running_date);
		mav.addObject("movietheater_number", movietheater_number);
		mav.addObject("theater_number", theater_number);
		mav.addObject("running_start", running_start);
		mav.addObject("running_date", running_date);
		mav.addObject("running_number", running_number);
		mav.addObject("movie_number", movie_number);
		mav.addObject("movietheater_name", movietheater_name);
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
	public String ticketok(String m_number,String mt_number,String r_number,String t_number,String ticket_peoplenum,String ticket_price,String str){
		String chk ="";
		String arr[] = str.split(",");
		for(int i=0; i < arr.length; i++)
		{
			System.out.println("/"+arr[i]);
		}
		System.out.println("m_number"+m_number+"//mt_number"+mt_number+"//r_number"+r_number+"//t_number"+t_number+"//ticket_peoplenum"+arr.length+"//ticket_price"+ticket_price+"//str"+str);
		
		
		
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
		System.out.println("movie_number "+movie_number+"movietheater_number"+movietheater_number);
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
		System.out.println("movie_number "+movie_number+"movietheater_number"+movietheater_number+"running_date"+running_date);
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
