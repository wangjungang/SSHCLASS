package com.share.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * 业务逻辑层总结口
 * @param <R> 返回的泛型
 * @param <P> 参数的泛型
 */
public interface SuperService<R,P> {
	P buildParam(HttpServletRequest request);
	
	Map<String,Object> doManagerService(P param,HttpServletRequest request);
	
	Map<String,Object> doprojectManagerService(P param,HttpServletRequest request);
	
	Map<String,Object> doEmpService(P param,HttpServletRequest request);
	
}
