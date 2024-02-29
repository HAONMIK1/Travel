package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import member.model.KakaoProfile;
import member.model.MemberBean;
import member.model.MemberDao;
import member.model.OAuthToken;
@Controller
public class UserController {
   @Autowired
   private MemberDao memberDao;

   @Autowired
   private KakaoAPI kakaoAPI;
   @Autowired
   private OAuthToken oauthToken;
   
   @RequestMapping(value="/login.mb",method=RequestMethod.GET)
   public String loginForm(){
   
      return "login";
   }   
   
   @RequestMapping(value="/login.mb",method=RequestMethod.POST)
   public String login(MemberBean mb,
                  HttpServletResponse response,HttpServletRequest request,
                  HttpSession session,Model model) throws IOException {
      
      
      
      response.setContentType("text/html;charset=UTF-8");
      PrintWriter out = null;
      out = response.getWriter();
      MemberBean member = memberDao.getMemberInfo(mb);
      
      if(member!=null) {
         String _name = member.getName();
         if(_name.equals("어드민")) {
         
            /*
             * out.print("<script>alert('어드민님 환영합니다. 관리지 페이지로 이동합니다.');</script>");
             * out.flush();
             */
            model.addAttribute("adminlogin", "admin.mb");
             session.setAttribute("myemail", member.getEmail());
             session.setAttribute("myname", member.getName());
//              session.setAttribute("mynum", member.getNum());
            return "redirect";
         }else {
               session.setAttribute("myemail", member.getEmail());
               session.setAttribute("myname", member.getName());
               return "redirect:mainScreen.m";
           }
          
      }else {
      out.print("<script>alert('가입하지 않은 회원입니다.');</script>");
         out.flush();
         return "login";
      }

       }
   

