package cafe.model;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class CafeBean {
   private int cnum;          // 카페 번호
   
   @NotBlank(message = "카페 이름을 입력하세요.")
   private String name;      // 카페 이름
   
   @NotBlank(message = "카페 위치 위도를 입력하세요.")
   private String xpos;      // 카페 위치 위도
   
   @NotBlank(message = "카페 위치 경도를 입력하세요.")
   private String ypos;      // 카페 위치 경도
   
   @NotBlank(message = "카페 주소를 입력하세요.")
   private String address;   // 카페 주소
   
   @NotBlank(message = "카페 전화 시작번호를 입력하세요.")
   private String ctel1;      // 카페 전화 시작 번호
   
   @NotBlank(message = "카페 전화 중간 번호를 입력하세요.")
   private String ctel2;      // 카페 전화 중간 번호
   
   @NotBlank(message = "카페 전화 끝 번호를 입력하세요.")
   private String ctel3;      // 카페 전화 끝 번호
   
   @NotEmpty(message = "카페 개업 일자를 입력하세요.")
   private String c_date;      // 카페 개업 일자
   
   @NotEmpty(message = "카페 영업 시작 시간을 입력하세요.")
   private String ctime1;      // 카페 영업 시작 시간
   
   @NotEmpty(message = "카페 영업 종료 시간을 입력하세요.")
   private String ctime2;      // 카페 영업 종료 시간
   
   @NotEmpty(message = "카페 메인 사진을 입력하세요.")
   private String image;      // 카페 사진(메인 사진)
   
   @NotEmpty(message = "카페 사진2를 입력하세요.")
   private String image2;      // 카페 사진2
   
   @NotEmpty(message = "카페 사진3을 입력하세요.")
   private String image3;      // 카페 사진3
   
   @NotEmpty(message = "카페 사진4를 입력하세요.")
   private String image4;      // 카페 사진4
   
   @NotEmpty(message = "카페 사진5를 입력하세요.")
   private String image5;      // 카페 사진5
   
   private MultipartFile upload; // 카페 메인 사진 업로드
   private MultipartFile upload2; // 카페 사진2 업로드
   private MultipartFile upload3; // 카페 사진3 업로드
   private MultipartFile upload4; // 카페 사진4 업로드
   private MultipartFile upload5; // 카페 사진5 업로드
   
   private String d_image; // 수정 후 지울 카페 메인 사진
   private String d_image2; // 수정 후 지울 카페 사진2
   private String d_image3; // 수정 후 지울 카페 사진3
   private String d_image4; // 수정 후 지울 카페 사진4
   private String d_image5; // 수정 후 지울 카페 사진5
   
   public MultipartFile getUpload() {
      return upload;
   }
   public MultipartFile getUpload2() {
      return upload2;
   }
   public MultipartFile getUpload3() {
      return upload3;
   }
   public MultipartFile getUpload4() {
      return upload4;
   }
   public MultipartFile getUpload5() {
      return upload5;
   }
   public String getD_image() {
      return d_image;
   }
   public String getD_image2() {
      return d_image2;
   }
   public String getD_image3() {
      return d_image3;
   }
   public String getD_image4() {
      return d_image4;
   }
   public String getD_image5() {
      return d_image5;
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
   public void setUpload4(MultipartFile upload4) {
      this.upload4 = upload4;
      if(this.upload4 != null) {
         image4 = upload4.getOriginalFilename();
      }
   }
   public void setUpload5(MultipartFile upload5) {
      this.upload5 = upload5;
      if(this.upload5 != null) {
         image5 = upload5.getOriginalFilename();
      }
   }
   public void setD_image(String d_image) {
      this.d_image = d_image;
   }
   public void setD_image2(String d_image2) {
      this.d_image2 = d_image2;
   }
   public void setD_image3(String d_image3) {
      this.d_image3 = d_image3;
   }
   public void setD_image4(String d_image4) {
      this.d_image4 = d_image4;
   }
   public void setD_image5(String d_image5) {
      this.d_image5 = d_image5;
   }
   public int getCnum() {
      return cnum;
   }
   public String getName() {
      return name;
   }
   public String getXpos() {
      return xpos;
   }
   public String getYpos() {
      return ypos;
   }
   public String getAddress() {
      return address;
   }
   public String getCtel1() {
      return ctel1;
   }
   public String getCtel2() {
      return ctel2;
   }
   public String getCtel3() {
      return ctel3;
   }
   public String getC_date() {
      return c_date;
   }
   public String getCtime1() {
      return ctime1;
   }
   public String getCtime2() {
      return ctime2;
   }
   public String getImage() {
      return image;
   }
   public String getImage2() {
      return image2;
   }
   public String getImage3() {
      return image3;
   }
   public String getImage4() {
      return image4;
   }
   public String getImage5() {
      return image5;
   }
   public void setCnum(int cnum) {
      this.cnum = cnum;
   }
   public void setName(String name) {
      this.name = name;
   }
   public void setXpos(String xpos) {
      this.xpos = xpos;
   }
   public void setYpos(String ypos) {
      this.ypos = ypos;
   }
   public void setAddress(String address) {
      this.address = address;
   }
   public void setCtel1(String ctel1) {
      this.ctel1 = ctel1;
   }
   public void setCtel2(String ctel2) {
      this.ctel2 = ctel2;
   }
   public void setCtel3(String ctel3) {
      this.ctel3 = ctel3;
   }
   public void setC_date(String c_date) {
      this.c_date = c_date;
   }
   public void setCtime1(String ctime1) {
      this.ctime1 = ctime1;
   }
   public void setCtime2(String ctime2) {
      this.ctime2 = ctime2;
   }
   public void setImage(String image) {
      this.image = image;
   }
   public void setImage2(String image2) {
      this.image2 = image2;
   }
   public void setImage3(String image3) {
      this.image3 = image3;
   }
   public void setImage4(String image4) {
      this.image4 = image4;
   }
   public void setImage5(String image5) {
      this.image5 = image5;
   }
   
}