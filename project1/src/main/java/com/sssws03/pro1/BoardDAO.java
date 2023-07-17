package com.sssws03.pro1;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

//Inject 사용해 보기

@Repository("boardDAO")
public class BoardDAO {
	@Inject
	@Named("sqlSession")
	private SqlSession sqlSession;
	
	public List<Map<String, Object>> boardList(){
		return sqlSession.selectList("board.boardList");
	}

	public BoardDTO detail(String bno) {
		return sqlSession.selectOne("board.detail", bno); //앞에는 네임스페이스.아이디, 값
	}
}
