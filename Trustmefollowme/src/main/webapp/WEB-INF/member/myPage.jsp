6번 

<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Users / Profile - NiceAdmin Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="<%=request.getContextPath()%>/resources/assets2/img/favicon.png" rel="icon">
  <link href="<%=request.getContextPath()%>/resources/assets2/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="<%=request.getContextPath()%>/resources/assets2/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets2/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets2/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets2/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets2/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets2/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="<%=request.getContextPath()%>/resources/assets2/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="<%=request.getContextPath()%>/resources/assets2/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Nov 17 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="mainScreen.m" class="logo d-flex align-items-center">
        <img src="<%=request.getContextPath()%>/resources/assets2/img/logo.png" alt="">
        <span class="d-none d-lg-block">나만 믿고 따라와</span>
      </a>
      <!-- <i class="bi bi-list toggle-sidebar-btn"></i> -->
    </div><!-- End Logo -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="<%=request.getContextPath()%>/resources/assets2/img/logo.png" alt="Profile" class="rounded-circle">
            <%-- <img src="<%=request.getContextPath()%>/resources/assets2/img/타요.gif" alt="Profile" class="rounded-circle"> --%>
            <span class="d-none d-md-block dropdown-toggle ps-2">${memberBean.name }</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>${memberBean.name }</h6>
              <span>${memberBean.email }</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="myPage.mb">
                <i class="bi bi-person"></i>
                <span>내 프로필</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="logout.jsp">
                <i class="bi bi-box-arrow-right"></i>
                <span><font color="red">로그 아웃</font></span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
 <!--  <aside id="sidebar" class="sidebar">
  </aside> --><!-- End Sidebar-->

  <main id="" class="main">

    <div class="pagetitle">
      <h1>Profile</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item">Users</li>
          <li class="breadcrumb-item active">Profile</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section profile">
      <div class="row">
        <div class="col-xl-4">

          <div class="card">
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

              <img src="<%=request.getContextPath()%>/resources/assets2/img/logo.png" alt="Profile" class="rounded-circle">
