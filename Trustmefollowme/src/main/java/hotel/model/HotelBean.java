package hotel.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class HotelBean {
   
   private int hnum;
   
   @NotBlank(message = "호텔 이름을 입력하세요.")
   private String name;
   
   @NotBlank(message = "호텔 가격을 입력하세요.")
   private String hprice;
   
   @NotEmpty(message = "호텔이미지를 넣으세요.")
   private String image;
   
   @NotEmpty(message = "룸이미지1을 넣으세요.")
   private String image2;
   
   @NotEmpty(message = "룸이미지2를 넣으세요.")
   private String image3;
   
   @NotEmpty(message = "룸이미지3을 넣으세요.")
   private String image4;
   
   @NotEmpty(message = "룸이미지4를 넣으세요.")
   private String image5;
   
   @NotEmpty(message = "시설이미지를 넣으세요.")
   private String image6;
   
   @NotEmpty(message = "호텔 주소를 입력하세요.")
   private String address;
   
   @NotBlank(message = "전화번호를 입력하세요.")
   private String htel;
   
   @NotNull(message = "부대시설을 선택하세요")
   private String facility;
   
   @NotEmpty(message = "상세내용을 입력하세요.")
   private String hcontent;
   
   @NotEmpty(message = "룸1이름을 입력하세요.")
   private String rname1;
   
   @NotEmpty(message = "룸2이름을 입력하세요.")
   private String rname2;
   
   @NotEmpty(message = "룸3이름을 입력하세요.")
   private String rname3;
   
   @NotEmpty(message = "룸4이름을 입력하세요.")
   private String rname4;
   
   @NotEmpty(message = "룸1가격을 입력하세요.")
   private String rprice1;
   
   @NotEmpty(message = "룸2가격을 입력하세요.")
   private String rprice2;
   
   @NotEmpty(message = "룸3가격을 입력하세요.")
   private String rprice3;
   
   @NotEmpty(message = "룸4가격을 입력하세요.")
   private String rprice4;
   
   @NotEmpty(message = "위도를 입력하세요.")
   private String xpos;
   
   @NotEmpty(message = "경도를 입력하세요.")
   private String ypos;
   
   
   private MultipartFile upload; // 사진 업로드
   private MultipartFile upload2;
   private MultipartFile upload3;
   private MultipartFile upload4;
   private MultipartFile upload5;
   private MultipartFile upload6;

   private String d_image; // 수정 후 지울 사진
   private String d_image2; 
   private String d_image3;
   private String d_image4; 
   private String d_image5; 
   private String d_image6;
   public int getHnum() {
      return hnum;
   }
   public void setHnum(int hnum) {
      this.hnum = hnum;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getHprice() {
      return hprice;
   }
   public void setHprice(String hprice) {
      this.hprice = hprice;
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
   public String getImage6() {
      return image6;
   }
   public void setImage6(String image6) {
      this.image6 = image6;
   }
   public String getAddress() {
      return address;
   }
   public void setAddress(String address) {
      this.address = address;
   }
   public String getHtel() {
      return htel;
   }
   public void setHtel(String htel) {
      this.htel = htel;
   }
   public String getFacility() {
      return facility;
   }
   public void setFacility(String facility) {
      this.facility = facility;
   }
   public String getHcontent() {
      return hcontent;
   }
   public void setHcontent(String hcontent) {
      this.hcontent = hcontent;
   }
   public String getRname1() {
      return rname1;
   }
   public void setRname1(String rname1) {
      this.rname1 = rname1;
   }
   public String getRname2() {
      return rname2;
   }
   public void setRname2(String rname2) {
      this.rname2 = rname2;
   }
   public String getRname3() {
      return rname3;
   }
   public void setRname3(String rname3) {
      this.rname3 = rname3;
   }
   public String getRname4() {
      return rname4;
   }
   public void setRname4(String rname4) {
      this.rname4 = rname4;
   }
   public String getRprice1() {
      return rprice1;
   }
   public void setRprice1(String rprice1) {
      this.rprice1 = rprice1;
   }
   public String getRprice2() {
      return rprice2;
   }
   public void setRprice2(String rprice2) {
      this.rprice2 = rprice2;
   }
   public String getRprice3() {
      return rprice3;
   }
   public void setRprice3(String rprice3) {
      this.rprice3 = rprice3;
   }
   public String getRprice4() {
      return rprice4;
   }
   public void setRprice4(String rprice4) {
      this.rprice4 = rprice4;
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
   public MultipartFile getUpload() {
      return upload;
      
   }
   public void setUpload(MultipartFile upload) {
      this.upload = upload;
      if(this.upload != null) {
         image = upload.getOriginalFilename();
      }
   }
   public MultipartFile getUpload2() {
      return upload2;
   }
   public void setUpload2(MultipartFile upload2) {
      this.upload2 = upload2;
      if(this.upload2 != null) {
         image2 = upload2.getOriginalFilename();
      }
   }
   public MultipartFile getUpload3() {
      return upload3;
   }
   public void setUpload3(MultipartFile upload3) {
      this.upload3 = upload3;
      if(this.upload3 != null) {
         image3 = upload3.getOriginalFilename();
      }
   }
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
   public MultipartFile getUpload6() {
      return upload6;
   }
   public void setUpload6(MultipartFile upload6) {
      this.upload6 = upload6;
      if(this.upload6 != null) {
         image6 = upload6.getOriginalFilename();
      }
   }
   public String getD_image() {
      return d_image;
   }
   public void setD_image(String d_image) {
      this.d_image = d_image;
   }
   public String getD_image2() {
      return d_image2;
   }
   public void setD_image2(String d_image2) {
      this.d_image2 = d_image2;
   }
   public String getD_image3() {
      return d_image3;
   }
   public void setD_image3(String d_image3) {
      this.d_image3 = d_image3;
   }
   public String getD_image4() {
      return d_image4;
   }
   public void setD_image4(String d_image4) {
      this.d_image4 = d_image4;
   }
   public String getD_image5() {
      return d_image5;
   }
   public void setD_image5(String d_image5) {
      this.d_image5 = d_image5;
   }
   public String getD_image6() {
      return d_image6;
   }
   public void setD_image6(String d_image6) {
      this.d_image6 = d_image6;
   } 
   
   
   
   
   
}