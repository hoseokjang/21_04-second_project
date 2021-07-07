package kr.co.life.member.dto;

public class MemberDto {
   private int id,age,sex,year,mstate;
   private String nickname,email,userid,pw,pwd,disease,concern,route,regdate;
   
   
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getAge() {
	return age;
}
public void setAge(int age) {
	this.age = age;
}

public String getUserid() {
	return userid;
}
public void setUserid(String userid) {
	this.userid = userid;
}
public String getPw() {
	return pw;
}
public void setPw(String pw) {
	this.pw = pw;
}
public String getPwd() {
	return pwd;
}
public void setPwd(String pwd) {
	this.pwd = pwd;
}
public int getSex() {
	return sex;
}
public void setSex(int sex) {
	this.sex = sex;
}


public int getYear() {
	return year;
}
public void setYear(int year) {
	this.year = year;
}
public String getNickname() {
	return nickname;
}
public void setNickname(String nickname) {
	this.nickname = nickname;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getDisease() {
	return disease;
}
public void setDisease(String disease) {
	this.disease = disease;
}
public String getConcern() {
	return concern;
}
public void setConcern(String concern) {
	this.concern = concern;
}
public String getRoute() {
	return route;
}
public void setRoute(String route) {
	this.route = route;
}
public int getMstate() {
	return mstate;
}
public void setMstate(int mstate) {
	this.mstate = mstate;
}
public String getRegdate() {
	return regdate;
}
public void setRegdate(String regdate) {
	this.regdate = regdate;
}




}
