package member.controller;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import member.model.OAuthToken;


@Component
public class KakaoAPI {

	@Autowired
	private OAuthToken oauthToken;
//	public String getToken(String restApiCode, String redirectUri, String code) throws JSONException {
//		RestTemplate restTemplate = new RestTemplate();
//
//		HttpHeaders headers = new HttpHeaders();
//		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
//		
//		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
//		body.add("grant_type", "authorization_code");
//		body.add("client_id", restApiCode);
//		body.add("redirect_uri", redirectUri);
//		body.add("code", code);
//
//		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(body, headers);
//
//		ResponseEntity<String> responseEntity = restTemplate.postForEntity("https://kauth.kakao.com/oauth/token", requestEntity, String.class);
//
//		JSONObject jsonObject = new JSONObject(responseEntity.getBody());
//
//		System.out.println(jsonObject);
//
//		return jsonObject.getString("access_token");
//	}
//
//	public HashMap<String, Object> getUserInfo(String token) throws JSONException {
//		RestTemplate restTemplate = new RestTemplate();
//		HttpHeaders headers = new HttpHeaders();
//		HashMap<String, Object> userInfo = new HashMap<>();
//
//		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
//		headers.add("Authorization", "Bearer " + token);
//
//		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(headers);
//
//		ResponseEntity<String> responseEntity = restTemplate.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.GET, requestEntity, String.class);
//
//
////		JSONObject jsonObject = new JSONObject();
//		System.out.println("responseEntity.getBody():"+responseEntity.getBody());
//
//		JSONObject jsonObject = new JSONObject(responseEntity.getBody());
//		String email = jsonObject.getJSONObject("kakao_account").getString("email");
//		String nickname = jsonObject.getJSONObject("properties").getString("nickname");
//		
//		userInfo.put("nickname", nickname);
//		userInfo.put("email", email);
//		System.out.println(email + " " + nickname);
//
////		return jsonObject.getString("access_token");
//		return userInfo ;
//	}
//	
	
	
	
	
//	@Value("https://kapi.kakao.com/v1/user/logout")
//    private String kakaoLogoutUrl;  // application.properties 또는 application.yml에서 설정된 Kakao 로그아웃 URL
//
//    public void kakaoLogout(String accessToken) {
//        // RestTemplate을 사용하여 Kakao API에 로그아웃 요청을 보냅니다.
//    	System.out.println("Kakao Logout - Access Token: " + accessToken); // 로그 추가
//    	RestTemplate restTemplate = new RestTemplate();
//
//        // HttpHeaders 오브젝트 생성
//        MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
//        headers.add("Authorization", "Bearer " + accessToken);
//
//        // HttpEntity 오브젝트 생성
//        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(headers);
//
//    	try {
//            // 나머지 로그아웃 로직은 그대로 유지
//            System.out.println("Kakao Logout - Before API Request");
//
//            // Kakao API에 로그아웃 요청
//            String response = restTemplate.postForObject(kakaoLogoutUrl, requestEntity, String.class);
//            System.out.println("Kakao Logout - API Response: " + response);
//
//            System.out.println("Kakao Logout - Completed");
//        } catch (HttpClientErrorException | HttpServerErrorException e) {
//            System.out.println("Kakao Logout - API Request Failed: " + e.getStatusCode() + " " + e.getStatusText());
//            e.printStackTrace(); 
//        }
//    	
//    	
//    }
//    
	 public void kakaoLogout(String access_Token) {
	        String reqURL = "https://kapi.kakao.com/v1/user/logout";
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("POST");
	            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	            String result = "";
	            String line = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println(result);
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	 }
}
	

