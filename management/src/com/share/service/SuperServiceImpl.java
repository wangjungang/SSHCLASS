package com.share.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.share.bean.DefaultResultBean;
import com.share.bean.ResultBean;

public class SuperServiceImpl implements SuperService<Map<String, Object>, Map<String, Object>> {
	
	
	HttpSession session;
	
	@Override
	public Map<String, Object> buildParam(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Map<String, String[]> parameterMaps = request.getParameterMap();
		System.out.println(request.getParameter("method")+"1");
		Map<String, Object> result = new HashMap<String,Object>();
		String[] values;
		session = request.getSession();
		for (Entry<String, String[]> entry : parameterMaps.entrySet()) {
			values = entry.getValue();
			if (values.length > 1) {
				result.put(entry.getKey(), values);
			} else if (values.length == 1) {
				if (!"".equals(values[0])) {
					result.put(entry.getKey(), values[0]);
				}
			}
		}
//		if(null != result.get("delete")){
//			String[] s = (String[]) result.get("delete");
//			for(int i = 0; i < s.length; i ++){
//				System.out.println(s[i]);
//			}
//		}
		System.out.println(result.get("delete"));
		System.out.println(result.get("method")+"2");
		System.out.println(result.get("sPersonName"));		
		return result;
	}

	@Override
	public Map<String, Object> doManagerService(Map<String, Object> param,HttpServletRequest request) {
		// TODO Auto-generated method stub
		session=request.getSession();
		Map<String, Object> resultMap= new HashMap<String,Object>();
		
		Map<String,Object> usermap=(Map<String,Object>)session.getAttribute("sessionMap");
		String position=(String)usermap.get("sPosition");
		
		if("管理员".equals(position)){
			resultMap.put("msg", "");
			
			return resultMap;
		}else if("项目经理".equals(position)){
			resultMap.put("msg", "您的职位是项目经理，此功能需要管理员权限，您没有此权限！");
			
			return resultMap;
		}else if("测试".equals(position)){
			resultMap.put("msg", "您的职位是测试员工，此功能需要管理员权限，您没有此权限！");
			
			return resultMap;
		}else{
			resultMap.put("msg", "您的职位是开发员工，此功能需要管理员权限，您没有此权限！");
			
			return resultMap;
		}
	}
	
	protected ResultBean<?> getResultBean(String method, Map<String, Object> param) {
		// TODO Auto-generated method stub	
		return null;
	}
	
	protected Object getToPage(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> doprojectManagerService(Map<String, Object> param, HttpServletRequest request) {
		// TODO Auto-generated method stub
		session=request.getSession();
		Map<String, Object> resultMap= new HashMap<String,Object>();
		
		Map<String,Object> usermap=(Map<String,Object>)session.getAttribute("sessionMap");
		String position=(String)usermap.get("sPosition");
		
		if("管理员".equals(position)){
			resultMap.put("msg", "您的职位是管理员，此功能需要项目经理权限，您没有此权限！");
			
			return null;
		}else if("项目经理".equals(position)){
			resultMap.put("msg", "");
			
			return resultMap;
		}else if("测试".equals(position)){
			resultMap.put("msg", "您的职位是测试员工，此功能需要项目经理权限，您没有此权限！");
			
			return resultMap;
		}else{
			resultMap.put("msg", "您的职位是开发员工，此功能需要项目经理权限，您没有此权限！");
			
			return resultMap;
		
		}
	}

	@Override
	public Map<String, Object> doEmpService(Map<String, Object> param,HttpServletRequest request) {
		// TODO Auto-generated method stub
		session=request.getSession();
		Map<String, Object> resultMap= new HashMap<String,Object>();
		
		Map<String,Object> usermap=(Map<String,Object>)session.getAttribute("sessionMap");
		String position=(String)usermap.get("sPosition");
		
		if("管理员".equals(position)){
			resultMap.put("msg", "您的职位是管理员，此功能需要员工权限，您没有此权限！");
			
			return null;
		}else if("项目经理".equals(position)){
			resultMap.put("msg", "您的职位是项目经理，此功能需要员工权限，您没有此权限！");
			
			return resultMap;
		}else{
			resultMap.put("msg", "");
			
			return resultMap;
		
		}
	}
	

	
}
