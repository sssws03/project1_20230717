package com.sssws03.pro1;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
	// user -> Controller -> Service -> DAO -> mybatis -> DB
	
	//Autowired 말고  Resource로 연결
	@Resource(name="boardService") //8 보드 서비스.java 에 적은 네임 가져오기 8
	private BoardService boardService;
	
	@GetMapping("/board")
	public String board(Model model) {
		//서비스에서 값 가져오기
		model.addAttribute("list", boardService.boardList());
		//boardService.boardList(); // 8 model에 값 넣기 8
		
		return "board";
	}
	//http://localhost:8080/pro1/detail?bno=112
	//파라미터로 들어오는 값 잡기
	@GetMapping("/detail") //Modeldms jsp에 값을 붙이기 위해서 넣었습니다. 8지금 당장 DB에 필요한 것은 아님 *
	public String detail(HttpServletRequest request, Model model) {
		String bno = request.getParameter("bno");
		//bno에 요청하는 값이 있습니다. 이 값을 db까지 보내겠습니다.
		//System.out.println("bno : " + bno);
		BoardDTO dto = boardService.detail(bno);
		model.addAttribute("dto", dto);
		
		return "detail";
	}
}