<%--               <img src="<%=request.getContextPath()%>/resources/assets2/img/profile-img.jpg" alt="Profile" class="rounded-circle"> --%>
              <h2>${memberBean.name }</h2>
              <h3>${memberBean.email }</h3>
              <div class="social-links mt-2">
                <a href="https://twitter.com/" class="twitter" target="_blank"><i class="bi bi-twitter"></i></a>
                <a href="https://www.facebook.com/" class="facebook" target="_blank"><i class="bi bi-facebook"></i></a>
                <a href="https://www.instagram.com/" class="instagram" target="_blank"><i class="bi bi-instagram" target="_blank"></i></a>
              </div>
            </div>
          </div>

        </div>

        <div class="col-xl-8">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered">

                <li class="nav-item">
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">내 정보</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">프로필 수정</button>
                </li>

                <!-- <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-settings">Settings</button>
                </li> -->

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">비밀번호 변경</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-settings">나의 여정</button>
                </li>

              </ul>
              <div class="tab-content pt-2">

                <div class="tab-pane fade show active profile-overview" id="profile-overview">
                  <h5 class="card-title">About</h5>
                  <p class="small">
                     이곳은 마이페이지입니다. 그렇습니다.
                  </p>

                  <h5 class="card-title">Profile Details</h5>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">이름</div>
                    <div class="col-lg-9 col-md-8">${memberBean.name }</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">생일</div>
                    <div class="col-lg-9 col-md-8">${memberBean.birth }</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">주소</div>
                    <div class="col-lg-9 col-md-8">${memberBean.address1 }</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">세부 주소</div>
                    <div class="col-lg-9 col-md-8">${memberBean.address2 }</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">전화 번호</div>
                    <div class="col-lg-9 col-md-8">${memberBean.mtel }</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Email</div>
                    <div class="col-lg-9 col-md-8">${memberBean.email }</div>
                  </div>

                </div>

                <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                  <!-- Profile Edit Form -->
                  <!-- <form class="row g-3 needs-validation was-validated" novalidate> -->
                  <form:form action="updatePf.mb" commandName="memberBean" method="post">
                  <input type="hidden" name="num" value="${memberBean.num }">
                    <%-- <div class="row mb-3">
                      <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                      <div class="col-md-8 col-lg-9">
                        <img src="<%=request.getContextPath()%>/resources/assets2/img/타요.gif" alt="Profile">
                        <div class="pt-2">
                          <a href="#" class="btn btn-primary btn-sm" title="Upload new profile image"><i class="bi bi-upload"></i></a>
                          <a href="#" class="btn btn-danger btn-sm" title="Remove my profile image"><i class="bi bi-trash"></i></a>
                        </div>
                      </div>
                    </div> --%>

                    <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">이름</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="name" type="text" class="form-control" id="" value="${memberBean.name }" style="width: 408px;">
                        <form:errors cssClass="err" path="name"/>
                        <!-- <div class="invalid-feedback"> 이름을 입력하십시오. </div> -->
                      </div>
                    </div>
                    <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">생일</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="birth" type="date" class="form-control" id="" value="${memberBean.birth }" style="width: 408px;">
                        <form:errors cssClass="err" path="birth"/>
                        <!-- <div class="invalid-feedback"> 생일을 입력하십시오. </div> -->
                      </div>
                    </div>

                    <!-- <div class="row mb-3">
                      <label for="about" class="col-md-4 col-lg-3 col-form-label">About</label>
                      <div class="col-md-8 col-lg-9">
                        <textarea name="about" class="form-control" id="about" style="height: 100px">이곳은 마이페이지입니다. 그렇습니다.</textarea>
                      </div>
                    </div> -->

                    <%-- <div class="row mb-3">
                      <label for="Address" class="col-md-4 col-lg-3 col-form-label">주소</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="address1" type="text" class="form-control" id="address1" value="${memberBean.address1 }" style="width: 400px;"> 
                        <input type="button" class="btn btn-primary" id="find--address--btn" onclick="postCode()" value="검색" style="display: inline-block;">
                        <form:errors cssClass="err" path="address1"/>
                        <!-- <div class="invalid-feedback"> 주소를 입력하십시오. </div> -->
                      </div>
                    </div> --%>
                    
                    <div class="row mb-3">
                   <label for="Address" class="col-md-4 col-lg-3 col-form-label">주소</label>
                   <div class="col-md-8 col-lg-9">
                       <div class="row">
                           <div class="col-md-6">
                               <input name="address1" type="text" class="form-control" id="address1" value="${memberBean.address1}" style="width: 100%;">
                           </div>
                           <div class="col-md-6">
                               <input type="button" class="btn btn-primary" id="find--address--btn" onclick="postCode()" value="검색">
                           </div>
                       </div>
                       <form:errors cssClass="err" path="address1"/>
                   </div>
               </div>

                    <div class="row mb-3">
                      <label for="Address" class="col-md-4 col-lg-3 col-form-label">세부 주소</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="address2" type="text" class="form-control" id="address2" value="${memberBean.address2 }" style="width: 408px;">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Phone" class="col-md-4 col-lg-3 col-form-label">Phone</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="mtel" type="text" class="form-control" id="" value="${memberBean.mtel }" style="width: 408px;">
                        <form:errors cssClass="err" path="mtel"/>
                        <!-- <div class="invalid-feedback"> 전화번호를 입력하십시오. </div> -->
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Email" class="col-md-4 col-lg-3 col-form-label">Email</label>
                      <div class="col-md-8 col-lg-9">
                    ${memberBean.email }
                      <input name="email" type="hidden" class="form-control" id="" value="${memberBean.email }" style="width: 408px;"> 
                        <form:errors cssClass="err" path="email"/>
                        <!-- <div class="invalid-feedback"> Email을 입력하십시오. </div> -->
                      </div>
                    </div>

                    <div class="text-center">
                         <button type="button" class="btn btn-primary"
                         data-bs-toggle="modal" data-bs-target="#verticalycentered-profile-edit">수정 저장</button>
                    </div>
                    <div class="modal fade" id="verticalycentered-profile-edit" tabindex="-1">
                  <div class="modal-dialog modal-dialog-centered">
                     <div class="modal-content">
                        <div class="modal-header">
                           <h5 class="modal-title">주의</h5>
                           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                           입력한 정보로 프로필을 수정하시겠습니까?
                        </div>
                        <div class="modal-footer">
                           <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                           <button type="submit" class="btn btn-warning">프로필 수정</button>
                        </div>
                     </div>
                  </div>
               </div>
                  </form:form><!-- End Profile Edit Form -->

                </div>

                <div class="tab-pane fade pt-3" id="profile-change-password">
                  <!-- Change Password Form -->
                  <form action="changePw.mb" class="row mb-3 needs-validation was-validated" method="post" name="changepw" novalidate>

                    <div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">기존 비밀번호</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="password" type="password" class="form-control" id="validationCustom01" required>
                        <div class="invalid-feedback"> 기존 비밀번호를 입력하십시오. </div>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">새 비밀번호</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="newpassword" type="password" class="form-control" id="validationCustom01" required>
                        <div class="invalid-feedback"> 기존 비밀번호를 입력하십시오. </div>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">새 비밀번호 확인</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="renewpassword" type="password" class="form-control" id="validationCustom01" onkeyup="repassword_keyup()" required>
                        <div class="invalid-feedback"> 새 비밀번호 확인을 입력하십시오. </div>
                        <span id="pwmessage"></span>
                      </div>
                    </div>

                    <div class="text-center">
                  <button type="button" class="btn btn-primary"
                         data-bs-toggle="modal" data-bs-target="#verticalycentered-changePw">비밀번호 변경</button>
                         <div class="modal fade" id="verticalycentered-changePw" tabindex="-1">
                     <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                           <div class="modal-header">
                              <h5 class="modal-title">주의</h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                           </div>
                           <div class="modal-body">
                              비밀번호를 변경하시겠습니까?
                           </div>
                           <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                              <button type="submit" class="btn btn-warning" onclick="change()">비밀번호 변경</button>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
                  </form><!-- End Change Password Form -->

                </div>

                <div class="tab-pane fade pt-3" id="profile-settings">
                <c:choose>
                <%-- <c:when test="${jnum == 0 }"> --%>
                <c:when test="${empty lists }">
                   여정 정보가 없습니다. 여정을 추가해보세요!
                </c:when>
                <c:otherwise>
                <%-- <c:forEach var="i" begin="1" end="${jnum }"> --%>
                <%-- <c:forEach var="i" begin="1" end="${fn:length(lists) }"> --%>
                <c:set var="num" value="1"/>
                <c:forEach var="mj" items="${lists }">

               <!-- Sales Card -->
                  <div class="col-xxl-4 col-md-6" style="display: inline-block; margin: 10px;">
                    <div class="card info-card sales-card">

                      <div class="filter">
                        <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                          <li class="dropdown-header text-start">
                            <h6>메뉴</h6>
                          </li>

                          <li><a class="dropdown-item text-danger" href="#"
                                data-bs-toggle="modal" data-bs-target="#verticalycentered-${num }-delMJ-${mj.jnum }">삭제</a></li>
                        </ul>
                      </div>
                         <!-- Vertically centered Modal -->
                          <div class="modal fade" id="verticalycentered-${num }-delMJ-${mj.jnum }" tabindex="-1">
                            <div class="modal-dialog modal-dialog-centered">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title">경고!</h5>
                                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                  선택한 ${num }번 여정을 삭제하시겠습니까? <br> 
                                  <font color="red">삭제하시면 되돌릴 수 없습니다!</font>
                                </div>
                                <div class="modal-footer">
                                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                  <button type="button" class="btn btn-danger" onclick="location.href='mjdel.mj?jnum=${mj.jnum }'">여정 삭제</button>
                                </div>
                              </div>
                            </div>
                          </div><!-- End Vertically centered Modal-->

                      <div class="card-body">
                         <a href="mainJourney.m?myjNum=${mj.jnum }">
                             <h5 class="card-title">${num }번 <span>여정</span></h5>
                          </a>
                         <div style="display: inline-block; margin: 10px;">
                            <img src="<%=request.getContextPath()%>/resources/assets2/img/돌하르방.jpg" width="100%" height="100%">
                         </div>
                      </div>


                    </div>
                  </div><!-- End Sales Card -->
                  <c:set var="num" value="${num+1 }"/>
                </c:forEach>
                </c:otherwise>
                </c:choose>


                </div>


              </div><!-- End Bordered Tabs -->

            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>나만 믿고 따라와</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      Designed by <a href="https://bootstrapmade.com/" target="_blank">BootstrapMade</a>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="<%=request.getContextPath()%>/resources/assets2/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets2/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets2/vendor/chart.js/chart.umd.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets2/vendor/echarts/echarts.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets2/vendor/quill/quill.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets2/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets2/vendor/tinymce/tinymce.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/assets2/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="<%=request.getContextPath()%>/resources/assets2/js/main.js"></script>
  
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

  <script type="text/javascript" src="<%=request.getContextPath()%>/resources/assets2/js/jquery.js"></script>
  <script type="text/javascript">
     function change() {
      alert(1);
      document.changepw.submit();
   }
     function repassword_keyup(){
        //alert(1);
        if($('input[name="renewpassword"]').val() == $('input[name="newpassword"]').val()){
           $('#pwmessage').html("<font color=blue>비밀 번호가 일치합니다.</font>");
           pwuse = "same";
        }else{
           $('#pwmessage').html("<font color=red>비밀 번호가 일치하지 않습니다.</font>");
           pwuse = "nosame";
        }
     }//repassword_keyup
   
     /* 우편번호 api 코드*/
    function postCode() {
       document.getElementById("address1").value = "";
        new daum.Postcode({
            oncomplete: function(data) {
                let addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { 
                   // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address2").focus();
            }
        }).open();
    }
  </script>

</body>

</html>