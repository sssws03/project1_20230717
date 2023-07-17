package com.sssws03.pro1;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

@Service("boardService") // 8 boardService라고 이름을 지정해줌 8
public class BoardService {

	@Inject
	@Named("boardDAO")
	private BoardDAO boardDAO;

	// 보드 리스트 불러오는 메소드
	public List<Map<String, Object>> boardList() {
		return boardDAO.boardList(); // 8 이제 DAO 가 대신 일한다 8
	}

	public BoardDTO detail(String bno) {
		
		return boardDAO.detail(bno);
	}

}
