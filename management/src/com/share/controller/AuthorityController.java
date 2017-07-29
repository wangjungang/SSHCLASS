package com.share.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.share.service.SuperServiceImpl;

@Controller
public class AuthorityController {
	
	@Autowired
	private SuperServiceImpl superService;
	
	@RequestMapping("managerauthority.action")
	public ModelAndView toManagerAuthority(HttpServletRequest request) throws Exception {	
		System.out.println("验证是否为管理员权限----");
		Map<String,Object> param = (Map<String, Object>) superService.buildParam(request);
		Map<String,Object> result = superService.doManagerService(param,request);
		if("".equals((String)result.get("msg"))){
			System.out.println("是管理员权限----");
			
			return null;
		}else{
			result.put("toPage", "/noAuthority.jsp");
			ModelAndView nav = new ModelAndView((String) result.get("toPage"));
			nav.addAllObjects(result);
			
			return nav;
		}
	}
	
	@RequestMapping("projectmanagerauthority.action")
	public ModelAndView toprojectManagerAuthority(HttpServletRequest request) throws Exception {	
		System.out.println("验证是否为项目经理权限----");
		Map<String,Object> param = (Map<String, Object>) superService.buildParam(request);
		Map<String,Object> result = superService.doprojectManagerService(param,request);
		if("".equals((String)result.get("msg"))){
			System.out.println("是项目经理权限----");
			
			return null;
		}else{
			result.put("toPage", "/noAuthority.jsp");
			ModelAndView nav = new ModelAndView((String) result.get("toPage"));
			nav.addAllObjects(result);
			
			return nav;
		}
	}
	
	@RequestMapping("empauthority.action")
	public ModelAndView toEmpAuthority(HttpServletRequest request) throws Exception {	
		System.out.println("验证是否为员工权限----");
		Map<String,Object> param = (Map<String, Object>) superService.buildParam(request);
		Map<String,Object> result = superService.doEmpService(param,request);
		if("".equals((String)result.get("msg"))){
			System.out.println("是员工权限----");
			
			return null;
		}else{
			result.put("toPage", "/noAuthority.jsp");
			ModelAndView nav = new ModelAndView((String) result.get("toPage"));
			nav.addAllObjects(result);
			
			return nav;
		}
	}
}
