package com.share.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.share.project.service.ProjectServiceImpl;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectServiceImpl projectService;
	/*
	 * 查询项目列表
	 */
	@RequestMapping("selectproject.action")
	public ModelAndView toProjectList(HttpServletRequest request) throws Exception {	
		Map<String,Object> param = (Map<String, Object>) projectService.buildParam(request);
		Map<String,Object> result = projectService.getProjectService(param);
		List<Map<String,Object>> projectlist = projectService.getProjectListService(param);
		ModelAndView nav = new ModelAndView((String) result.get("toPage"));
		request.setAttribute("projectlist", projectlist);
		nav.addAllObjects(result);
		return nav;
	}
	
	/*
	 * 查询项目分配列表
	 */
	@RequestMapping("selectprojectallot.action")
	public ModelAndView toProjectAllotList(HttpServletRequest request) throws Exception {	
		Map<String,Object> param = (Map<String, Object>) projectService.buildParam(request);
		Map<String,Object> result = projectService.getProjectService(param);
		//List<Map<String,Object>> projectlist = projectService.getProjectListService(param);
		List<Map<String,Object>> projectlist = projectService.getProjectListService(param);
		System.out.println("-----------projectlist测试---------");
		ModelAndView nav = new ModelAndView("/allotlist.jsp");
		request.setAttribute("projectlist", projectlist);
		nav.addAllObjects(result);
		return nav;
	}
	
	/*
	 * 查询项目进度列表
	 */
	@RequestMapping("selectprojectprogress.action")
	public ModelAndView toProjectProgressList(HttpServletRequest request) throws Exception {	
		Map<String,Object> param = (Map<String, Object>) projectService.buildParam(request);
		Map<String,Object> result = projectService.getProjectService(param);
		/**
		 * 将session中的当前用户的id放到参数中，查询出属于当前用户权限以内的列表及功能
		 */
		HttpSession session=request.getSession();
		Map<String,Object> userMap=(Map<String,Object>)session.getAttribute("sessionMap");
		param.put("userId", userMap.get("iId"));
		System.out.println(param);
		List<Map<String,Object>> projectlist = projectService.getProjectPersonListService(param);
		if(projectlist.size()==0){
			result.put("msg", "您还没有被项目经理分配项目！");
		}
		ModelAndView nav = new ModelAndView("/progressselect.jsp");
		request.setAttribute("projectlist", projectlist);
		nav.addAllObjects(result);
		return nav;
	}
	
	/*
	 * 查询项目评价列表
	 */
	@RequestMapping("selectprojectassess.action")
	public ModelAndView toProjectAssessList(HttpServletRequest request) throws Exception {	
		Map<String,Object> param = (Map<String, Object>) projectService.buildParam(request);
		Map<String,Object> result = projectService.getProjectService(param);
		List<Map<String,Object>> projectlist = projectService.getProjectListService(param);
		ModelAndView nav = new ModelAndView("/projectassess.jsp");
		request.setAttribute("projectlist", projectlist);
		nav.addAllObjects(result);
		return nav;
	}
	
	/*
	 * 添加项目列表
	 */
	@RequestMapping("addproject.action")
	public ModelAndView toAddProject(HttpServletRequest request) throws Exception {	
		Map<String,Object> param = (Map<String, Object>) projectService.buildParam(request);
		Map<String,Object> result = projectService.addService(param);
		ModelAndView nav = new ModelAndView((String) result.get("toPage"));
		nav.addAllObjects(result);
		return nav;
	}
	/*
	 * 删除项目列表
	 */
	@RequestMapping("deleteprojectRow.action")
	public ModelAndView deleteRowProject(HttpServletRequest request) throws Exception {
		Map<String,Object> param = (Map<String, Object>) projectService.buildParam(request);
		System.out.println("----------删除参数测试");
		System.out.println(param);
		Map<String,Object> result=new HashMap<String,Object>();
		Map<String,Object> rmap=projectService.getRowService(param);
		if("已完成".equals(rmap.get("sSpeed"))){
			result.put("msg", "由于此项目已经完成，所以不能删除！");
			ModelAndView nav = new ModelAndView((String) result.get("toPage"));
			nav.addAllObjects(result);
			
			return nav;
		}else{
			result.putAll(projectService.deleteRowService(param));
			ModelAndView nav = new ModelAndView((String) result.get("toPage"));
			nav.addAllObjects(result);
			return nav;
		}
	}
	
	/**
	 * Ajax判断方法
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("Ajax.action")
	public ModelAndView ajax(HttpServletRequest request,HttpServletResponse response) throws Exception {	
		System.out.println("json返回跳转");
		Map<String,Object> param = (Map<String, Object>) projectService.buildParam(request);
		System.out.println(param);
		Map<String,Object> rmap=projectService.getRowService(param);
		if("已完成".equals(rmap.get("sSpeed"))){
			rmap.put("msg", "由于此项目已经完成，所以不能修改！");
			ModelAndView nav = new ModelAndView("/noAuthority.jsp");
			nav.addAllObjects(rmap);
			
			return nav;
		}else{
			response.setContentType("application/json");
			response.getWriter().print("");
			
			return null;
		}
	}
	/*
	 * 修改项目列表
	 */
	@RequestMapping("updateprojectRow.action")
	public ModelAndView updateRowProject(HttpServletRequest request) throws Exception {	
		Map<String,Object> param = (Map<String, Object>) projectService.buildParam(request);
		System.out.println(param);
		Map<String,Object> rmap=projectService.getRowService(param);
		Map<String,Object> result=new HashMap<String,Object>();
		if("已完成".equals(rmap.get("sSpeed"))){
			result.put("msg", "由于此项目已经完成，所以不能修改！");
			ModelAndView nav = new ModelAndView((String) result.get("toPage"));
			nav.addAllObjects(result);
			
			return nav;
		}else{
			result.putAll(projectService.updateRowService(param));
			ModelAndView nav = new ModelAndView((String) result.get("toPage"));
			nav.addAllObjects(result);
			return nav;
		}
	}
	
	/*
	 * 得到一行项目列表
	 */
	@RequestMapping("getprojectRow.action")
	public ModelAndView getRowProject(HttpServletRequest request) throws Exception {	
		Map<String,Object> param = (Map<String, Object>) projectService.buildParam(request);
		Map<String,Object> result = projectService.getRowService(param);
		ModelAndView nav = new ModelAndView((String) result.get("toPage"));
		nav.addAllObjects(result);
		return nav;
	}
	/*
	 * 得到一行项目进度列表
	 */
	@RequestMapping("getprojectprogressRow.action")
	public ModelAndView getProgressRowProject(HttpServletRequest request) throws Exception {	
		Map<String,Object> param = (Map<String, Object>) projectService.buildParam(request);
		Map<String,Object> result = projectService.getRowService(param);
		ModelAndView nav = new ModelAndView("/progresssubmit.jsp");
		nav.addAllObjects(result);
		return nav;
	}
	/*
	 * 得到一行项目评价列表
	 */
	@RequestMapping("getprojectassessRow.action")
	public ModelAndView getAssessRowProject(HttpServletRequest request) throws Exception {	
		Map<String,Object> param = (Map<String, Object>) projectService.buildParam(request);
		Map<String,Object> result = projectService.getRowService(param);
		ModelAndView nav = new ModelAndView("/projectassesssubmit.jsp");
		nav.addAllObjects(result);
		return nav;
	}
	/*
	 * 得到一行项目分配列表
	 */
	@RequestMapping("getprojectallotRow.action")
	public ModelAndView getAllotRowProject(HttpServletRequest request) throws Exception {	
		Map<String,Object> param = (Map<String, Object>) projectService.buildParam(request);
		param.put("sPosition",(String)param.get("sPosition")+"员工");
		System.out.println("------------员工类型参数");
		System.out.println(param);
		Map<String,Object> result = projectService.getRowService(param);
		List<Map<String,Object>> emplist=projectService.getProjectType(param);
		ModelAndView nav = new ModelAndView("/allot.jsp");
		request.setAttribute("emplist", emplist);
		nav.addAllObjects(result);
		return nav;
	}
	
}
