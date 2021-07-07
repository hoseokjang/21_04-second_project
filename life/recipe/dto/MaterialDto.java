package kr.co.life.recipe.dto;

public class MaterialDto {
	private int mid, ctg;
	private String material, effect;
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getCtg() {
		return ctg;
	}
	public void setCtg(int ctg) {
		this.ctg = ctg;
	}
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	public String getEffect() {
		return effect;
	}
	public void setEffect(String effect) {
		this.effect = effect;
	}
	
}
