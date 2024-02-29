package restaurant.model;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class RestaurantBean {
   private int rnum;      // 음식점 고유번호

   @NotBlank(message = "이름을 입력하세요.")
   private String name;   // 음식점 이름

   @NotBlank(message = "위도를 입력하세요.")
   private String xpos;   // 위도

   @NotBlank(message = "경도를 입력하세요.")
   private String ypos;   // 경도

   @NotBlank(message = "장소를 입력하세요.")
   private String address;// 장소(경기도 ㅇㅇ시)

   @NotEmpty(message = "이미지를 선택하세요.")
   private String image;   // 상품 이미지
   
   @NotEmpty(message = "이미지를 선택하세요.")
   private String image2;
   
   @NotEmpty(message = "이미지를 선택하세요.")
   private String image3;
   
   @NotEmpty(message = "이미지를 선택하세요.")   
   private String image4;
   
   @NotEmpty(message = "이미지를 선택하세요.")
   private String image5;

   @NotBlank(message = "연락처를 선택하세요.")
   private String rtel1;   // 연락처 시작

   @NotBlank(message = "연락처를 입력하세요.")
   private String rtel2;   // 연락처 중간

   @NotBlank(message = "연락처를 입력하세요.")
   private String rtel3;   // 연락처 끝

   @NotBlank(message = "영업시작시간을 선택하세요.")
   private String rtime1;   // 영업 시작 시간

   @NotBlank(message = "영업종료시간을 선택하세요.")
   private String rtime2;   // 영업 종료 시간

   @NotBlank(message = "개업일자를 선택하세요.")
   private String rdate;   // 음식점 개업일자

   @NotBlank(message = "내용을 입력하세요.")
   private String rcontent;   // 음식점 이름

   private MultipartFile imgUpload;
   private MultipartFile imgUpload2;
   private MultipartFile imgUpload3;
   private MultipartFile imgUpload4;
   private MultipartFile imgUpload5;
   
   private String imgdel;
   private String imgdel2;
   private String imgdel3;
   private String imgdel4;
   private String imgdel5;

   public int getRnum() {
      return rnum;
   }
   public void setRnum(int rnum) {
      this.rnum = rnum;
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
   public String getRtel1() {
      return rtel1;
   }
   public void setRtel1(String rtel1) {
      this.rtel1 = rtel1;
   }
   public String getRtel2() {
      return rtel2;
   }
   public void setRtel2(String rtel2) {
      this.rtel2 = rtel2;
   }
   public String getRtel3() {
      return rtel3;
   }
   public void setRtel3(String rtel3) {
      this.rtel3 = rtel3;
   }
   public String getRtime1() {
      return rtime1;
   }
   public void setRtime1(String rtime1) {
      this.rtime1 = rtime1;
   }
   public String getRtime2() {
      return rtime2;
   }
   public void setRtime2(String rtime2) {
      this.rtime2 = rtime2;
   }
   public String getRdate() {
      return rdate;
   }
   public void setRdate(String rdate) {
      this.rdate = rdate;
   }
   public String getRcontent() {
      return rcontent;
   }
   public void setRcontent(String rcontent) {
      this.rcontent = rcontent;
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
   public MultipartFile getImgUpload2() {
      return imgUpload2;
   }
   public void setImgUpload2(MultipartFile imgUpload2) {
      this.imgUpload2 = imgUpload2;
      if(this.imgUpload2 != null) {
         image2 = imgUpload2.getOriginalFilename();
      }
   }
   public MultipartFile getImgUpload3() {
      return imgUpload3;
   }
   public void setImgUpload3(MultipartFile imgUpload3) {
      this.imgUpload3 = imgUpload3;
      if(this.imgUpload3 != null) {
         image3 = imgUpload3.getOriginalFilename();
      }
   }
   public MultipartFile getImgUpload4() {
      return imgUpload4;
   }
   public void setImgUpload4(MultipartFile imgUpload4) {
      this.imgUpload4 = imgUpload4;
      if(this.imgUpload4 != null) {
         image4 = imgUpload4.getOriginalFilename();
      }
   }
   public MultipartFile getImgUpload5() {
      return imgUpload5;
   }

   public void setImgUpload5(MultipartFile imgUpload5) {
      this.imgUpload5 = imgUpload5;
      if(this.imgUpload5 != null) {
         image5 = imgUpload5.getOriginalFilename();
      }
   }
   public String getImgdel() {
      return imgdel;
   }
   public void setImgdel(String imgdel) {
      this.imgdel = imgdel;
   }
   public String getImgdel2() {
      return imgdel2;
   }
   public void setImgdel2(String imgdel2) {
      this.imgdel2 = imgdel2;
   }
   public String getImgdel3() {
      return imgdel3;
   }
   public void setImgdel3(String imgdel3) {
      this.imgdel3 = imgdel3;
   }
   public String getImgdel4() {
      return imgdel4;
   }
   public void setImgdel4(String imgdel4) {
      this.imgdel4 = imgdel4;
   }
   public String getImgdel5() {
      return imgdel5;
   }
   public void setImgdel5(String imgdel5) {
      this.imgdel5 = imgdel5;
   }
   
}