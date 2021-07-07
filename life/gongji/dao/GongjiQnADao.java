package kr.co.life.gongji.dao;

import java.util.ArrayList;

import kr.co.life.gongji.dto.GongjiQnADto;

public interface GongjiQnADao {
	public ArrayList<GongjiQnADto> list();
	public GongjiQnADto qna_update(String id);
	public void qna_update_ok(GongjiQnADto gqdto);
	public void qna_delete(int id);
}
