package kr.co.life.hfood.dto;

public class HfoodDto {

	private int id,lprice,ctg,readnum;
	private double jumsu;
	public int getReadnum() {
		return readnum;
	}
	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}
	private String name,productid,link,category,material,ctgname;
	public int getId() {
		return id;
	}
	public String getCtgname() {
		return ctgname;
	}
	public void setCtgname(String ctgname) {
		this.ctgname = ctgname;
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
	public void setId(int id) {
		this.id = id;
	}
	public int getLprice() {
		return lprice;
	}
	public void setLprice(int lprice) {
		this.lprice = lprice;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProductid() {
		return productid;
	}
	public void setProductid(String productid) {
		this.productid = productid;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public double getJumsu() {
		return jumsu;
	}
	public void setJumsu(double jumsu) {
		this.jumsu = jumsu;
	}
	
}
