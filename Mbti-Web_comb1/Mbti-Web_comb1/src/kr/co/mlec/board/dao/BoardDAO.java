package kr.co.mlec.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.mlec.board.vo.BoardFileVO;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.board.vo.Paging2VO;
import kr.co.mlec.board.vo.PagingVO;
import kr.co.mlec.util.ConnectionFactory;
import kr.co.mlec.util.JDBCClose;

/**
 * 게시판 DB(tbl_board) CRUD
 * @author user
 *
 *사실 여기는 board라고 이름 붙일 필요 없고 boardservice에서 board로 쓰는게 나음
 *
 */
/**
 * 게시판 DB(tbl_board) CRUD
 * 
 * @author user
 *
 *         사실 여기는 board라고 이름 붙일 필요 없고 boardservice에서 board로 쓰는게 나음
 *
 */

public class BoardDAO {

	/**
	 * 전체 게시글 조회 (페이징 추가)
	 */
	public List<BoardVO> selectAllBoard(PagingVO paging) {

		List<BoardVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();

			sql.append(" select * ");
			sql.append(" from ( ");
			sql.append(" select rownum rnum, b.* ");
			sql.append(" from ( ");
			sql.append(" select no, title, writer, content, view_cnt, reg_date ");
			sql.append(" from tbl_board ");
			sql.append(" ORDER by no desc ");
			sql.append(" ) b ) ");
			sql.append(" where rnum >= ? and rnum <= ? ");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, paging.getStartNum());
			pstmt.setInt(2, paging.getEndNum());
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				int viewCnt = rs.getInt("view_cnt");
				String regDate = rs.getString("reg_date");
				BoardVO board = new BoardVO(no, title, writer, viewCnt, regDate);

				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}

		return list;
	}

	/**
	 * 새글 등록
	 * 
	 */

	public void insertBoard(BoardVO board) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into tbl_board(no, title, writer, content, ref) ");
			sql.append(" values(?, ?, ?, ?, ?) ");
			pstmt = conn.prepareStatement(sql.toString());

			pstmt.setInt(1, board.getNo());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getWriter());
			pstmt.setString(4, board.getContent());
			pstmt.setInt(5,  board.getNo());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}
	}

	/**
	 * 게시글 상세보기
	 * 
	 */
	public BoardVO detailBoard(int boardNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		BoardVO board = null;

		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select no, title, writer, content, view_cnt ");
			sql.append("  , to_char(reg_date, 'yyyy-mm-dd') reg_date ");
			sql.append(" from tbl_board ");
			sql.append(" where no = ? ");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, boardNo);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				int viewCnt = rs.getInt("view_cnt");
				String regDate = rs.getString("reg_date");

				board = new BoardVO(no, title, writer, content, viewCnt, regDate);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}
		return board;

	}
	/**
	 * 첨부파일
	 */
	public List<BoardFileVO> selectFileByNo(int boardNo) {

		List<BoardFileVO> fileList = new ArrayList<>();

		StringBuilder sql = new StringBuilder();
		sql.append("select no, file_ori_name, file_save_name, file_size ");
		sql.append(" from tbl_board_file ");
		sql.append(" where board_no = ?");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setInt(1, boardNo);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardFileVO fileVO = new BoardFileVO();
				fileVO.setNo(rs.getInt("no"));
				fileVO.setFileOriName(rs.getString("file_ori_name"));
				fileVO.setFileSaveName(rs.getString("file_save_name"));
				fileVO.setFileSize(rs.getInt("file_size"));

				fileList.add(fileVO);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return fileList;
	}
	
	
	/**
	 * 게시글 수정 (제목, 작성자, 내용 날아옴)
	 * 
	 */
	public void updateBoard(BoardVO board) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("update tbl_board ");
			sql.append(" set title = ?, content = ? ");
			sql.append(" where no = ? ");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getNo());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}

	}

	/**
	 * 조회수 업데이트
	 */
	public void updateCnt(int boardNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("update tbl_board set view_cnt = view_cnt+1 ");
			sql.append(" where no = ? ");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, boardNo);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}
	}

	/**
	 * 파일 추가
	 */
	public void insertFile(BoardFileVO fileVO) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into tbl_board_file( ");
		sql.append(" no, board_no, file_ori_name ");
		sql.append(" , file_save_name, file_size ");
		sql.append(" ) ");
		sql.append(" values(seq_tbl_board_file_no.nextval, ?, ?, ?, ? ) ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setInt(1, fileVO.getBoardNo());
			pstmt.setString(2, fileVO.getFileOriName());
			pstmt.setString(3, fileVO.getFileSaveName());
			pstmt.setInt(4, fileVO.getFileSize());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * 게시물번호 추출(seq_tbl_board_no)
	 * */
	public int selectBoardNo() {
		String sql = " select seq_tbl_board_no.nextval from dual ";
		int boardNo = 0;
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
		){
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			boardNo = rs.getInt(1);
			
		}catch(Exception e) {
				e.printStackTrace();
		}
		return boardNo;
	}

	/**
	 * 게시판번호에 해당 게시글 조회
	 */
	public BoardVO selectBoardByNo(int boardNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		BoardVO board = null;	//return�Ϸ��� �ϴ� ���� try ���� �־�� �Ѵ�.
		
		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select no, title, writer, content, view_cnt ");
			sql.append("	, to_char(reg_date,'yyyy-mm-dd') reg_date ");
			sql.append(" from tbl_board ");
			sql.append(" where no=? ");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1,boardNo);
			pstmt.executeQuery();

			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next())	{//if rs.next()�� ������, �������� ����. �׷��� �ϳ��� ��ȸ�ϰ� �������� board�� ����
			int no=rs.getInt("no");//"no"�� Į����
			String title = rs.getString("title");
			String writer = rs.getString("writer");
			String content = rs.getString("content");
			int viewCnt = rs.getInt("view_cnt");
			String regDate = rs.getString("reg_date");
				
			board = new BoardVO(no, title, writer, content, viewCnt, regDate);//board�� ����ȸ�� �Խñ��� ������ ����.
			}

			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCClose.close(pstmt, conn);
		}return board;
		
		
	}
		

	/**
	 * 총 게시물 갯수
	 */

	public int getAllCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int count = 0;

		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT COUNT(*) as count FROM tbl_board ");

			pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt("count");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}

		return count;
	}

	/**
	 * 검색글  총갯수
	 */

	public int getSearchCount(String choice, String word) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int scount = 0;

		try {
			conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			
			 if (choice.equals("writer")) {
	            sql.append("SELECT count(*) as scount from tbl_board "); 
	            sql.append(" WHERE writer LIKE '%" + word + "%' ");
	            pstmt = conn.prepareStatement(sql.toString());
	                
	            
	            } else if (choice.equals("title")) {
	            	sql.append("SELECT count(*) as scount from tbl_board "); 
	            sql.append(" WHERE title LIKE '%" + word + "%' ");
	            System.out.println(sql.toString());
	                pstmt = conn.prepareStatement(sql.toString());
	               
	                
	            } else if (choice.equals("content")) {
	            	sql.append("SELECT count(*) as scount from tbl_board "); 
	            sql.append(" WHERE content LIKE '%" + word + "%' ");
	            pstmt = conn.prepareStatement(sql.toString());

	                
	            } else if (choice.equals("titleNcontent")) {
	            	sql.append("SELECT count(*) as scount from tbl_board "); 
	           sql.append(" WHERE title LIKE '%" + word + "%' OR content LIKE '%" + word + "%' ");
	           pstmt = conn.prepareStatement(sql.toString());
	            }
			
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				scount = rs.getInt("scount");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}
		
		System.out.println("scount = " + scount);

		return scount;
	}
	/**
	 * 게시글 삭제
	 * 
	 */
	public void deleteBoard(int no) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = " delete from tbl_board where no = ? ";

		try {
			conn = new ConnectionFactory().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCClose.close(pstmt, conn);
		}
	}

	/**
	 * 게시글 검색기능
	 * 
	 */
	
	public List<BoardVO> searchByOneBoard(String choice, String word, Paging2VO paging) {
        List<BoardVO> list = new ArrayList<BoardVO>();
 
        Connection conn = null;
        PreparedStatement pstmt = null;
        
       
        try {
    		conn = new ConnectionFactory().getConnection();
			StringBuilder sql = new StringBuilder();
			
			System.out.println("dao dao choice : " + choice);
			
            if (choice.equals("writer")) {
            	sql.append(" select * ");
    			sql.append(" from ( ");
    			sql.append(" select rownum rnum, b.* ");
    			sql.append(" from ( ");
    			sql.append(" SELECT no, title, writer, content, view_cnt, reg_date ");
                sql.append(" FROM tbl_board");
                sql.append(" WHERE writer LIKE '%" + word + "%' ");
                sql.append(" ORDER BY reg_date DESC");
    			sql.append(" ) b ) ");
    			sql.append(" where rnum >= ? and rnum <= ? ");
                pstmt = conn.prepareStatement(sql.toString());
                
            } else if (choice.equals("title")) {
            	sql.append(" select * ");
    			sql.append(" from ( ");
    			sql.append(" select rownum rnum, b.* ");
    			sql.append(" from ( ");
            	sql.append(" SELECT no, title, writer, content, view_cnt, reg_date ");
                sql.append(" FROM tbl_board ");
                sql.append(" WHERE title LIKE '%" + word + "%' ");
                sql.append(" ORDER BY reg_date DESC ");
                sql.append(" ) b ) ");
    			sql.append(" where rnum >= ? and rnum <= ? ");
                System.out.println(sql.toString());
                pstmt = conn.prepareStatement(sql.toString());
               
                
            } else if (choice.equals("content")) {
            	sql.append(" select * ");
    			sql.append(" from ( ");
    			sql.append(" select rownum rnum, b.* ");
    			sql.append(" from ( ");
            	sql.append(" SELECT no, title, writer, content, view_cnt, reg_date ");
                sql.append(" FROM tbl_board ");
                sql.append(" WHERE content LIKE '%" + word + "%' ");
                sql.append(" ORDER BY reg_date DESC ");
                sql.append(" ) b ) ");
    			sql.append(" where rnum >= ? and rnum <= ? ");
                pstmt = conn.prepareStatement(sql.toString());

                
            } else if (choice.equals("titleNcontent")) {
            	sql.append(" select * ");
    			sql.append(" from ( ");
    			sql.append(" select rownum rnum, b.* ");
    			sql.append(" from ( ");
            	sql.append(" SELECT no, title, writer, content, view_cnt, reg_date ");
                sql.append(" FROM tbl_board ");
                sql.append(" WHERE title LIKE '%" + word + "%' OR content LIKE '%" + word + "%' ");
                sql.append(" ORDER BY reg_date DESC ");
                sql.append(" ) b ) ");
    			sql.append(" where rnum >= ? and rnum <= ? ");
                pstmt = conn.prepareStatement(sql.toString());
                
            } 
        	
			pstmt.setInt(1, paging.getStartNum());
			pstmt.setInt(2, paging.getEndNum());
			
			System.out.println("startnum =" + paging.getStartNum());
			
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				int viewCnt = rs.getInt("view_cnt");
				String regDate = rs.getString("reg_date");
				
				BoardVO board = new BoardVO(no, title, writer, viewCnt, regDate);

				list.add(board);
 

            }
 
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCClose.close(pstmt, conn);
        }
 
        return list;
    }
	/**
	 * 게시글 조회 카운트
	 */
	
	public void readCountUp(int boardNo) {
	      

	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      
	      try {
	    	 conn = new ConnectionFactory().getConnection();
	    	 
	         StringBuilder sql = new StringBuilder();
	         sql.append(" update tbl_board set view_cnt = view_cnt +1 ");
	         sql.append(" where no = ? ");
	         pstmt= conn.prepareStatement(sql.toString());
	         pstmt.setInt(1, boardNo);
	         
	         pstmt.executeUpdate();
	         
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	         
	      }finally {
	         JDBCClose.close(pstmt, conn);
	      }
	      
	}


	
	/*
	    * 답글
	   */
	   public int replyBoard(BoardVO board) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      conn = new ConnectionFactory().getConnection();
	            
	      // 게시글물의 가장 큰 순번을 조회
	      String maxSql = " select max(no) from tbl_board ";

	      int result = 0 ;
	      int ref = board.getNo();

	      try {
	         
	         pstmt = conn.prepareStatement(maxSql);
	         ResultSet rs = pstmt.executeQuery();
	         int no = 0; // 리턴할 결과를 저장할 변수
	         if(rs.next()) {
	            no = rs.getInt(1) + 1;
	         }else {
	            no = 1;
	         }
	      
	         System.out.println(board.getRef());
	         int reStep = board.getReStep();
	         int reLevel = board.getReLevel();
	      
	      
	      //해당 게시물의 기존 답글의 순번을 하나씩 증가시킴
	      String sql = " update tbl_board set re_level = re_level + 1 where ref = ? and re_step > ? ";
	      pstmt = conn.prepareStatement(sql);

	      pstmt.setInt(1, ref);
	      pstmt.setInt(2, reStep);
	      
	      result = pstmt.executeUpdate();
	      
	     // reStep = reStep + 1;
	     // reLevel = reLevel + 1;
	      
	      //답글을 등록
	      sql = "insert into tbl_board(no, title, writer, content, ref, re_step, re_level) values(?, ?, ?, ?, ?, ?, ?) ";
	      
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, no);
	         pstmt.setString(2, board.getTitle());
	         pstmt.setString(3, board.getWriter());
	         pstmt.setString(4, board.getContent());
	         pstmt.setInt(5, ref);
	         pstmt.setInt(6, reStep + 1);
	         pstmt.setInt(7, reLevel + 1);
	         
	         result = pstmt.executeUpdate();

	         }catch (Exception e) {
	            e.printStackTrace();
	         }finally {
	            JDBCClose.close(pstmt, conn);
	         } return result;
	      }
	          
	
	
	
	/**
	 * 댓글달기 
	 */
	
//	public void insertComment(CommentDAO dao)
//}
}
