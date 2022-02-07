package kr.co.mlec.board.service;

import java.util.List;

import kr.co.mlec.board.dao.BoardDAO;
import kr.co.mlec.board.vo.BoardFileVO;
import kr.co.mlec.board.vo.BoardVO;

public class BoardService {

	private BoardDAO boardDao;
	
	public BoardService() {
		boardDao = new BoardDAO();
		
	}
	
	/**
	 * 게시글 조회서비스
	 * */
	public List<BoardVO> selectAllBoard(){
		List<BoardVO> list = boardDao.selectAllBoard();
		return list;
		
	}
	
	/**
	 * 게시물 등록 서비스
	 * */
	
	public void insertBoard(BoardVO board) {
		boardDao.insertBoard(board);
	}
	
	/**
	 * 게시물등록(첨부파일포함)서비스
	 * */
	public void insertBoard(BoardVO board, List<BoardFileVO> fileList) {
		//게시물번호(seq_tbl_board_no) 추출
		int boardNo = boardDao.selectBoardNo();
		board.setNo(boardNo);
		
		//tbl_board저장
		board.setNo(boardNo);
		boardDao.insertBoard(board);
		
		//tbl_board_file저장
	
		for(BoardFileVO fileVO : fileList) {
			fileVO.setBoardNo(boardNo);
			boardDao.insertFile(fileVO);
			
			
		}
		
	}
	
	/**
	 * 게시판 상세 서비스
	 * 1. 파라미터로 날라온 번호에 해당 게시물 조회
	 * 2. 파라미터에 해당하는 첨부파일 조회
	*/
	
	public Object[] detailBoard(int no) {
		//1. 
		BoardVO board = boardDao.selectBoardByNo(no);
		//2.
		List<BoardFileVO> fileList = boardDao.selectFileByNo(no);
		
		Object[] arr = {board, fileList};
		
		return arr;
		
		
	}
	
	
}