package com.sssws03.comment;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommentController {
	@Autowired
	private CommentService commentService;

	@PostMapping("/comment")
	public String comment(@RequestParam Map<String, Object> map, HttpSession session) {
		// System.out.println(map);
		// 로그인 한 여부 확인하기
		if (session.getAttribute("mid") != null) {
			// 로그인 한 사람의 mid값을 뽑아서 map에 저장하기
			System.out.println(session.getAttribute("mid"));
			map.put("mid", session.getAttribute("mid"));
			int result = commentService.commentInsert(map);
			if (result == 1) {
				return "redirect:/detail?bno=" + map.get("bno");

			} else {
				return "warning";
			}
		} else {
			return "warning";
		}

	}
}
