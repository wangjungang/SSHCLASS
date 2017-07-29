package com.share.login.DAO;

import java.util.List;
import java.util.Map;


public interface LoginDAO<T> {
	/**
	 *根据登陆的账号在数据库中查找对应的账号进行匹配
	 */
	List<T> getPassword(Map<String, Object> param);
}
