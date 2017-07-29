package com.share.emp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.share.emp.service.EmpServiceImpl;

@Controller
public class EmpController {
	
	@Autowired
	private EmpServiceImpl empService;
	
	@RequestMapping("selectemp.action")
	public ModelAndView toEmpList(HttpServletRequest request) throws Exception {	
		Map<String,Object> param = (Map<String, Object>) empService.buildParam(request);
		Map<String,Object> result = empService.getEmpService(param);
		List<Map<String,Object>> emplist = empService.getEmpListService(param);
		ModelAndView nav = new ModelAndView((String) result.get("toPage"));
		request.setAttribute("emplist", emplist);
		nav.addAllObjects(result);
		return nav;
	}
	
	@RequestMapping("addemp.action")
	public ModelAndView toAddEmp(HttpServletRequest request) throws Exception {	
		Map<String,Object> param = (Map<String, Object>) empService.buildParam(request);
		Map<String,Object> result = empService.addService(param);
		ModelAndView nav = new ModelAndView((String) result.get("toPage"));
		nav.addAllObjects(result);
		return nav;
	}
	
	@RequestMapping("deleteRow.action")
	public ModelAndView deleteRowEmp(HttpServletRequest request) throws Exception {	
		Map<String,Object> param = (Map<String, Object>) empService.buildParam(request);
		Map<String,Object> result = empService.deleteRowService(param);
		ModelAndView nav = new ModelAndView((String) result.get("toPage"));
		nav.addAllObjects(result);
		return nav;
	}
	
	@RequestMapping("updateRow.action")
	public ModelAndView updateRowEmp(HttpServletRequest request) throws Exception {	
		Map<String,Object> param = (Map<String, Object>) empService.buildParam(request);
		Map<String,Object> result = empService.updateRowService(param);
		ModelAndView nav = new ModelAndView((String) result.get("toPage"));
		nav.addAllObjects(result);
		return nav;
	}
	
	@RequestMapping("getRow.action")
	public ModelAndView getRowEmp(HttpServletRequest request) throws Exception {	
		Map<String,Object> param = (Map<String, Object>) empService.buildParam(request);
		Map<String,Object> result = empService.getRowService(param);
		ModelAndView nav = new ModelAndView((String) result.get("toPage"));
		nav.addAllObjects(result);
		return nav;
	}
	@RequestMapping("getDetails.action")
	public ModelAndView getDetailEmp(HttpServletRequest request) throws Exception {	
		Map<String,Object> param = (Map<String, Object>) empService.buildParam(request);
		Map<String,Object> result = empService.getRowService(param);
		ModelAndView nav = new ModelAndView("/detailemp.jsp");
		nav.addAllObjects(result);
		return nav;
	}
}
