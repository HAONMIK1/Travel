package main.model;

public class CartBean {
	private String cate;
	private String num;
	private String xpos;
	private String ypos;
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public Double getXpos() {
		return Double.valueOf(xpos);
	}
	public void setXpos(String xpos) {
		this.xpos = xpos;
	}
	public Double getYpos() {
		return Double.valueOf(ypos);
	}
	public void setYpos(String ypos) {
		this.ypos = ypos;
	}
}
