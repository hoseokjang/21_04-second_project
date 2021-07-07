package kr.co.life.recipe.dao;

import kr.co.life.recipe.dto.MRReviewDto;

public interface MRReviewDao {
	public void write_ok(MRReviewDto mrrdto);
	public void delete(int id);
	public MRReviewDto update(int id);
	public void update_ok(MRReviewDto mrrdto);
	public void setRating(int mr_id);
}
