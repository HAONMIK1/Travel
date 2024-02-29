package member.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class MemberBean {
   private String num;
   @NotEmpty(message = "이메일이 누락되었습니다.")
   private String email;
   @NotEmpty(message = "비밀번호가 누락되었습니다.")
   private String password;
   
   @NotEmpty(message = "이름이 누락되었습니다.")
   private String name;
   
   @NotEmpty(message = "생년월일이 누락되었습니다.")
   private String birth;
   
   @NotEmpty(message = "주소가 누락되었습니다.")
   private String address1;
   
   @NotEmpty(message = "상세주소가 누락되었습니다.")
   private String address2;
   
   @NotEmpty(message = "번호가 누락되었습니다.")
   private String mtel;
   private String kakaoId;
   private String myjNum;
   public String getKakaoId() {
      return kakaoId;
   }
   public void setKakaoId(String kakaoId) {
      this.kakaoId = kakaoId;
   }
   public String getMyjNum() {
      return myjNum;
   }
   public void setMyjNum(String myjNum) {
      this.myjNum = myjNum;
   }
   public String getNum() {
      return num;
   }
   public void setNum(String num) {
      this.num = num;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getPassword() {
      return password;
   }
   public void setPassword(String password) {
      this.password = password;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getBirth() {
      return birth;
   }
   public void setBirth(String birth) {
      this.birth = birth;
   }
   public String getAddress1() {
      return address1;
   }
   public void setAddress1(String address1) {
      this.address1 = address1;
   }
   public String getAddress2() {
      return address2;
   }
   public void setAddress2(String address2) {
      this.address2 = address2;
   }
   public String getMtel() {
      return mtel;
   }
   public void setMtel(String mtel) {
      this.mtel = mtel;
   }

   
   
   
}