package com.silver.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.silver.data.TicketManager;
import com.silver.vo.SeatVo;
import com.silver.vo.TicketCheckVo;
import com.silver.vo.TicketInfo;

@Repository
public class TicketDao {

	public int seatNum(int theater_num) {
		// TODO Auto-generated method stub
		return TicketManager.seatNum(theater_num);
	}

	public List<SeatVo> theaterSeat(String theater_number, String movietheater_number,String running_number) {
		// TODO Auto-generated method stub
		return TicketManager.theaterSeat(theater_number,movietheater_number,running_number);
	}

	public String getmovietheatername(String movietheater_number) {
		// TODO Auto-generated method stub
		return TicketManager.getmovietheatername(movietheater_number);
	}

	public int getTicketnum() {

		return TicketManager.getTicketnum();
	}

	public int insertticket(HashMap<String, Object> map1) {
		
		return TicketManager.insertticket(map1);
	}

	public int insertseat(HashMap<String, Object> map2, String arr[]) {

		return TicketManager.insertseat(map2,arr);
	}

	public String getmoviename(String movie_number) {
		return TicketManager.getmoviename(movie_number);
	}
	public String getpost(String movie_number) {
		return TicketManager.getpost(movie_number);
	}
	public int historyinsert() {
		return TicketManager.inserthistory();
	}

	public TicketCheckVo ticketcheck(int ticket_number) {
		return TicketManager.ticketcheck(ticket_number);
		
	}

	public TicketInfo ticketinfo(int ticket_number) {
		return TicketManager.ticketinfo(ticket_number);
	}

	public Object boxoffice() {
		return TicketManager.boxoffice();
	}


	


}
