package com.sssws03.pro1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class indexController {
		
	//첫화면로딩 : index.jsp 호출
		@GetMapping(value = {"/", "/index"})
		public String index() {
			return "index"; //데이터 붙임없이 index.jsp페이지만 보여줍니다.
		}
}
