package com.share.emp.service;

import javax.servlet.http.HttpServletRequest;

import com.share.emp.DAO.EmpDAO;

public interface EmpService<R,P> {
	
	P buildParam(HttpServletRequest request);
	
	public EmpDAO<R> getEmpDAO();
}
