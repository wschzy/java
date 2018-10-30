package com.fix.system.interfaces;


import groovy.lang.GroovyShell;
import java.util.List;
import java.util.Map;
import com.founder.fix.apputil.util.StringUtil;
import com.founder.fix.dbcore.DataTable.DataRow;
import com.founder.fix.webcore.BaseInterface;
import com.skym.workflow.WorkFlowUtil;
import com.skym.workflow.model.NodeInfo;
import com.skym.workflow.model.NodeInfo.NodeCLML;

public class WF_CONF_LCINFO extends BaseInterface {

	@SuppressWarnings("unchecked")
	public void executeCLML() throws Exception {
		Map<String, Object> dataMap = (Map<String, Object>) dataView.get("formData");
		String objName = (String) dataMap.get("objName");
		String useType = StringUtil.getString(dataView.get("useType"));
		Map<String, Object> allCurrentData = dataView.getAllCurrentData();
		String btntext=((Map<String,String>)allCurrentData.get("flowParam")).get("text");
		String OPINION=StringUtil.getString(allCurrentData.get("WFOPINION"));
		String taskId=StringUtil.getString(allCurrentData.get("taskId"));
		DataRow mainrow=dataView.getFormData().getDataTable().Rows[0];
		String pkvalue = StringUtil.getString(mainrow.ItemValue("ID"));
		
		String projectid=StringUtil.getString(dataView.getUser().getItem("projectId"));
		String userid=dataView.getUser().getLoginId();
		String orgid=dataView.getUser().getOrgId();
		
		executeCLML(useType,objName,pkvalue,projectid,orgid,userid,btntext,mainrow,OPINION,taskId);
	}
	
	/**
	 * 
	 * @param useType	add,modify
	 * @param objName	表名
	 * @param pkvalue	主键值
	 * @param projectid	项目编号
	 * @param orgid		单位编号
	 * @param userid	用户登录名
	 * @param btntext	按钮文本
	 * @param dr		主表datarow
	 * @param OPINION	处理意见
	 * @throws Exception
	 */
	public static void executeCLML(String useType,String objName,String pkvalue,String projectid,String orgid,String userid,String btntext,DataRow dr,String OPINION,String taskid) throws Exception {
		NodeInfo bni=null;
		if("add".equals(useType)){//添加表单获取流程起点信息
			bni=WorkFlowUtil.getStartNodeInfo(objName,projectid);
			if(!WorkFlowUtil.haveLaunchPer(bni,userid)){//判断是否有发起权限
				throw(new Exception("您没有权限发起该流程"));
			}
		}else if("modify".equals(useType)){//修改表单获取当前节点信息
			if(!WorkFlowUtil.haveOperatePer(taskid,userid)){
				throw(new Exception("您没有权限处理该流程"));
			}
			bni=WorkFlowUtil.getNodeInfoByBizkey(taskid);
		}
		
		List<NodeCLML> nclmls=bni.getNodeclmls();
		if(nclmls.size()==0){
			throw(new Exception("流程异常，请联系管理员"));
		}
		boolean clstatus=false;
		/*DataTable dt = (DataTable)SqlAdapter.executeForGetSqlData("select * from wf_conf_zlcnodeinfo where  mlcnodeid = '"+bni.getNodeID()+"'  and id not in (select zlcnodeid from WF_RUN_PROCESSES where taskid = '"+taskid+"' and zlcnodeid is not null) order by serial", null, null);
		String nodename = "-1";
		if(dt.Rows.length > 0){
			nodename = StringUtil.getString(dt.Rows[0].ItemValue("ZLCNODENAME"));
		}*/
		for(NodeCLML nclml:nclmls){
			if(nclml.getBTNNAME().equals(btntext) || "同意".equals(btntext)){//默认'同意' - 子流程
				if(StringUtil.isNotEmpty(nclml.getFILTER())){
					//判断是否满足条件
					List<String> dvList = WorkFlowUtil.getDataVariableList(nclml.getFILTER());
					String FILTERText=nclml.getFILTER();
					for(String dv:dvList){
						FILTERText = FILTERText.replace("${"+dv+"}", StringUtil.getString(dr.ItemValue(dv)));
					}
					
					GroovyShell groovyShell = new GroovyShell();
					Boolean tongguo = (Boolean)groovyShell.evaluate(FILTERText);
					
					if(!tongguo){
						continue;
					}
				}
				
				//执行该按钮
				WorkFlowUtil.executeCLML(bni,nclml,useType,pkvalue,userid,OPINION,projectid,taskid);
				clstatus=true;
				break;
			}
		}
		
		if(!clstatus){
			throw(new Exception("流程异常，不满足任何下步命令条件，请联系管理员"));
		}
	}
}