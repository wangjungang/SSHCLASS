package com.share.login.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import com.opensymphony.xwork2.ActionContext;
import com.share.login.DAO.LoginDAO;

public class LoginServiceImpl implements
		LoginService<Map<String, Object>, Map<String, Object>> {

	@Autowired
	private LoginDAO<Map<String, Object>> loginDAO;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Override
	public LoginDAO<Map<String, Object>> getLoginDAO() {
		// TODO Auto-generated method stub
		return this.loginDAO;
	}
	
	HttpSession session;

	@Override
	public Map<String, Object> buildParam(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		System.out.println(name+"---"+pwd);
		Map<String, String[]> parameterMaps = request.getParameterMap();
		Map<String, Object> result = new HashMap<String, Object>();
		String[] values;
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
		System.out.println(request.getParameter("sLoginName"));
		System.out.println(request.getParameter("sPassword"));
		
		return result;
	}

	public Map<String, Object> doLoginService(Map<String, Object> param,HttpServletRequest request) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> resultPassword = getLoginDAO().getPassword(param);
		System.out.println(resultPassword);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if (resultPassword.size() == 0) {
			resultMap.put("toPage","/login.jsp");
			resultMap.put("msg", "用户名不存在！");
			return resultMap;
		} else {
			System.out.println(resultPassword.get(0).get("sName"));
			System.out.println(param.get("sPassword"));
			if (param.get("sPassword").equals(resultPassword.get(0).get("sPassword"))) {
				resultMap.put("toPage","/main.jsp");
				resultMap.putAll(resultPassword.get(0));
				System.out.println("---------测试--------");
				System.out.println(resultMap);
				session =request.getSession();
				session.setAttribute("sessionMap", resultMap);
				return resultMap;
			} else {
				resultMap.put("toPage","/login.jsp");
				resultMap.put("msg", "用户名或者密码错误！");
				return resultMap;
			}
		}
	}

}
