package com.share.login.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hydrakyoufeng.tool.json.JsonTool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.share.login.service.LoginServiceImpl;

@Controller
public class LoginController {
	
	@Autowired
	private LoginServiceImpl loginService;
	
	@RequestMapping("login.action")
	public ModelAndView doLogin(HttpServletRequest request) throws Exception {	
		Map<String,Object> param = (Map<String, Object>) loginService.buildParam(request);
		Map<String,Object> result = loginService.doLoginService(param,request);
		ModelAndView nav = new ModelAndView((String) result.get("toPage"));
		nav.addAllObjects(result);
		return nav;
	}
}
