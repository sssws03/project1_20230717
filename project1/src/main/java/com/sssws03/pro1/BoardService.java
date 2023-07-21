package com.sssws03.pro1;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService") // 8 boardService라고 이름을 지정해줌 8
public class BoardService {

	@Inject
	@Named("boardDAO")
	private BoardDAO boardDAO;
	
	@Autowired
	private Util util;

	// 보드 리스트 불러오는 메소드
	public List<Map<String, Object>> boardList() {
		return boardDAO.boardList(); // 8 이제 DAO 가 대신 일한다 8
	}

	public BoardDTO detail(int bno) {
		BoardDTO dto= boardDAO.detail(bno);
		//검사 : .이 없거나, null이면 실행하지 않게 해주세요.
		if (dto.getBip() !=null && dto.getBip().indexOf(".") != -1) {
		//여기서 ip 뽑아오기;
		String ip = dto.getBip();
		//ip 중간에 하트 넣어주실 수 있죠?//172.30.1.19 ---> 172.♡.1.19
		String[] ipArr = ip.split("[.]"); // ("\\.")
		ipArr[1] = "♡";
		//그거 다시 ip에 저장하기
		dto.setBip(String.join(".", ipArr));
		//끝.
		}
		
		return dto;
	}

	//글쓰기입니다.
	public void write(BoardDTO dto) {
		// btitle을 꺼내줍니다.
		//dto.getBtitle()
		String btitle = dto.getBtitle();
		//값을 변경하겠습니다. replace() < -> &lt; > -> &gt;
		//btitle = btitle.replaceAll("<", "&lt;");
		//btitle = btitle.replaceAll(">", "&gt;");
		
		btitle = util.exchange(btitle);
		
		dto.setBtitle(btitle);
		//다시 저장하기
		//dto.setBtitle(null);
		
		dto.setBip(util.getIp()); //얻어온 ip도 저장해서 데이터베이스로 보내겠습니다.
		
		boardDAO.write(dto); //실행만 시키고 결과를 받지 않습니다.
		//select를 제외한 나머지는 영향받은 행의 수(int)를 받아오기도 합니다.
	}

	public void delete(BoardDTO dto) {
		boardDAO.delete(dto);
	}

	public void edit(BoardDTO dto) {
		
		boardDAO.edit(dto);
		
	}

}
