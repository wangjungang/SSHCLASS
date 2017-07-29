package com.share.project.service;

import javax.servlet.http.HttpServletRequest;

import com.share.emp.DAO.EmpDAO;
import com.share.project.DAO.ProjectDAO;

public interface ProjectService<R,P> {
	
	P buildParam(HttpServletRequest request);
	
	public ProjectDAO<R> getProjectDAO();
}
