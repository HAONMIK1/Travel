package board.model;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

import myjourney.model.MyJourneyBean;

public class BoardBean {
	private int num;
	private String writer;
	  @NotBlank(message = "제목을 입력하세요.")
	private String title;
	private String reg_date;
	private int readcount;
	@NotBlank(message = "내용을 입력하세요.")	
	private String content;
	private String ip;
 @NotBlank(message = "이미지를 선택하세요.")
	private String image;
	private String mEmail;
	private String jnum;
	private String minDate;
	private String maxDate;
	private int likes;

	private MultipartFile imgUpload;
	
	private String imgdel;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public MultipartFile getImgUpload() {
		return imgUpload;
	}
	public void setImgUpload(MultipartFile imgUpload) {
		this.imgUpload = imgUpload;
		if(this.imgUpload != null) {
			image = imgUpload.getOriginalFilename();
		}
	}
	public String getImgdel() {
		return imgdel;
	}
	public void setImgdel(String imgdel) {
		this.imgdel = imgdel;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public String getJnum() {
		return jnum;
	}
	public void setJnum(String jnum) {
		this.jnum = jnum;
	}
	public String getMinDate() {
		return minDate;
	}
	public void setMinDate(String minDate) {
		this.minDate = minDate;
	}
	public String getMaxDate() {
		return maxDate;
	}
	public void setMaxDate(String maxDate) {
		this.maxDate = maxDate;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
}
