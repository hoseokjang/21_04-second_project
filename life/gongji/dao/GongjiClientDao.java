package kr.co.life.gongji.dao;

import java.util.ArrayList;

import kr.co.life.gongji.dto.GongjiClientDto;

public interface GongjiClientDao {
	public ArrayList<GongjiClientDto> list();
	public void insert_ok(GongjiClientDto gdto);
	public GongjiClientDto gongji_client_content(String id);
	public ArrayList<GongjiClientDto> admin_client_list();
	public GongjiClientDto gongji_client_content_update(String id);
	public void gongji_client_content_update_ok(GongjiClientDto gcdto);
	public void gongji_client_content_update_ok_admin(String reply, String reply_text, Integer id);
	public void gongji_client_content_delete(int id);
}
