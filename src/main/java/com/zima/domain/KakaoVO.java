package com.zima.domain;

import lombok.Data;

@Data
public class KakaoVO {
	// 카카오 로그인 할 때 데이터를 받기 위한 VO
	private long kakaoId;
	private String nickname;
	private String kakaoEmail;
}
