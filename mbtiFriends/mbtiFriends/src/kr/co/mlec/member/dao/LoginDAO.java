package kr.co.mlec.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.co.mlec.member.vo.LoginVO;
import kr.co.mlec.util.ConnectionFactory;

public class LoginDAO {
	
	/**
	 * 로그인 서비스
	 * @param loginVO (사용자가 입력한 id, password 저장)
	 * @return userVO (id, password로 조회된 회원정보)
	 * 			조회된 정보가 없다면 null 반환
	 */
	
	public LoginVO login(LoginVO loginVO) {
		
		LoginVO userVO = null;
		
	
		// AutoCloseable 상속받고 있지 않기 때문에 try문 밖에 써준다
		StringBuilder sql = new StringBuilder();
		sql.append("select id, password, type ");
		sql.append("	from mbti_member ");
		sql.append(" where id = ? and password = ? ");
		try( 
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, loginVO.getId());
			pstmt.setString(2, loginVO.getPassword());
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				userVO = new LoginVO();
				userVO.setId(rs.getString("id"));
				userVO.setPassword(rs.getString("password"));
				userVO.setType(rs.getString("type"));
			
			} 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userVO;
	}
}
