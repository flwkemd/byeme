package com.byeme.boardDto;

import java.sql.Timestamp;

public class boardDto {

	private int bId;
	private String bTitle;
	private String userId;
	private String bContent;
	private Timestamp bDate;
	private int bHit;
	private int bGroup;
	private int bStep;
	private int bIndent;
	private int bAvailable;
	
	public boardDto() {
	}

	
	public boardDto(int bId, String bTitle, String userId, String bContent, Timestamp bDate, int bHit, int bGroup,
			int bStep, int bIndent, int bAvailable) {
		super();
		this.bId = bId;
		this.bTitle = bTitle;
		this.userId = userId;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bHit = bHit;
		this.bGroup = bGroup;
		this.bStep = bStep;
		this.bIndent = bIndent;
		this.bAvailable = bAvailable;
	}

	public int getbId() {
		return bId;
	}

	public String getuserId() {
		return userId;
	}

	public String getbTitle() {
		return bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public Timestamp getbDate() {
		return bDate;
	}

	public int getbHit() {
		return bHit;
	}

	public int getbGroup() {
		return bGroup;
	}

	public int getbStep() {
		return bStep;
	}

	public int getbIndent() {
		return bIndent;
	}

	public int getbAvailable() {
		return bAvailable;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public void setuserId(String userId) {
		this.userId = userId;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public void setbDate(Timestamp bDate) {
		this.bDate = bDate;
	}

	public void setbHit(int bHit) {
		this.bHit = bHit;
	}

	public void setbGroup(int bGroup) {
		this.bGroup = bGroup;
	}

	public void setbStep(int bStep) {
		this.bStep = bStep;
	}

	public void setbIndent(int bIndent) {
		this.bIndent = bIndent;
	}

	public void setbAvaliable(int bAvaliable) {
		this.bAvailable = bAvaliable;
	}
	
}
