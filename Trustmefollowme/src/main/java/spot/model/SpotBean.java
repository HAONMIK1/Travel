package spot.model;

import org.springframework.web.multipart.MultipartFile;

public class SpotBean {
	private int snum;
	private String stime;
	public String getStime() {
		return stime;
	}

	public void setStime(String stime) {
		this.stime = stime;
	}

	private String name;
	private String xpos;
	private String ypos;
	private String address;
	private String content;
	private String image;
	private String image2;
	private String image3;
	private String image4;
	private String image5;
	private String Oimage;
	private String Oimage2;
	private String Oimage3;
	private String Oimage4;
	private String Oimage5;
	private MultipartFile upload; 
	private MultipartFile upload2; 
	private MultipartFile upload3; 
	private MultipartFile upload4; 
	private MultipartFile upload5; 

	
	public MultipartFile getUpload4() {
		return upload4;
	}

	public void setUpload4(MultipartFile upload4) {
		this.upload4 = upload4;
		if(this.upload4 != null) {
			image4 = upload4.getOriginalFilename();
		}
	}

	public MultipartFile getUpload5() {
		return upload5;
	}

	public void setUpload5(MultipartFile upload5) {
		this.upload5 = upload5;
		if(this.upload5 != null) {
			image5 = upload5.getOriginalFilename();
		}
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public MultipartFile getUpload2() {
		return upload2;
	}

	public MultipartFile getUpload3() {
		return upload3;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		if(this.upload != null) {
			image = upload.getOriginalFilename();
		}
	}
	public void setUpload2(MultipartFile upload2) {
		this.upload2 = upload2;
		if(this.upload2 != null) {
			image2 = upload2.getOriginalFilename();
		}
	}
	public void setUpload3(MultipartFile upload3) {
		this.upload3 = upload3;
		if(this.upload3 != null) {
			image3 = upload3.getOriginalFilename();
		}
	}

	public int getSnum() {
		return snum;
	}

	public void setSnum(int snum) {
		this.snum = snum;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getXpos() {
		return xpos;
	}
	public void setXpos(String xpos) {
		this.xpos = xpos;
	}
	public String getYpos() {
		return ypos;
	}
	public void setYpos(String ypos) {
		this.ypos = ypos;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getImage3() {
		return image3;
	}
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	public String getOimage() {
		return Oimage;
	}

	public void setOimage(String oimage) {
		Oimage = oimage;
	}

	public String getOimage2() {
		return Oimage2;
	}

	public void setOimage2(String oimage2) {
		Oimage2 = oimage2;
	}

	public String getOimage3() {
		return Oimage3;
	}

	public void setOimage3(String oimage3) {
		Oimage3 = oimage3;
	}

	public String getOimage4() {
		return Oimage4;
	}

	public void setOimage4(String oimage4) {
		Oimage4 = oimage4;
	}

	public String getImage4() {
		return image4;
	}

	public void setImage4(String image4) {
		this.image4 = image4;
	}

	public String getImage5() {
		return image5;
	}

	public void setImage5(String image5) {
		this.image5 = image5;
	}

	public String getOimage5() {
		return Oimage5;
	}

	public void setOimage5(String oimage5) {
		Oimage5 = oimage5;
	}

	
}
