package kr.co.mlec.board.service;

import java.util.List;

import kr.co.mlec.board.dao.BoardDAO;
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
	
	
}
