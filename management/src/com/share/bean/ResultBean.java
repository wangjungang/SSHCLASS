package com.share.bean;

public interface ResultBean<T> {
	/**
	 * 结果值
	 * @return
	 */
	T getResultData();
	
	/**
	 * 状态码
	 * @return
	 */
	int getStatus();
	
	/**
	 * 请求是否成功
	 * @return
	 */
	boolean isSuccess();
	
	/**
	 * 结果说明
	 * @return
	 */
	String getMessage();
}
