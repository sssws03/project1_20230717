package com.sssws03.rest;

import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sssws03.login.LoginService;

@RestController
public class ResttController {
	
	@Autowired
	private LoginService loginService;
	

	// 아이디 중복검사 2023-08-02
	@PostMapping("/checkID")
	public String checkID(@RequestParam("id") String id) {
		System.out.println(id);
		int result = loginService.checkID(id);
		JSONObject json = new JSONObject();
		json.put("result", result);

		return json.toString();
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
	
	
	
	
	
	
	
	
	
	
	
	
	
}

