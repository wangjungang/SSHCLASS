package com.share.project.DAO;

import java.util.List;
import java.util.Map;

public interface ProjectDAO<T> {
	
	/**
	 *根据登陆的账号在数据库中查找对应的账号进行匹配
	 */
	List<T> getProjectList(Map<String, Object> param) throws Exception;
	
	/**
	 * 根据项目id,查询出项目的分配人员信息
	 */
	List<T> getProjectAllotList(Map<String, Object> param) throws Exception;
	
	/**
	 * 通过当前用户id查询用户的权限列表
	 * @param param
	 * @return
	 * @throws Exception
	 */
	List<T> getProjectPersonList(Map<String, Object> param) throws Exception;
	
	/*
	 * 查询员工列表
	 */
	List<T> getEmpList(Map<String, Object> param) throws Exception;
	
	/**
	 * 增加一行数据
	 * @param param
	 * @return
	 */
	int addRow(Map<String,Object> param) throws Exception;
	
	/**
	 * 删除一行数据
	 * @param param
	 * @return
	 */
	int deleteRow(Map<String,Object> param) throws Exception;
	
	/**
	 * 修改一行数据
	 * @param param
	 * @return
	 */
	int updateRow(Map<String,Object> param) throws Exception;
	
	/**
	 * 得到一行数据
	 * @param param
	 * @return
	 */
	List<T> getRow(Map<String,Object> param) throws Exception;
	
	/**
	 * 通过iperson得到一行数据
	 * @param param
	 * @return
	 */
	List<T> getPersonRow(Map<String,Object> param) throws Exception;
	

}
