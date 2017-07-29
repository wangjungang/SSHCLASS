package com.share.bean;

public class DefaultResultBean<T> implements ResultBean<T> {
	
	private T resultData;
	
	private int status;
	
	private String message;
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("{\n\"DefaultResultBean\":\n\t{\n\t\t\"resultData\":\"");
		builder.append(resultData);
		builder.append("\", \n\t\t\"status\":\"");
		builder.append(status);
		builder.append("\", \n\t\t\"message\":\"");
		builder.append(message);
		builder.append("\"\n\t}\n}");
		return builder.toString();
	}
	
	public void setResultData(T resultData) {
		this.resultData = resultData;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public T getResultData() {
		// TODO Auto-generated method stub
		return this.resultData;
	}

	@Override
	public int getStatus() {
		// TODO Auto-generated method stub
		return this.status;
	}

	@Override
	public boolean isSuccess() {
		// TODO Auto-generated method stub
		return status > 0;
	}

	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		return this.message;
	}
	
	public static <T>DefaultResultBean<T> createSuccess(T t) {
		DefaultResultBean<T> result = new DefaultResultBean<T>();
		result.setResultData(t);
		result.setStatus(1);
		return result;
	}
	
	public static <T>DefaultResultBean<T> createNullFailed(String message) {
		DefaultResultBean<T> result = new DefaultResultBean<T>();
		result.setResultData(null);
		result.setMessage(message);
		result.setStatus(-1);
		return result;
	}
}
