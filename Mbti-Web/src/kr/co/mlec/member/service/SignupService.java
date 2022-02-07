package kr.co.mlec.member.service;

import kr.co.mlec.member.dao.SignupDAO;
import kr.co.mlec.member.vo.MemberVO;
import kr.co.mlec.member.vo.SignupVO;

public class SignupService {
	
	private SignupDAO signupDao;
	
	public SignupService() {
		signupDao = new SignupDAO();
	}
	
	public void signup(MemberVO signupVO) {
		signupDao.signup(signupVO);
		
		
	}
}
