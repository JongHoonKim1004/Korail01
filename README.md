<h1 align="center"><img src="https://cdn-icons-png.freepik.com/512/2855/2855692.png" style="width: 300; height: 150"></h1>
<h1 align="center">스프링 레거시 철도 예약 프로젝트</h1>
<br/><br/>

## 목차
  
  - [개요](https://github.com/JongHoonKim1004/Korail01#-개요)
  
  - [기술 스택](https://github.com/JongHoonKim1004/Korail01#-기술-스택)
    
  - [프로젝트 설계](https://github.com/JongHoonKim1004/Korail01#-프로젝트-설계)
    
  - [핵심 기능](https://github.com/JongHoonKim1004/Korail01#-핵심-기능)
    
  - [주요기능 실행화면](https://github.com/JongHoonKim1004/Korail01#-주요기능-실행화면)
    
  - [개선사항](https://github.com/JongHoonKim1004/Korail01#-개선사항)

## 🚩 개요
 - 프로젝트 목표 : 다양한 API를 이용한 스프링 레거시 철도 예약 프로젝트
 - 개발 기간 : 24/03/15 ~ 24/04/15
   
## 🔧 기술 스택
 - API : `Kakao API`, `Kakao MAP API`, `OpenWeather API`, `DateRangePicker API`
 - Language : `JAVA(11)`, `JavaScript(1.5)`
 - Library & Framework : `Spring(5.2.7)`, `JUnit(4.12)`, `Spring Security(5.2.7)`
 - Database : `Oracle(11g)`
 - Target : `Web Browser`
 - Tool : `Spring Tool Suite 3.9.18 RELEASE`
 - ETC : `Git`


## 👾 프로젝트 설계, 구현 📂 PPT 📂 (ERD, USECASE)

<details><summary>프로젝트 설계, 구현, PPT</summary>

<div align="center">

| ![Project_Korail_PPT_01](https://github.com/JongHoonKim1004/Korail01/assets/155927559/422536b5-6f43-4282-a82f-81f26024cd15) | ![Project_Korail_PPT_02](https://github.com/JongHoonKim1004/Korail01/assets/155927559/704e9eb5-3b72-4246-92cb-1f81d8a64aba) |
| :-------------: | :-------------: | 
| ![Project_Korail_PPT_03](https://github.com/JongHoonKim1004/Korail01/assets/155927559/0b13c47c-9dd4-4f34-8802-cabde6f408da) | ![Project_Korail_PPT_04](https://github.com/JongHoonKim1004/Korail01/assets/155927559/97e74222-1da9-4d8e-9232-46e65dc0aa47) |
| ![Project_Korail_PPT_05](https://github.com/JongHoonKim1004/Korail01/assets/155927559/c6c3f7c5-b0c2-4e88-87e4-7e3fbca062ec) | ![Project_Korail_PPT_06](https://github.com/JongHoonKim1004/Korail01/assets/155927559/56ef842f-0b75-4a8f-be27-f2244b68e9d5) |
| ![Project_Korail_PPT_07](https://github.com/JongHoonKim1004/Korail01/assets/155927559/5979f56b-d81c-425e-969e-ff81c7315039) | ![Project_Korail_PPT_08](https://github.com/JongHoonKim1004/Korail01/assets/155927559/f61a8142-fc7a-44f7-a83c-db8ba67c75c6) |
| ![Project_Korail_PPT_09](https://github.com/JongHoonKim1004/Korail01/assets/155927559/e2efe8d8-503c-4d04-8804-8d52e56b1df5) | ![Project_Korail_PPT_10](https://github.com/JongHoonKim1004/Korail01/assets/155927559/8657588c-46c6-4b04-b8da-2da79cb337c5) |
| ![Project_Korail_PPT_11](https://github.com/JongHoonKim1004/Korail01/assets/155927559/21089ff9-5bd7-42a3-88b6-defb0d273785) | ![Project_Korail_PPT_12](https://github.com/JongHoonKim1004/Korail01/assets/155927559/bbc74ba8-48af-4e57-baac-af22ce6285a0) |
| ![Project_Korail_PPT_13](https://github.com/JongHoonKim1004/Korail01/assets/155927559/8dce2a8f-cce8-4793-a9fa-28c3abc08713) | ![Project_Korail_PPT_14](https://github.com/JongHoonKim1004/Korail01/assets/155927559/be48fc28-c35d-4e3c-b4a4-b18421da92e6) |
| ![Project_Korail_PPT_15](https://github.com/JongHoonKim1004/Korail01/assets/155927559/42a5674f-f144-440d-87a8-5ebe21f970ce) | ![Project_Korail_PPT_16](https://github.com/JongHoonKim1004/Korail01/assets/155927559/4c1ad778-31cc-42b6-90d4-3a1323eff654) |
| ![Project_Korail_PPT_17](https://github.com/JongHoonKim1004/Korail01/assets/155927559/3d112e85-245c-495d-91c9-f70422cc561c) | ![Project_Korail_PPT_18](https://github.com/JongHoonKim1004/Korail01/assets/155927559/2b7a533e-049a-4390-a2c2-997239ca059c) |
| ![Project_Korail_PPT_19](https://github.com/JongHoonKim1004/Korail01/assets/155927559/9d1baebf-6b75-42f0-bdde-fbac20126fd1) | ![Project_Korail_PPT_20](https://github.com/JongHoonKim1004/Korail01/assets/155927559/697ee149-5f33-4c13-91b6-e00a1c1219d2) |
| ![Project_Korail_PPT_21](https://github.com/JongHoonKim1004/Korail01/assets/155927559/6ed02571-6070-4195-bf3a-e4166b32ceab) | ![Project_Korail_PPT_22](https://github.com/JongHoonKim1004/Korail01/assets/155927559/a9070801-0f15-46ab-9414-122ae4d41046) |
| ![Project_Korail_PPT_23](https://github.com/JongHoonKim1004/Korail01/assets/155927559/24b3b652-5c25-4a1e-8666-2f081fbe60bf) | ![Project_Korail_PPT_24](https://github.com/JongHoonKim1004/Korail01/assets/155927559/fe3862af-f611-40dc-a48b-fcebdda5a012) |
| ![Project_Korail_PPT_25](https://github.com/JongHoonKim1004/Korail01/assets/155927559/173a8e74-7776-494d-a68b-d446c2a69529) | ![Project_Korail_PPT_26](https://github.com/JongHoonKim1004/Korail01/assets/155927559/4e7ad88e-9a31-4863-8eda-f7f328e2f591) |
| ![Project_Korail_PPT_27](https://github.com/JongHoonKim1004/Korail01/assets/155927559/18e2bb25-f1ac-482a-b46c-40dc050f6295) | ![Project_Korail_PPT_28](https://github.com/JongHoonKim1004/Korail01/assets/155927559/6fff579b-63ed-44ed-be9b-651319c73bae) |
| ![Project_Korail_PPT_29](https://github.com/JongHoonKim1004/Korail01/assets/155927559/e26db6c2-8591-4b59-bd29-8d1c953ed435) | ![Project_Korail_PPT_30](https://github.com/JongHoonKim1004/Korail01/assets/155927559/a785a6b4-93c2-41ae-b8c9-ce0186f10729) |
| ![Project_Korail_PPT_31](https://github.com/JongHoonKim1004/Korail01/assets/155927559/2fc7c475-aec8-4d5f-8aa1-a75c62c759a9) | ![Project_Korail_PPT_32](https://github.com/JongHoonKim1004/Korail01/assets/155927559/550040ee-495f-4ecf-bf1b-bda8b6daa77c) |
| ![Project_Korail_PPT_33](https://github.com/JongHoonKim1004/Korail01/assets/155927559/64eb41b1-c6fc-4088-afcb-4806672f7a47) | ![Project_Korail_PPT_34](https://github.com/JongHoonKim1004/Korail01/assets/155927559/5a92c35e-5a9a-4c66-a062-9445d35deb39) |
| ![Project_Korail_PPT_35](https://github.com/JongHoonKim1004/Korail01/assets/155927559/790af248-bea3-4945-beee-da82bc87f43d) | ![Project_Korail_PPT_36](https://github.com/JongHoonKim1004/Korail01/assets/155927559/4fc2ea3a-ed44-4eb2-b02f-6556ceb90758) |
| ![Project_Korail_PPT_37](https://github.com/JongHoonKim1004/Korail01/assets/155927559/8d3f7642-fa54-4da2-b603-1586fd278095) | ![Project_Korail_PPT_38](https://github.com/JongHoonKim1004/Korail01/assets/155927559/971d4727-a244-42bc-95fc-e9ec7badb764) |
| ![Project_Korail_PPT_39](https://github.com/JongHoonKim1004/Korail01/assets/155927559/14854d2c-61eb-4e79-a20d-4cd39999ba29) | ![Project_Korail_PPT_40](https://github.com/JongHoonKim1004/Korail01/assets/155927559/144fc0db-8776-41fd-ba7b-a59b148fae15) |
| ![Project_Korail_PPT_41](https://github.com/JongHoonKim1004/Korail01/assets/155927559/2f826f0c-7491-495b-8c17-c3607cbb0f2e) | ![Project_Korail_PPT_42](https://github.com/JongHoonKim1004/Korail01/assets/155927559/296a9ad7-173c-4fcc-b7c6-1902d74f1a15) |
| ![Project_Korail_PPT_43](https://github.com/JongHoonKim1004/Korail01/assets/155927559/33356dc3-b8d9-477d-915e-03074c143bb3) | ![Project_Korail_PPT_44](https://github.com/JongHoonKim1004/Korail01/assets/155927559/ff09f2ca-a74c-4bed-99b7-5d4c9520a826) |
| ![Project_Korail_PPT_45](https://github.com/JongHoonKim1004/Korail01/assets/155927559/9a4993c2-ccc9-46db-bc2f-2d83f9649930) | ![Project_Korail_PPT_46](https://github.com/JongHoonKim1004/Korail01/assets/155927559/93038448-3b29-4a26-80a9-ea1ef47e0e84) |
| ![Project_Korail_PPT_47](https://github.com/JongHoonKim1004/Korail01/assets/155927559/4418fc2c-2610-40f7-abc1-e339b97131e9) | ![Project_Korail_PPT_48](https://github.com/JongHoonKim1004/Korail01/assets/155927559/04e2aaa6-e124-44e5-8179-2afad9dddf3f) |
| ![Project_Korail_PPT_49](https://github.com/JongHoonKim1004/Korail01/assets/155927559/04cc7f4b-2dcf-44bf-8cde-75190f6bfa11) | ![Project_Korail_PPT_50](https://github.com/JongHoonKim1004/Korail01/assets/155927559/4b5c9e3f-1799-4366-a852-aab3f420d2b5) |
| ![Project_Korail_PPT_51](https://github.com/JongHoonKim1004/Korail01/assets/155927559/58119f42-d136-487c-be0d-f76800d7624e) | ![Project_Korail_PPT_52](https://github.com/JongHoonKim1004/Korail01/assets/155927559/b6a10284-7d1d-469d-9664-68b6e2fcfbac) |
| ![Project_Korail_PPT_53](https://github.com/JongHoonKim1004/Korail01/assets/155927559/ca78da62-219a-496b-8595-5482bd9dde0a) | ![Project_Korail_PPT_54](https://github.com/JongHoonKim1004/Korail01/assets/155927559/1b3f16ea-1fe5-479d-94e3-1f2ab7ed46a4) |
| ![Project_Korail_PPT_55](https://github.com/JongHoonKim1004/Korail01/assets/155927559/e232cb46-2588-4f89-9a88-b79b401e379c) | ![Project_Korail_PPT_56](https://github.com/JongHoonKim1004/Korail01/assets/155927559/3fa65a56-20d9-458b-966d-b9e472eda825) |
| ![Project_Korail_PPT_57](https://github.com/JongHoonKim1004/Korail01/assets/155927559/28edea12-b5d1-4c90-8936-4af54aa8c6d2) | ![Project_Korail_PPT_58](https://github.com/JongHoonKim1004/Korail01/assets/155927559/c6adb1bd-9dc0-4979-b5ad-b9d22aef9941) |
| ![Project_Korail_PPT_59](https://github.com/JongHoonKim1004/Korail01/assets/155927559/6880c136-a7a9-4df1-b4d9-1b4ab851de03) | ![Project_Korail_PPT_60](https://github.com/JongHoonKim1004/Korail01/assets/155927559/7cdd7d4e-96a5-4f37-b7d0-0deb61d4e0ff) |
| ![Project_Korail_PPT_61](https://github.com/JongHoonKim1004/Korail01/assets/155927559/be937b6c-2e5e-4a4e-93cd-0223c1ca423b) | ![Project_Korail_PPT_62](https://github.com/JongHoonKim1004/Korail01/assets/155927559/ef715db0-1e1f-4757-8109-c51f45c8dd71) |
| ![Project_Korail_PPT_63](https://github.com/JongHoonKim1004/Korail01/assets/155927559/1f8fbef0-6932-4b49-a5ca-5532e19fd076) | ![Project_Korail_PPT_64](https://github.com/JongHoonKim1004/Korail01/assets/155927559/ce506c3c-5ac9-4ed9-ad43-3a019c4e761c) |
| ![Project_Korail_PPT_65](https://github.com/JongHoonKim1004/Korail01/assets/155927559/60fa1eac-44a1-4e27-8d94-587c959502ff) | ![Project_Korail_PPT_66](https://github.com/JongHoonKim1004/Korail01/assets/155927559/120294c2-58eb-481c-88b8-d9b1c0252219) |
| ![Project_Korail_PPT_67](https://github.com/JongHoonKim1004/Korail01/assets/155927559/dfb4416b-470d-4ec2-907a-d230e4c6c126) | ![Project_Korail_PPT_68](https://github.com/JongHoonKim1004/Korail01/assets/155927559/73bd0a4e-6485-40bd-86d5-fb4d8543bdd4) |
| ![Project_Korail_PPT_69](https://github.com/JongHoonKim1004/Korail01/assets/155927559/7540e946-3ef5-46c8-a70b-2e16781a6dd6) | ![Project_Korail_PPT_70](https://github.com/JongHoonKim1004/Korail01/assets/155927559/cf090cf1-1d5f-479a-8d37-67d9a675f879) |
| ![Project_Korail_PPT_71](https://github.com/JongHoonKim1004/Korail01/assets/155927559/56d51862-e360-4157-b232-a17260befc2f) | ![Project_Korail_PPT_72](https://github.com/JongHoonKim1004/Korail01/assets/155927559/792c1d3d-8d5a-4774-bb46-705a7b2a3941) |
| ![Project_Korail_PPT_73](https://github.com/JongHoonKim1004/Korail01/assets/155927559/5332fc92-43d3-4e77-bdde-ab17e05e3509) | ![Project_Korail_PPT_74](https://github.com/JongHoonKim1004/Korail01/assets/155927559/bd197d88-225d-4673-bde0-a19d7de11085) |
| ![Project_Korail_PPT_75](https://github.com/JongHoonKim1004/Korail01/assets/155927559/033245d2-b2ad-443c-bb7e-1bac1d8422a3) | ![Project_Korail_PPT_76](https://github.com/JongHoonKim1004/Korail01/assets/155927559/fa39fc92-3dde-4588-bfb4-140e39244729) |
| ![Project_Korail_PPT_77](https://github.com/JongHoonKim1004/Korail01/assets/155927559/800d1814-96ff-44b1-b9ba-db144c51d4c7) | ![Project_Korail_PPT_78](https://github.com/JongHoonKim1004/Korail01/assets/155927559/bd5e36df-61b7-4dfe-b20f-eff06ed2c4d9) |
| ![Project_Korail_PPT_79](https://github.com/JongHoonKim1004/Korail01/assets/155927559/760b0a6c-f2af-4a2f-b966-bde713745e40) | ![Project_Korail_PPT_80](https://github.com/JongHoonKim1004/Korail01/assets/155927559/75e9d78e-3d89-45f3-b90e-22a2699a8509) |
| ![Project_Korail_PPT_81](https://github.com/JongHoonKim1004/Korail01/assets/155927559/8ada8374-13eb-4b56-ae03-a66a1aefd9a2) | ![Project_Korail_PPT_82](https://github.com/JongHoonKim1004/Korail01/assets/155927559/7c93ac5e-a607-45b9-806e-3d2b83557675) |
| ![Project_Korail_PPT_83](https://github.com/JongHoonKim1004/Korail01/assets/155927559/3c003c83-b0eb-44e9-946e-f8336c2a2df1) | ![Project_Korail_PPT_84](https://github.com/JongHoonKim1004/Korail01/assets/155927559/43db735c-d8d2-43f6-8b31-1af04436cad4) |
| ![Project_Korail_PPT_85](https://github.com/JongHoonKim1004/Korail01/assets/155927559/7afbb19c-5248-475a-956e-bcc4fe9a0070) | ![Project_Korail_PPT_86](https://github.com/JongHoonKim1004/Korail01/assets/155927559/134fe6ea-8056-4cdc-af3f-75794020fc0d) |
| ![Project_Korail_PPT_87](https://github.com/JongHoonKim1004/Korail01/assets/155927559/087e3e02-d90d-4717-a6f0-f441846adf4b) | ![Project_Korail_PPT_88](https://github.com/JongHoonKim1004/Korail01/assets/155927559/8e88a122-6a2b-41eb-ad60-0cb775c2eef6) |
| ![Project_Korail_PPT_89](https://github.com/JongHoonKim1004/Korail01/assets/155927559/ed077115-60b5-4fc9-bf9f-d12d755b0b82) | ![Project_Korail_PPT_90](https://github.com/JongHoonKim1004/Korail01/assets/155927559/a503693e-04b9-41b5-9274-2d25b27a4244) |
| ![Project_Korail_PPT_91](https://github.com/JongHoonKim1004/Korail01/assets/155927559/049fe10c-41e9-4435-ad5a-6daa35f821eb) | ![Project_Korail_PPT_92](https://github.com/JongHoonKim1004/Korail01/assets/155927559/22dcc66b-dd1f-4003-97b6-7a66092e2151) |
| ![Project_Korail_PPT_93](https://github.com/JongHoonKim1004/Korail01/assets/155927559/3a19cfd7-9ec5-48ff-93db-e33d0754806b) | ![Project_Korail_PPT_94](https://github.com/JongHoonKim1004/Korail01/assets/155927559/9cca2e26-cf04-4ce2-bbd2-9d63ed604620) |
| ![Project_Korail_PPT_95](https://github.com/JongHoonKim1004/Korail01/assets/155927559/22440054-8ab8-431d-a5d7-f29a5fcb19c3) | ![Project_Korail_PPT_96](https://github.com/JongHoonKim1004/Korail01/assets/155927559/f15e6caf-654e-454b-8948-d875d9974dce) |
| ![Project_Korail_PPT_97](https://github.com/JongHoonKim1004/Korail01/assets/155927559/1e58decf-499e-4119-817d-77be5c377bd5) | ![Project_Korail_PPT_98](https://github.com/JongHoonKim1004/Korail01/assets/155927559/ac695fb1-0b53-4e3d-8f41-b1dc2e3dfa83) |

</div>
  
</details>

## 💻 핵심 기능

#### 일반회원
- 소셜 로그인(카카오)
- 로그인 방법에 따른 회원가입, 회원정보 변경 방법의 차이
- 비밀번호 암호화 처리
- 아이디 중복확인
- 이메일을 이용한 아이디, 비밀번호 찾기
- 마이페이지 (회원정보 변경, 예약 목록, 나의 Q&A)

#### 관리자
- 새로운 철도역 등록(Kakao MAP API를 이용한 위치 등록)
- 새로운 노선 등록
- 공지사항 작성
- 회원 관리

#### 좌석 예약
- 노선에 따른 좌석 검색
- 날짜를 지정하여 당일 예약 가능한 노선 확인
- 각 노선에 대한 실시간 예약 확인

## 🎇 주요기능 실행화면

<details>
  <summary>주요기능 실행화면</summary>


  
  * **회원가입**
    * 우측 상단 헤더의 `회원가입`을 통하여 회원가입 폼 페이징로 이동할 수 있다.
    * `중복 확인`을 통해 중복되는 아이디가 있는지 확인할 수 있다.
    * `이용약관`을 클릭하면 새로운 팝업창을 통해 이용 약관을 확인할 수 있다.
   
       ![Korail01_register](https://github.com/JongHoonKim1004/Korail01/assets/155927559/7e849c92-6972-4b91-9c6b-06f6fb1827a3)

  * **로그인, 소셜 로그인**
    * 우측 상단 헤더의 `로그인`을 통해 로그인 페이지로 이동할 수 있다.
    * 일반 로그인은 폼에 아이디, 비밀번호를 입력하여 로그인이 가능하다.
    * `카카오 로그인`을 클릭하면 카카오계정을 이용한 소셜 로그인이 가능하다.
    * 카카오계정으로 등록된 이메일로 가입한 계정이 있다면 해당 계정으로 로그인 처리를 하고, 그렇지 않다면 간편 회원가입 페이지로 이동한다.
   
    ![korail02_login&kakaoLogin](https://github.com/JongHoonKim1004/JongHoonKimMedia/blob/main/readme/Korail02_login&KakaoLogin.gif?raw=true)

 * **아아디, 비밀번호 찾기**
   * 로그인 페이지에서 `아이디 찾기`를 통해 아아디 찾기 페이지로 이동할 수 있고 이메일 주소를 입력한 후 `아이디 찾기`를 클릭하면 아아디를 확인할 수 있다.

     ![korail03_idFind](https://github.com/JongHoonKim1004/JongHoonKimMedia/blob/main/readme/Korail03_idFind.gif?raw=true)
     
   * 비밀번호 찾기 페이지에서는 아이디와 계정 등록에서 등록한 이메일 주소를 입력하면 인증번호를 포함한 메일을 전송하고 인증번호를 입력하면 비밀번호를 재설정 할 수 있다.

     ![korail04_passwordFind](https://github.com/JongHoonKim1004/JongHoonKimMedia/blob/main/readme/Korail04_passwordFind.gif?raw=true)
     

 
 * **게시판**
   * 상단 네비게이션 바의 `공지사항`을 통해서 공지사항 목록으로 이동할 수 있고 제목을 클릭하면 해당 공지사항을 확인할 수 있다.
   * `Q&A`를 통해서 질문 목록으로 이동할 수 있고 `Q&A 작성`을 통해 새로운 질문을 작성할 수 있으며 본인이 올린 질문에 대해 수정 및 삭제가 가능하다

     ![korail05_noticeqna](https://github.com/JongHoonKim1004/JongHoonKimMedia/blob/main/readme/Korail05_noticeqna.gif?raw=true)
    
 * **철도역 검색**
   * 상단 네비게이션 바의 `철도역 검색`을 통해 철도역을 검색할 수 있다.
   * 역 이름을 통한 검색과 주소를 통한 검색이 있으며,두 방법 모두 부분적으로 일치하는 모든 결과를 보여준다.

      ![korail06_station](https://github.com/JongHoonKim1004/JongHoonKimMedia/blob/main/readme/Korail06_station.gif?raw=true)


 * **승차권 예약**
   * 상단 네비게이션 바의 `승차권 예매` 혹은 메인 페이지의 `빠른 표 검색`을 통해 노선 검색 결과 페이지로 이동한다.
   * 각 예약의 `예약 검색`을 클릭하면 현재 예약 가능한 좌석이 표시 된다.
   * 원하는 좌석을 선택하고 `다음으로`를 클릭하면 최종적으로 예약 정보를 확인할 수 있고 `예약하기`를 클릭하면 예약이 완료된다.

     ![korail07_reservation](https://github.com/JongHoonKim1004/JongHoonKimMedia/blob/main/readme/Korail07_reservation.gif?raw=true)
  
 * **마이페이지 - 회원 정보 변경**
   * 로그인 후 `마이페이지` -> `정보 수정하기`를 통해 회원정보를 수정할 수 있다. 기본적으로 아이디를 제외한 다른 정보를 수정할 수 있다
     ![korail08_infoModify](https://github.com/JongHoonKim1004/JongHoonKimMedia/blob/main/readme/Korail08_infoModify.gif?raw=true)
     
   * 소셜 로그인으로 로그인 한 경우 아아디, 이름, 이메일은 변경할 수 없다.
     ![korail08_KakaoInfoModify](https://github.com/JongHoonKim1004/JongHoonKimMedia/blob/main/readme/Korail08_KakaoInfoModify.gif?raw=true)


  * **마이페이지 - 나의 예약, 나의 Q&A**
    * `나의 예약`, `나의 Q&A` 모두 `자세히 보기`를 클릭하면 각 항목의 목록 페이지로 이동한다.
    * `나의 Q&A`의 제목을 클릭하면 질문을 자세히 볼 수 있다.
    * `나의 에약`의 예약 번호를 클릭하면 예약을 자세히 볼 수 있으며 `취소하기`를 통해 예약을 취소할 수 있다.
   
      ![korail09_qna_reservation](https://github.com/JongHoonKim1004/JongHoonKimMedia/blob/main/readme/Korail09_qna_reservation.gif?raw=true) 

  * **관리자 로그인, 로그아웃**
    * 관리자 로그인은 메인 페이지 하단의 `관리자 로그인`을 통해 이동한 관리자 로그인 페이지를 통해서 할 수 있다.
    * 관리자 로그아웃은 상단 우측의 인물 아이콘 클릭 후 `Logout` 을 통해 이동한 페이지를 통해 할 수 있다.
   
      ![korail10_adminLogin](https://github.com/JongHoonKim1004/JongHoonKimMedia/blob/main/readme/Korail10_adminLogin.gif?raw=true)

  * **관리자 페이지 - 공지사항**
    * 관리자 페이지 좌측 사이드바에서 `공지사항` -> `공지사항 목록`을 통해 공지사항 목록 페이지로 접근할 수 있다.
    * `공지사항 작성`을 통해 새로운 공지사항을 작성할 수 있다.

      ![korail11_adminNotice](https://github.com/JongHoonKim1004/JongHoonKimMedia/blob/main/readme/Korail11_adminNotice.gif?raw=true)

  * **관리자 페이지 - Q&A**
    * 관리자 페이지 좌측 사이드바에서 `Q&A` -> `Q&A 목록`을 통해 질문 목록을 호출하고 제목을 클릭하면 질문을 자세히 볼 수 있다.
    * 질문 내용 하단의 `Reply` 버튼을 통해 답글을 작성할 수 있으며, 작성된 답글은 질문을 보는 페이지 하단에서 확인할 수 있다.
   
      ![korail12_qnaReply](https://github.com/JongHoonKim1004/JongHoonKimMedia/blob/main/readme/Korail12_qnaReply.gif?raw=true) 

  * **관리자 페이지 - 예약 목록, 철도역 목록**
    * 관리자 페이지 좌측 사이드바에서 `예약 관리` -> `예약 목록`을 통해 등록된 모든 예약을 확인할 수 있다.
    * `철도역 관리` -> `철도역 목록`을 통해 등록된 모든 철도역을 확인할 수 있으며, 제목을 클릭하여 상세 정보 와 지도를 통한 위치를 확인할 수 있다.(DAUM MAP API 호출)
   
      ![korail13_res_train_stationList](https://github.com/JongHoonKim1004/JongHoonKimMedia/blob/main/readme/Korail13_res_train_stationList.gif?raw=true)

  * **관리자 페이지 - 철도역 생성**
    * 관리자 페이지 좌측 사이드바 에서 `철도역 관리` -> `철도역 생성`을 클릭하면 철도역 생성 페이지로 이동할 수 있다.
    * 이름과 주소를 입력하고 DAUM MAP API를 통해 호출한 지도를 통해 위치를 확정할 수 있고 추가 정보를 등록하면 철도역 등록이 완료된다.
   
      ![korail15_stationCreate](https://github.com/JongHoonKim1004/JongHoonKimMedia/blob/main/readme/Korail15_stationCreate.gif?raw=true)


  * **관리자 페이지 - 새 노선 생성**
    * 관리자 페이지 좌측 사이드바에서 `노선 관리` -> `새 노선 생성`을 통해 노선 생성 페이지로 이동할 수 있다.
    * 각종 정보를 작성한 뒤 `Submmit`을 클릭하면 정상적으로 노선 등록이 완료된다.
   
      ![korail14_trainCreate](https://github.com/JongHoonKim1004/JongHoonKimMedia/blob/main/readme/Korail14_trainCreate.gif?raw=true)


</details>

## 🌄 개선사항
- 승차권 예약에 대한 결제 모듈 도입
- 승차권 예약에 대한 조건 추가(할인 조건 추가, 포인트 도입 등)
- 회원 정보 항목 추가
