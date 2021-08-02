package com.koreait.meeting.domain;

import lombok.Data;

@Data
public class Board {
	private int board_id;
	private int profile_id;
	private String title;
	private String content;
	private String regdate;
	private int hit;
}
