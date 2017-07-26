package com.silver.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.silver.data.TicketManager;
import com.silver.vo.SeatVo;

@Repository
public class TicketDao {

	public int seatNum(int theater_num) {
		// TODO Auto-generated method stub
		return TicketManager.seatNum(theater_num);
	}

	public List<SeatVo> theaterSeat(String theater_number, String movietheater_number) {
		// TODO Auto-generated method stub
		return TicketManager.theaterSeat(theater_number,movietheater_number);
	}

	public String getmovietheatername(String movietheater_number) {
		// TODO Auto-generated method stub
		return TicketManager.getmovietheatername(movietheater_number);
	}

	public int getTicketnum() {

		return TicketManager.getTicketnum();
	}

	public int insertticket(HashMap<String, Object> map) {
		
		return TicketManager.insertticket(map);
	}


}
