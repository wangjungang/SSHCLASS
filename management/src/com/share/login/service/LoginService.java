package com.share.login.service;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import com.share.login.DAO.LoginDAO;



public interface LoginService<R,P> {
	
	P buildParam(HttpServletRequest request);
	
	public LoginDAO<R> getLoginDAO();
	
}
