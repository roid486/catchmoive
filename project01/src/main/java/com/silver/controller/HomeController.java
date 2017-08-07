package com.silver.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
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
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.rcaller.rStuff.RCaller;
import com.github.rcaller.rStuff.RCode;
import com.javajo.dao.JavajoDao;
import com.silver.dao.BookDao;
import com.silver.dao.TicketDao;
import com.silver.vo.MovieVo;
import com.silver.vo.MovietheatersubVo;
import com.silver.vo.RunningVo;
import com.silver.vo.RunningstartVo;
import com.silver.vo.SeatVo;
import com.silver.vo.TicketCheckVo;
import com.silver.vo.TicketInfo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	TicketDao tdao;
	BookDao bdao;
	List<SeatVo> list1 =null;
	
	@Autowired
	private JavajoDao dao;
	
	public void setDao(JavajoDao dao) {
		this.dao = dao;
	}

	@Autowired
	public void setTdao(TicketDao tdao) {
		this.tdao = tdao;
	}

	@Autowired
	public void setBdao(BookDao bdao) {
		this.bdao = bdao;
	}

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Scheduled(cron="0 49 11 * * *")
	public void historyscedule()
	{//history테이블 insert
		tdao.historyinsert();
		tdao.boxoffice();
	}
	
	@RequestMapping("/ticketCheck.com")
	public ModelAndView ticketCheck(int ticket_number, String seat_rc){
		
		ModelAndView mav = new ModelAndView();
		seat_rc = seat_rc.substring(0,seat_rc.length()-1);
	
		TicketCheckVo t = tdao.ticketcheck(ticket_number);
		
		TicketInfo info = tdao.ticketinfo(ticket_number);
		
		mav.addObject("info", info);
		mav.addObject("t", t);
		mav.addObject("seat_rc", seat_rc);
		return mav;
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
		System.out.println("theater_number"+theater_number+"::movietheater_number"+movietheater_number+"::running_number"+running_number);
		list1 = tdao.theaterSeat(theater_number,movietheater_number,running_number);
		ModelAndView mav = new ModelAndView();
		String movietheater_name = tdao.getmovietheatername(movietheater_number);
		String movie_name = tdao.getmoviename(movie_number);
		String movie_image1 = tdao.getpost(movie_number);
	
		mav.addObject("movietheater_number", movietheater_number);
		mav.addObject("theater_number", theater_number);
		mav.addObject("running_start", running_start);
		mav.addObject("running_date", running_date);
		mav.addObject("running_number", running_number);
		mav.addObject("movie_number", movie_number);
		mav.addObject("movietheater_name", movietheater_name);
		mav.addObject("seat_num", tdao.seatNum(Integer.parseInt(theater_number)));
		mav.addObject("movie_name", movie_name);
		System.out.println("movie_image1     ::      "+movie_image1);
		mav.addObject("movie_image1", movie_image1);
		
		
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

		
//			System.out.println(map1.get("ticket_number"));
//			System.out.println(map1.get("ticket_peoplenum"));
//			System.out.println(map1.get("m_number"));
//			System.out.println(map1.get("mt_number"));
//			System.out.println(map1.get("t_number"));
//			System.out.println(map1.get("c_id"));
//			System.out.println(map1.get("r_number"));
//			System.out.println(map1.get("ticket_price"));
			
			
		
		if(tdao.insertticket(map1)==1)
		{
			HashMap<String, Object> map2 = new HashMap<String, Object>();
			map2.put("ticket_number", ticket_number);
			map2.put("t_number", t_number);
			map2.put("mt_number", mt_number);
			map2.put("r_number", r_number);
			
			num = tdao.insertseat(map2,arr);
			
		}
		
		System.out.println("arr.length : "+arr.length +"  num"+ num);
		if(arr.length==num)
		{
			System.out.println("success");
			chk = ticket_number+"";
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

	@RequestMapping(value = "fifthList.com", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String fifthList(String running_start, String running_date, String mt_number) {
		String str = "";
		String list = bdao.fifthList(running_start,running_date,mt_number);
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list);
		} catch (Exception e) {
			System.out.println("fifth() mapper   ::    " + e.getMessage());
		}
		
		return str;
	}
	@RequestMapping("/test_e.com")
	public ModelAndView rview(HttpServletRequest request){
		String fname ="";
		try {
	      RCaller caller= new RCaller();
	      caller.setRscriptExecutable("C:\\Program Files\\R\\R-3.4.1\\bin\\x64\\Rscript.exe");
	      RCode code= new RCode();
	      code.clear();
	      System.out.println("얌마");
	      File file;
	         file= code.startPlot();
	      code.addRCode("library(DBI)");
	         code.addRCode("library(RODBC)");
	         code.addRCode("library(ggplot2)");
	      code.addRCode("javajo=odbcConnect('javajo',uid='javajo',pwd='javajo')");
	         code.addRCode("val=sqlQuery(javajo,'select sum(h_ticket_price) 매출, h_ticket_date 날짜 from history group by h_ticket_date;')");
	   
	         code.addRCode("t1=val$매출");
	         code.addRCode("t2=val$날짜");
	         code.addRCode("season1 <- heat.colors(length(t2), alpha=1)");
	         code.addRCode("season2 <-rainbow(length(t2), s = 1, v = 1, start = 0, end = max(1,8 - 1)/8, alpha = 0.7)");
	         code.addRCode("season3 <-terrain.colors(length(t2), alpha = 1)");
	         code.addRCode("season4 <-topo.colors(length(2), alpha = 1)");
	         code.addRCode("mean.df<-as.data.frame(tapply(t1, t2, mean))");
	         code.addRCode("mean.df$date<-rownames(mean.df)");
	         code.addRCode("names(mean.df)<-c('price', 'date')");
	         code.addRCode("mean.df");
	         code.addRCode("d1=ggplot(mean.df, aes(x=t2,y=t1))+geom_bar(stat='identity',fill='white', colour='red')+xlab('날짜')+ylab('매출')+ggtitle('날짜별 매출')");
	         code.addRCode("d1+theme(plot.title=element_text(size=15,face='bold',color='dark blue'))+theme(axis.text.x=element_text(angle=45, hjust=1))");
	       
	   
	         code.endPlot();
	         caller.setRCode(code);
	         caller.runOnly();
	         
	         fname=file.getName();
	         String path= request.getRealPath("resources/rfile");
	         System.out.println(path);
	         FileOutputStream fos= new FileOutputStream(path+"/"+fname);
	         FileInputStream fis= new FileInputStream(file);
	         
	         FileCopyUtils.copy(fis, fos);
	         
	         fis.close();
	         fos.close();
	         
		} catch (Exception e) {
				System.out.println("r 부분        ::    "+e.getMessage());
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("fname", fname);
		mav.addObject("totalprice", dao.totalprice());
		mav.addObject("mprice", dao.mprice());
		return mav;
	}

}
