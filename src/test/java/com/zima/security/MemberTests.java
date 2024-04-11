package com.zima.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberTests {
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private DataSource ds;
	
	@Test
	public void testInsertMember() {
		String sql = "insert into users(uno, id, password, name) values(seq_users.nextval,?,?,?)";
		
		for(int i = 0 ; i < 10 ; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "user" + i);
				pstmt.setString(2, passwordEncoder.encode("1234"));
				pstmt.setString(3, "유저");
				pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	@Test
	public void testInsertAuth() {
		String sql = "insert into users_auth(id, auth) values(?,?)";
		
		for(int i = 0 ; i < 10 ; i ++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "user" + i);
				pstmt.setString(2, "ROLE_USER");
				pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	@Test
	public void insertAdmin() {
		String sql = "insert into admin(ano, id, password, phone, email) values(seq_admin.nextval,?,?,?,?)";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "admin");
			pstmt.setString(2, passwordEncoder.encode("1234"));
			pstmt.setString(3, "01050956331");
			pstmt.setString(4, "zima0412@gmail.com");
			
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	@Test
	public void insertAdminAuth() {
		String sql = "insert into admin_auth(id, auth) values(?,?)";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "admin");
			pstmt.setString(2, "ROLE_USER");
			
			
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
