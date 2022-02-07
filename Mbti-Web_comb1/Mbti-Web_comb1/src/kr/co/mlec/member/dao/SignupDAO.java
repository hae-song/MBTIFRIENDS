package kr.co.mlec.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.co.mlec.member.vo.SignupVO;
import kr.co.mlec.util.ConnectionFactory;
import kr.co.mlec.util.JDBCClose;

public class SignupDAO {


	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	boolean flag = false;

		//id중복확인
		public boolean checkId(String id) {
		
			try {
				conn = new ConnectionFactory().getConnection();
				StringBuilder sql = new StringBuilder();
				sql.append("select id from tblMember where id = ? ");
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1, id);
				flag = pstmt.executeQuery().next();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCClose.close(pstmt, conn);
			}
			return flag;
		}
		
		//회원가입
		public boolean insertMember(SignupVO bean) {
			
			try {
				conn = new ConnectionFactory().getConnection();
				StringBuilder sql = new StringBuilder();
				sql.append("insert into tblMember(id,pwd,name) values(?,?,?)");
				pstmt  = conn.prepareStatement(sql.toString());
				pstmt.setString(1, bean.getId());
				pstmt.setString(2, bean.getPwd());
				pstmt.setString(3, bean.getName());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCClose.close(pstmt, conn);
			} return flag;
		
		}
}