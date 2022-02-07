package kr.co.mlec.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.member.vo.LoginVO;
import kr.co.mlec.member.vo.MemberVO;
import kr.co.mlec.util.ConnectionFactory;
import kr.co.mlec.util.JDBCClose;

public class MemberDAO {
   
   /**
    *    회원 리스트
    */
   
   public List<MemberVO> getMemberList() {
      
      List<MemberVO> list = new ArrayList<>();
      Connection conn = null;
      PreparedStatement pstmt = null;
      
      try {
         conn = new ConnectionFactory().getConnection();
         StringBuilder sql = new StringBuilder();
         sql.append("select no, id, password, name, addr, type");
         sql.append("   , to_char(reg_date,'yyyy-mm-dd') as reg_date ");
         sql.append("   , my_mbti, like_mbti, dislike_mbti ");
         sql.append("   from mbti_member ");
         sql.append("    order by no desc ");
         pstmt = conn.prepareStatement(sql.toString());
         ResultSet rs = pstmt.executeQuery();
                  
         while(rs.next()) {
            int no = rs.getInt("no");
            String id = rs.getString("id");
            String password = rs.getString("password");
            String name = rs.getString("name");
            String addr = rs.getString("addr");
            String type = rs.getString("type");
            String regDate = rs.getString("reg_date");
            String my_mbti = rs.getString("my_mbti");
            String like_mbti = rs.getString("like_mbti");
            String dislike_mbti = rs.getString("dislike_mbti");
            MemberVO member = new MemberVO(no, id, password, name, addr, type, regDate, my_mbti, like_mbti, dislike_mbti);
         //   System.out.println(board);
            
            list.add(member);
      }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         JDBCClose.close(pstmt, conn);
      }
      
      return list;
   }
   
   /**
    * 회원정보에 맞는 이름 가져오기
    * */
   
   public MemberVO selectMyMapList(String id) {
	      
	     
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      
	      
	      MemberVO memb = null;
	      
	      
	      try {
	         conn = new ConnectionFactory().getConnection();
	         StringBuilder sql = new StringBuilder();
	         
	         sql.append(" select id, name, addr, my_mbti, like_mbti, dislike_mbti, addr_x, addr_y ");
	         sql.append(" from mbti_member ");
	         sql.append(" where id = ? ");
	       
	         pstmt = conn.prepareStatement(sql.toString());
	         
	         pstmt.setString(1, id);
	         
	         ResultSet rs = pstmt.executeQuery();
	                  
	         while(rs.next()) {
	        	memb = new MemberVO();
	            memb.setId(rs.getString("id")); 
	            memb.setName(rs.getString("name"));
	            memb.setAddr(rs.getString("addr"));
	            memb.setMymbti(rs.getString("my_mbti")) ;
	            memb.setLikembti(rs.getString("like_mbti"));
	            memb.setDislikembti(rs.getString("dislike_mbti"));
	            memb.setAddrx(rs.getString("addr_x"));
	            memb.setAddry(rs.getString("addr_y"));
	            
	            
	            
	            
	            
	      }
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         JDBCClose.close(pstmt, conn); 
	      }
	      
	      return memb;
	   }
   
   
   /**
    * 전체 회원 지도 정보 가져오기
    * */
   
   
   public List<MemberVO> selectAllMapList(String id){
	   List<MemberVO> allmaplist = new ArrayList<>();
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      
	      try {
	         conn = new ConnectionFactory().getConnection();
	         StringBuilder sql = new StringBuilder();
	         sql.append(" select id, name, addr, my_mbti, like_mbti, dislike_mbti, addr_x, addr_y ");
	         sql.append(" from mbti_member ");
	         sql.append(" where id != ? ");
	         
	         pstmt = conn.prepareStatement(sql.toString());
	         pstmt.setString(1, id);
	         ResultSet rs = pstmt.executeQuery();
	                  
	         while(rs.next()) {
	            
	            String id2 = rs.getString("id");
	            String name = rs.getString("name");
	            String addr = rs.getString("addr");
	            String mymbti = rs.getString("my_mbti");
	            String likembti = rs.getString("like_mbti");
	            String dislikembti = rs.getString("dislike_mbti");
	            String addrx = rs.getString("addr_x");
	            String addry = rs.getString("addr_y");
	            
	            MemberVO allmember = new MemberVO(id2, name, addr, mymbti, likembti, dislikembti, addrx, addry);
	         //   System.out.println(allmember);
	            
	            allmaplist.add(allmember);
	      }
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         JDBCClose.close(pstmt, conn);
	      }
	      
	      return allmaplist;
   }
   
   
}