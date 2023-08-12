package com.sssws03.rest;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sssws03.board.BoardService;
import com.sssws03.login.LoginService;
import com.sssws03.util.Util;

@RestController
public class ResttController {
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private Util util;
	

	// 아이디 중복검사 2023-08-02
	@PostMapping("/checkID")
	public String checkID(@RequestParam("id") String id) {
		System.out.println(id);
		int result = loginService.checkID(id);
		JSONObject json = new JSONObject();
		json.put("result", result);

		return json.toString();
	}
	
	//자바스크립트로 만든 것.
	@PostMapping("/checkID2")
	public String checkID2(@RequestParam("id")String id) {
		int result = loginService.checkID(id);
		return result+"";
	}
	
	//boardList2
	@GetMapping(value = "/boardList2", produces = "application/json; charset=UTF-8")
	public String boardList2(@RequestParam("pageNo") int pageNo) {
		//System.out.println("jq가 보내주는 : " + pageNo);
		
		List<Map<String, Object>> list = loginService.boardList2((pageNo - 1) * 10);
		JSONObject json = new JSONObject();
		JSONArray arr = new JSONArray(list);
		json.put("totalCount", loginService.totalCount());
		json.put("pageNo", pageNo);
		json.put("list", arr);
		//System.out.println(json.toString());
		
		return json.toString();
	}
	
	/*
	 *  boardList2 = { totalCount : 128, 
	 *  				pageNo:1, 
	 *  				list : [
	 *  							{bno:1, btitle:....}
	 *  							{bno:1, btitle:....},
	 *  							{bno:1, btitle:....},
	 *  							{bno:1, btitle:....},
	 *  							{bno:1, btitle:....}
	 *  						]
	 *  			}
	 * 
	 * 
	 * 객체 : {키 : 값, 이름 : 값,..............}
	 * 
	 */
	
	
	
	@PostMapping("/cdelR")
	public String cdelR(@RequestParam Map<String, Object> map, HttpSession session) {
		//if문 추가하기
		int result = 0;
		map.put("mid", session.getAttribute("mid"));
		System.out.println(map);
		
		result = boardService.cdel(map);
		JSONObject json = new JSONObject();
		json.put("result", result);
		
		return json.toString();
			}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	


