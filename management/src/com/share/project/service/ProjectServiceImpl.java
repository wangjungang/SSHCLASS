package com.share.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import com.share.emp.DAO.EmpDAO;
import com.share.project.DAO.ProjectDAO;

public class ProjectServiceImpl implements ProjectService<Map<String,Object>,Map<String,Object>>{

	@Autowired
	private ProjectDAO<Map<String, Object>> projectDAO;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	HttpSession session;
	
	@Override
	public ProjectDAO<Map<String,Object>> getProjectDAO() {
		// TODO Auto-generated method stub
		return this.projectDAO;
	}
	
	/**
	 * 通过request得到页面的参数，进行封装参数到param(map)中
	 */
	@Override
	public Map<String,Object> buildParam(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Map<String, String[]> parameterMaps = request.getParameterMap();
		Map<String, Object> result = new HashMap<String,Object>();
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
		return result;
	}/**
	 * 判断项目列表方法
	 * @param param
	 * @return
	 * @throws Exception 
	 */
	public Map<String,Object> getProjectService(Map<String,Object> param) throws Exception{
		
		List<Map<String, Object>> resultEmp = getProjectDAO().getProjectList(param);
		/**
		 * 测试
		 */
		System.out.println(resultEmp);
		Map<String,Object> resultMap=new HashMap<String,Object>();
		if(resultEmp.size()==0){
			resultMap.put("toPage", "/projectlist.jsp");
			resultMap.put("msg","没有项目");
			return resultMap;
		}else{
			resultMap.put("toPage", "/projectlist.jsp");
			
			return resultMap;
		}
		
	}
	
	
	
	/**
	 * 查询项目列表方法
	 * @param param
	 * @return
	 * @throws Exception 
	 */
	public List<Map<String,Object>> getProjectListService(Map<String,Object> param) throws Exception{
		
		List<Map<String, Object>> resultEmp = getProjectDAO().getProjectList(param);
		/**
		 * 测试
		 */
		System.out.println(resultEmp); 
			
		return resultEmp;
	}
	
	/**
	 * 查询项目列表方法
	 * @param param
	 * @return
	 * @throws Exception 
	 */
	public List<Map<String,Object>> getProjectAllotListService(Map<String,Object> param) throws Exception{
		
		List<Map<String, Object>> resultEmp = getProjectDAO().getProjectAllotList(param);
		/**
		 * 测试
		 */
		System.out.println(resultEmp); 
			
		return resultEmp;
	}
	
	/**
	 * 根据当前用户id查询项目列表方法
	 * @param param
	 * @return
	 * @throws Exception 
	 */
	public List<Map<String,Object>> getProjectPersonListService(Map<String,Object> param) throws Exception{
		
		List<Map<String, Object>> resultEmp = getProjectDAO().getProjectPersonList(param);
		/**
		 * 测试
		 */
		System.out.println(resultEmp); 
			
		return resultEmp;
	}
	/**
	 * 增加一个项目方法
	 * @param param
	 * @return
	 */
	public Map<String,Object> addService(Map<String,Object> param){
		
		int rowCount;
		Map<String,Object> resultMap=new HashMap<String,Object>();
		try {
			rowCount = getProjectDAO().addRow(param);
			/**
			 * 测试
			 */
			System.out.println(rowCount);
			resultMap.put("toPage","/addproject.jsp");
			resultMap.put("msg","增加"+rowCount+"行"); 
			System.out.println(resultMap.get("msg"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return resultMap;
		
	}
	
	/**
	 * 删除一个项目方法
	 * @param param
	 * @return
	 */
	public Map<String,Object> deleteRowService(Map<String,Object> param){
		
		int rowCount;
		Map<String,Object> resultMap=new HashMap<String,Object>();
		try {
			rowCount = getProjectDAO().deleteRow(param);
			/**
			 * 测试
			 */
			System.out.println(rowCount);
			resultMap.put("toPage","/indirect.jsp");
			resultMap.put("msg","删除"+rowCount+"行"); 
			System.out.println(resultMap.get("msg"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
			
		return resultMap;
		
	}
	
	/**
	 * 修改一个员工方法
	 * @param param
	 * @return
	 */
	public Map<String,Object> updateRowService(Map<String,Object> param){
		
		int rowCount;
		Map<String,Object> resultMap=new HashMap<String,Object>();
		try {
			System.out.println(param.get("updateId"));
			System.out.println(param);
			rowCount = getProjectDAO().updateRow(param);
			/**
			 * 测试
			 */
			System.out.println(rowCount);
			resultMap.put("toPage","/indirect.jsp");
			resultMap.put("msg","修改"+rowCount+"行"); 
			System.out.println(resultMap.get("msg"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
			
		return resultMap;
		
	}
	
	/**
	 * 得到一行员工信息的方法
	 * @param param
	 * @return
	 */
	public Map<String,Object> getRowService(Map<String,Object> param){

		Map<String,Object> resultMap=new HashMap<String,Object>();
		try {
			List<Map<String, Object>> resultEmp= getProjectDAO().getRow(param);

			System.out.println(resultEmp.get(0));
			resultMap.putAll(resultEmp.get(0));
			/**
			 * 测试resultmap
			 */
			System.out.println("--------dfgsdg-sdgfasdgf-a-agf-----------");
			System.out.println(resultMap);
			resultMap.put("toPage","/updateproject.jsp");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
			
		return resultMap;
		
	}
	 
	public List<Map<String,Object>> getProjectType(Map<String,Object> param) throws Exception{
		
		List<Map<String,Object>> resultEmp=getProjectDAO().getEmpList(param);
		System.out.println("----------测试");
		System.out.println(resultEmp);
				
		return resultEmp;
	}
	
	
	public Map<String,Object> getPersonRow(Map<String,Object> param) throws Exception{
		List<Map<String,Object>> resultEmp;
		Map<String,Object> map=new HashMap<String,Object>();
		Map<String,Object> emap=new HashMap<String,Object>();
		for (Map.Entry<String, Object> entry : param.entrySet()){
			if(!emap.isEmpty()){
				emap.clear();
			}
			emap.put(entry.getKey(),entry.getValue());
			resultEmp=getProjectDAO().getPersonRow(emap);
			map.putAll(resultEmp.get(0));
		}
		System.out.println(map);
		
		return map;
	}
}