   @RequestMapping("/kakao-login.mb")
   public String kakaoCallback(String code,MemberBean mb, Model model,HttpSession session) {//Data를 리턴해주는 컨트롤러 함수
      
      //Post방식으로 key=value 데이터를 요청(카카오쪽으로)
      RestTemplate rt = new RestTemplate();
      
      //HttpHeaders 오브젝트생성
      HttpHeaders headers = new HttpHeaders();
      headers.add("Context-type","application/x-www-form-urlencoded;charset=utf-8");
      
      //HttpBody 오브젝트 생성
      MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
      params.add("grant_type","authorization_code");
      params.add("client_id","3ebf8bbbb7b91d2e8e34c1ae7d68f0db");
      params.add("redirect_uri","http://localhost:8080/ex/kakao-login.mb");
      params.add("code",code);
      
      //HttpHeaders,HttpBody를 하나의 오브젝트에 담기
      HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = 
              new HttpEntity<MultiValueMap<String, String>>(params, headers);
      
      //http요청하기 - Post방식으로- response 변수의 응답을 받음
      ResponseEntity<String> response = rt.exchange(
            "https://kauth.kakao.com/oauth/token",
            HttpMethod.POST,
            kakaoTokenRequest,
            String.class
            );
      
      ObjectMapper objectMapper = new ObjectMapper();
      OAuthToken oauthToken = null;
      try {
         oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
      } catch (JsonMappingException e) {
         e.printStackTrace();
      } catch (JsonProcessingException e) {
         e.printStackTrace();
      }
      
      System.out.println("카카오 엑세스 토큰: "+oauthToken.getAccess_token());
      
      
      
      RestTemplate rt2 = new RestTemplate();
      
      //HttpHeaders 오브젝트생성
      HttpHeaders headers2 = new HttpHeaders();
      headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
      headers2.add("Context-type","application/x-www-form-urlencoded;charset=utf-8");
      
      
      //HttpHeaders,HttpBody를 하나의 오브젝트에 담기
      HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = 
             new HttpEntity<MultiValueMap<String, String>>(new LinkedMultiValueMap<String, String>(), headers2);
      
      //http요청하기 - Post방식으로- response 변수의 응답을 받음
      ResponseEntity<String> response2 = rt2.exchange(
            "https://kapi.kakao.com/v2/user/me",
            HttpMethod.POST,
            kakaoProfileRequest2,
            String.class
            );
      
      
      ObjectMapper objectMapper2 = new ObjectMapper();
      KakaoProfile kakaoProfile= null;
      try {
         kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
      } catch (JsonMappingException e) {
         e.printStackTrace();
      } catch (JsonProcessingException e) {
         e.printStackTrace();
      }
      //name.password,email
      System.out.println("카카오 아이디(번호): "+kakaoProfile.getId());
      System.out.println("카카오 이메일: "+kakaoProfile.getKakao_account().getEmail());
      
      System.out.println("웹페이지 유저네임: "+kakaoProfile.getKakao_account().getEmail()+"_"+kakaoProfile.getId());
      System.out.println("웹페이지 이메일: "+kakaoProfile.getKakao_account().getEmail());
//      UUID garbagePassword = UUID.randomUUID();
//      System.out.println("웹페이지 서버 패스워드: "+garbagePassword);
      
      String kakaoId = String.valueOf(kakaoProfile.getId());
      
      // 회원 테이블에서 해당 이메일로 검색
      MemberBean existingMember = memberDao.getMemberByEmail(kakaoId);
      mb.setEmail(kakaoId);
      mb.setPassword(kakaoProfile.getKakao_account().getEmail());
     
//      MemberBean member = memberDao.getMemberInfo(mb);
      
        if (existingMember != null) {
               // 이미 가입된 회원인 경우, 로그인 처리 등을 수행하고 성공 메시지를 반환
              // model.addAttribute("message", "카카오 로그인이 완료되었습니다.");
               session.setAttribute("myemail", kakaoId);
               session.setAttribute("myname", existingMember.getName());
               return "redirect:mainScreen.m";
           } else {
               // 가입되지 않은 회원인 경우, 회원가입 폼으로 이동
               model.addAttribute("myemail", kakaoId);
               model.addAttribute("kakaoid",kakaoProfile.getId());
               model.addAttribute("kakaoemail",kakaoProfile.getKakao_account().getEmail());
               
               model.addAttribute("msg","회원가입을 위해 추가 정보 입력페이지로 이동합니다.");
               return "join2";
           }
}
   
   
//    @RequestMapping(value = "/logout.mb", method = RequestMethod.GET)
//       public String logout(HttpSession session, Model model) throws IOException {
//           // 세션에서 액세스 토큰을 가져옴
//        System.out.println("Logout request received."); // 로그 추가
//         
//        String accessToken = (String) session.getAttribute("access_token");
//           session.invalidate();
//           // 액세스 토큰이 있는지 확인
//           if (accessToken != null) {
//               // KakaoAPI에서 로그아웃을 수행합니다.
//               kakaoAPI.kakaoLogout(accessToken);
//
//               model.addAttribute("message", "로그아웃이 완료되었습니다.");
//              
//               // 메인 화면으로 리다이렉트
//               return "redirect:mainScreen.m";
//           } else {
//               
//               model.addAttribute("message", "이미 로그아웃되었거나 로그인하지 않았습니다.");
//               return "redirect:mainScreen.m"; // 메인 화면이나 로그인 화면으로 리다이렉트합니다.
//           }
//       }
//   
    @RequestMapping(value = "/logout.mb", method = RequestMethod.GET)
     public String logout(HttpSession session, Model model) throws IOException {
       
       String access_Token = (String)session.getAttribute("access_Token");
       session.invalidate();
       System.out.println("세션만료됨");
         if(access_Token != null && !"".equals(access_Token)){
               kakaoAPI.kakaoLogout(access_Token);
               session.removeAttribute("access_Token");
               session.removeAttribute("myemail");
               session.invalidate();
               model.addAttribute("msg","로그아웃이 완료되었습니다.");
           }else{
               System.out.println("access_Token is null");
               
           }
         return "redirect:mainScreen.m";
    }
    
   
   
}



















