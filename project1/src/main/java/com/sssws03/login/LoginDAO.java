package com.sssws03.login;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO {

	@Autowired
	private SqlSession sqlSession;

	public LoginDTO login(LoginDTO dto) {
		return sqlSession.selectOne("login.login", dto);
	}

	public int join(JoinDTO joinDTO) {
		return sqlSession.insert("login.join", joinDTO);
	}

	public List<JoinDTO> members() {
		return sqlSession.selectList("login.members");
	}

	public int checkID(String id) {
		return sqlSession.selectOne("login.checkID", id);
	}

	public List<Map<String, Object>> boardList2() {
		return sqlSession.selectList("login.boardList2");
	}
}
