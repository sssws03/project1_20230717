package com.sssws03.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class indexController {
		
	//첫화면로딩 : index.jsp 호출
		@GetMapping(value = {"/", "/index"})
		public String index() {
			return "index"; //데이터 붙임없이 index.jsp페이지만 보여줍니다.
		}
		
		@GetMapping("/board2")
		public String menu() {
			return "board2";
}
		@GetMapping("/mooni")
		public String mooni() {
			return "mooni";
		}
		@GetMapping("/notice")
		public String notice() {
			return "notice";
		}
}
		
