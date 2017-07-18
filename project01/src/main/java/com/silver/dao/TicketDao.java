package com.silver.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.silver.data.TicketManager;
import com.silver.vo.MovieVo;
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
	

}
