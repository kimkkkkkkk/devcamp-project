package com.koreait.meeting.model.board.repository;

import java.util.List;

import com.koreait.meeting.domain.Board;

public interface BoardDAO {
	public List selectAll();
	public void insert(Board board);
	public Board select(int board_id);
	public void update(Board board);
	public void delete(int board_id);
}
