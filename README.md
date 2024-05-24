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




















































