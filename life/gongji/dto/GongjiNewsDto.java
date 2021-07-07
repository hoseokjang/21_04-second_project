package kr.co.life.gongji.dto;

public class GongjiNewsDto {
	private int id;
	private String title,link,pubdate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getPubdate() {
		return pubdate;
	}
	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}
}
