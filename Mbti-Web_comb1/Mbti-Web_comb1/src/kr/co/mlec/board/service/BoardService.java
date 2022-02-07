package kr.co.mlec.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.mlec.board.dao.BoardDAO;
import kr.co.mlec.board.vo.BoardFileVO;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.board.vo.Paging2VO;
import kr.co.mlec.board.vo.PagingVO;
import kr.co.mlec.member.dao.MemberDAO;
import kr.co.mlec.member.vo.MemberVO;

public class BoardService {

	private BoardDAO boardDao; // 모든 보드dao 가져와야하니까 만들어줌
	private MemberDAO memberDao;
	
	public BoardService() {
		boardDao = new BoardDAO(); // 인스턴스 객체 생성
		memberDao = new MemberDAO();
	}

	/**
	 * 전체게시글 보기 서비스
	 */
	public List<BoardVO> selectAllBoard(PagingVO paging) {
		List<BoardVO> list = boardDao.selectAllBoard(paging);
		return list;
	}

	/**
	 * 새글 등록 서비스
	 */
	public void insertBoard(BoardVO board) {
		boardDao.insertBoard(board);
	}

	
	/**
	 * 게시물 등록(첨부파일포함) 서비스
	 */
	public void insertBoard(BoardVO board, List<BoardFileVO> fileList) {

		// 게시물 번호(seq_tbl_board_no) 추출
		int boardNo = boardDao.selectBoardNo();

		// tbl_board 저장
		board.setNo(boardNo);
		boardDao.insertBoard(board);

		// tbl_board_file 저장
		for (BoardFileVO fileVO : fileList) {
			fileVO.setBoardNo(boardNo);
			boardDao.insertFile(fileVO);
		}

	}

	/**
	 * 상세 게시글 조회 서비스
	 * 
	 * public BoardVO selectBoardByNo(int boardNo) { BoardVO vo =
	 * boardDao.selectBoardByNo(boardNo); return vo; }
	 */

	/*
	 * public Object[] detailBoard(int no) { // 1. BoardVO board =
	 * boardDao.selectBoardByNo(no); // 2. List<BoardFileVO> fileList =
	 * boardDao.selectFileByNo(no);
	 * 
	 * Object[] arr = {board, fileList};
	 * 
	 * return arr; }
	 */

	/**
	 * 게시글 상세 서비스 1. 파라미터로 날라온 번호에 해당 게시물 조회 2. 파라미터에 해당하는 첨부파일 조회
	 */
	public Map<String, Object> detailBoard(int boardNo) {
		// 1.
		BoardVO board = boardDao.detailBoard(boardNo);
		boardDao.updateCnt(boardNo);
		// 2.
		List<BoardFileVO> fileList = boardDao.selectFileByNo(boardNo);

		Map<String, Object> data = new HashMap<>();
		data.put("board", board);
		data.put("fileList", fileList);

		return data;
	}

	public Object[] detailBoard2(int no) {
		//1. 
		BoardVO board = boardDao.selectBoardByNo(no);
		//2.
		List<BoardFileVO> fileList = boardDao.selectFileByNo(no);
		
		Object[] arr = {board, fileList};
		
		return arr;
		
		
	}
		
	/**
	 * 게시물 수정 서비스
	 */
	public void updateBoard(BoardVO board) {
		boardDao.updateBoard(board);
		
	}
	

	/**
	 * update용
	 * 
	 * @param board
	 */
	public BoardVO selectBoard(int no) {
		BoardVO board = boardDao.detailBoard(no);
		return board;
	}

	
	/**
	 * 게시물 삭제 서비스
	 */
	public void deleteBoard(int no) {
		boardDao.deleteBoard(no);

	}

	
	/**
	 * 게시물 검색 서비스
	 * 
	 * 
	 */
	public List<BoardVO> searchByOneBoard(String choice, String word, Paging2VO paging2) {
		List<BoardVO> sbList = boardDao.searchByOneBoard(choice, word, paging2);

		return sbList;
	}
	
	/**
	 * 지도정보서비스
	 * */
	public List<MemberVO> selectMbti(){
		
	List<MemberVO> list = memberDao.getMemberList();
	
	return list;
	
	}	
	
	/*
	    * 답글 서비스
	    */
	   public void replyBoard(BoardVO board) {
	      boardDao.replyBoard(board);
	   }
	   
	}

