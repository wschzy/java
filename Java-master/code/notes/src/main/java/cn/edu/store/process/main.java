package com.skym.workflow;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.founder.fix.apputil.util.StringUtil;
import com.founder.fix.dbcore.DataTable;
import com.founder.fix.dbcore.Parm_Struct;
import com.founder.fix.webcore.BaseInterface;
import com.founder.fix.webcore.interfaceLayer.adapter.SqlAdapter;
import com.skym.workflow.model.NodeInfo;
import com.skym.workflow.model.NodeInfo.NodeCLML;

public class WorkFlowUtil extends BaseInterface{
	//流程是否结束
	public static boolean isFinish(String taskid) throws Exception{
		
		String status=StringUtil.getString(SqlAdapter.executeForGetSqlFirstValue("select status from WF_RUN_TASKS where taskid='"+taskid+"'", null, null));
		
		if("359".equals(status)){
			return true;
		}
		
		return false;
	}
	
	//获取开始节点信息
	public static NodeInfo getStartNodeInfo(String tablename,String projectid)throws Exception{
		NodeInfo ni=null;
		DataTable dt=(DataTable)SqlAdapter.executeForGetSqlData(
			"select li.tablename,ni.id,ni.projectid,ni.wfid,ni.name,ni.starttag,ni.hqtag,ni.note,ni.serial,ni.SPUNIT,ni.SBTYPE,ni.dsllx " +
			"from wf_conf_lcinfo li left join wf_conf_nodeinfo ni on ni.wfid=li.id " +
			"where ni.projectid='"+projectid+"' and li.tablename='"+tablename+"' and ni.starttag='109'", null, null);
		if(dt.Rows.length==1){
			ni=new NodeInfo(dt.Rows[0]);
		}else if(dt.Rows.length>1){
			throw(new Exception("流程配置错误，该流程有多个开始节点，请联系管理员。"));
		}else{
			throw(new Exception("该流程没有设置开始节点"));
		}
		
		return ni;
	}
	
	//获指定取节点信息
	public static NodeInfo getNodeInfoByBizkey(String taskid)throws Exception{
		NodeInfo ni=null;
		DataTable dt=(DataTable)SqlAdapter.executeForGetSqlData(
			"select wcni.wfid,wcli.tablename,wcni.id,wcni.projectid,wcni.SPUNIT,wcni.SBTYPE,wcni.name,wcni.starttag,wcni.hqtag,wcni.note,wcni.serial,wcni.dsllx "+
			"from wf_conf_nodeinfo wcni left join wf_run_tasks wrt on wrt.nodeid=wcni.id left join wf_conf_lcinfo wcli on wcli.id=wrt.wfid " +
			"where wrt.taskid='"+taskid+"'", null, null);
		if(dt.Rows.length!=0){
			ni=new NodeInfo(dt.Rows[0]);
		}else{
			throw(new Exception("流程异常，当前节点被删除，请联系管理员"));
		}
		
		return ni;
	}
	
	//获取指定取节点信息
	public static NodeInfo getNodeInfoByNodeid(String nodeid)throws Exception{
		NodeInfo ni=null;
		DataTable dt=(DataTable)SqlAdapter.executeForGetSqlData(
			"select wcni.wfid,wcli.tablename,wcni.id,wcni.projectid,wcni.spunit,wcni.sbtype,wcni.name,wcni.starttag,wcni.hqtag,wcni.note,wcni.serial,wcni.dsllx "+
			"from wf_conf_nodeinfo wcni left join wf_conf_lcinfo wcli on wcli.id=wcni.wfid "+
			"where wcni.id='"+nodeid+"'", null, null);
		if(dt.Rows.length!=0){
			ni=new NodeInfo(dt.Rows[0]);
		}else{
			throw(new Exception("流程异常，找不到节点信息，请联系管理员"));
		}
		
		return ni;
	}
	
	//判断是否有权限发起流程
	public static boolean haveLaunchPer(NodeInfo ni,String userid)throws Exception{
		boolean Per=false;
		
		for(Map<String, String> nclr:ni.getNodeclrs("",null)){
			if(nclr.get("USERID").equals(userid)){
				Per=true;
				break;
			}
		}
		return Per;
	}
	
	//判断是否有权限处理该流程
	public static boolean haveOperatePer(String taskid,String userid)throws Exception{
		boolean Per=false;
		String count=StringUtil.getString(SqlAdapter.executeForGetSqlFirstValue("select count(0) from WF_RUN_MEMBER where TASKID='"+taskid+"' and member='"+userid+"'", null, null));
		if(Integer.parseInt(count)>0){
			Per=true;
		}
		return Per;
	}
	
	//获取操作按钮(显示用)
	public static DataTable getToolBarBtn(NodeInfo ni)throws Exception{
		return (DataTable)SqlAdapter.executeForGetSqlData("select btnname,promptinf  from (select btnname,promptinf from wf_conf_clmlxbjd where nodeid='"+ni.getNodeID()+"' order by serial) group by btnname,promptinf", null, null);
	}
	
	//获取操作按钮(子流程显示用)
	public static DataTable getToolBarZLCBtn(NodeInfo ni,String taskId)throws Exception{
		return (DataTable)SqlAdapter.executeForGetSqlData("select * from wf_conf_zlcnodeinfo where  mlcnodeid = '"+ni.getNodeID()+"'  and id not in (select zlcnodeid from WF_RUN_PROCESSES where taskid = '"+taskId+"' and zlcnodeid is not null) order by serial", null, null);
	}
	
	//判断是否是子流程会签
	public static boolean isZlcHq(String nodeId)throws Exception{
		 DataTable dt = (DataTable)SqlAdapter.executeForGetSqlData(" select n.spunit,n.hqtag,c.* from wf_conf_nodeinfo n left join  wf_conf_nodeclr c on c.nodeid = n.id where n.id =  '"+nodeId+"' ", null, null);
		 //审批单元 - 单位、节点类型 - 会签
		 return dt.Rows.length>1 && "0".equals(dt.Rows[0].ItemValue("SPUNIT").toString()) && "1".equals(dt.Rows[0].ItemValue("HQTAG").toString()) ;
	}
	//执行处理命令 hzy 20180731
	public static void executeCLML(NodeInfo bni,NodeCLML nclml,String useType,String bizkey,String userid,String OPINION,String projectid,String taskid)throws Exception{
		String lcSTATUS="358";
		String tasknodeid="";
		NodeInfo tni=null;
		if("1".equals(nclml.getTnodeid())){//如果是结束指令
			lcSTATUS="359";
		}else{
			tni=WorkFlowUtil.getNodeInfoByNodeid(nclml.getTnodeid());//获取下步节点信息
			tasknodeid=tni.getNodeID();
		}
		
		Map<String,String> clrunit;//获取处理人单元信息
		if(StringUtil.isEmpty(taskid)){
			taskid=StringUtil.getString(SqlAdapter.executeForGetSqlFirstValue("select SQ_WF.NEXTVAL from dual", null, null));
			clrunit =bni.getClrUnit(userid,taskid);
		}else{
			DataTable unitdt=(DataTable)SqlAdapter.executeForGetSqlData("select unitid,spunit from WF_RUN_MEMBER where taskid='"+taskid+"' and member='"+userid+"' and rownum=1", null, null);
			clrunit=new HashMap<String, String>();
			clrunit.put("UNITID", StringUtil.getString(unitdt.Rows[0].ItemValue("UNITID")));
			clrunit.put("SPUNIT", StringUtil.getString(unitdt.Rows[0].ItemValue("SPUNIT")));
		}
		
		List<Parm_Struct> paramList=new ArrayList<Parm_Struct>();
		paramList.add(new Parm_Struct(OPINION));
		
		boolean flag = true;
		
		if("modify".equals(useType)){
			DataTable clrDt = WorkFlowUtil.isHasSubFlow(userid, taskid);
			if(clrDt.Rows.length > 0){//处理子流程
				flag = false;
				String zlcid = StringUtil.getString(clrDt.Rows[0].ItemValue("ZLCNODEID"));
				DataTable zlcpzDt = (DataTable)SqlAdapter.executeForGetSqlData("select * from wf_conf_zlcnodeinfo where id = '"+zlcid+"'", null, null);
				SqlAdapter.executeForExecSql("delete WF_RUN_MEMBER where taskid='"+taskid+"'  and zlcnodeid ='"+zlcid+"'", null, null);
				
				if(isZlcHq(bni.getNodeID())){//判断是否是会签子流程
					//会签子流程
					//子流程下步标记
					DataTable zlcxbpz = (DataTable)SqlAdapter.executeForGetSqlData("select * from wf_conf_zlcnodeinfo where" +
							" mlcnodeid = '"+bni.getNodeID()+"' and serial = '"+(Integer.parseInt((String.valueOf(zlcpzDt.Rows[0].ItemValue("serial"))))+1)+"' and orgid = '"+zlcpzDt.Rows[0].ItemValue("orgid")+"' ", null, null);
					SqlAdapter.executeForExecSql("insert into WF_RUN_PROCESSES (ID,BIZKEY,NODEID,NODENAME,OPERATOR,CLMLID,BTNNAME,ARRTIME,RCTIME,OPINION,TASKID,UNITID,SPUNIT,ZLCNODEID) " +
							"values(SQ_WF.NEXTVAL,'"+bizkey+"','"+bni.getNodeID()+"','"+zlcpzDt.Rows[0].ItemValue("ZLCNODENAME")+"','"+userid+"','"+zlcpzDt.Rows[0].ItemValue("SERIAL")+"','同意',(select ARRTIME from WF_RUN_TASKS where TASKID='"+taskid+"')," +
							"sysdate,?,'"+taskid+"','"+clrunit.get("UNITID")+"','"+clrunit.get("SPUNIT")+"','"+zlcid+"')", null, null,paramList);//插入本次子流程步骤
					if(zlcxbpz.Rows.length==1){//存在
						zlcClr(bizkey,taskid,bni,zlcxbpz);
						return;
					}else if(zlcxbpz.Rows.length > 1){
						throw new Exception("该子流程流程配置错误，请联系管理员。");
					}else{//本节点下一步非子流程
						//未完成单位数量 
						String a = StringUtil.getString(SqlAdapter.executeForGetSqlFirstValue("select count(*) from (select unitid  from  WF_RUN_MEMBER where TASKID='"+taskid+"' and zlcnodeid is not null group by unitid)", null, null));
						//总数量
						String b = StringUtil.getString(SqlAdapter.executeForGetSqlFirstValue("select count(*) from (select orgid from wf_conf_zlcnodeinfo where mlcnodeid = '"+bni.getNodeID()+"' group by orgid )", null, null));
						if(StringUtil.isNotEmpty(nclml.getTGZB()) && ((Float.parseFloat(b)-Float.parseFloat(a))/Float.parseFloat(b)) >= Float.parseFloat(nclml.getTGZB())){
							SqlAdapter.executeForExecSql("delete WF_RUN_MEMBER where taskid='"+taskid+"' and zlcnodeid in (select id from WF_CONF_ZLCNODEINFO where mlcnodeid='"+bni.getNodeID()+"' ) ", null, null);
							SqlAdapter.executeForExecSql("delete WF_RUN_TASKS where taskid='"+taskid+"'", null, null);
						}else{
							return;//未达成
						}
					}
				}else{
					//子流程下步标记
					DataTable zlcxbpz = (DataTable)SqlAdapter.executeForGetSqlData("select * from wf_conf_zlcnodeinfo where" +
							" mlcnodeid = '"+bni.getNodeID()+"' and serial = '"+(Integer.parseInt((String.valueOf(zlcpzDt.Rows[0].ItemValue("serial"))))+1)+"'", null, null);
					if(zlcxbpz.Rows.length==1){//存在
						SqlAdapter.executeForExecSql("insert into WF_RUN_PROCESSES (ID,BIZKEY,NODEID,NODENAME,OPERATOR,CLMLID,BTNNAME,ARRTIME,RCTIME,OPINION,TASKID,UNITID,SPUNIT,ZLCNODEID) " +
								"values(SQ_WF.NEXTVAL,'"+bizkey+"','"+bni.getNodeID()+"','"+zlcpzDt.Rows[0].ItemValue("ZLCNODENAME")+"','"+userid+"','"+zlcpzDt.Rows[0].ItemValue("SERIAL")+"','同意',(select ARRTIME from WF_RUN_TASKS where TASKID='"+taskid+"')," +
										"sysdate,?,'"+taskid+"','"+clrunit.get("UNITID")+"','"+clrunit.get("SPUNIT")+"','"+zlcid+"')", null, null,paramList);//插入本次子流程步骤
						zlcClr(bizkey,taskid,bni,zlcxbpz);
						return;
					}else if(zlcxbpz.Rows.length > 1){
						throw new Exception("该子流程流程配置错误，请联系管理员。");
					}else{//本节点下一步非子流程
						SqlAdapter.executeForExecSql("insert into WF_RUN_PROCESSES (ID,BIZKEY,NODEID,NODENAME,OPERATOR,CLMLID,BTNNAME,ARRTIME,RCTIME,OPINION,TASKID,UNITID,SPUNIT,ZLCNODEID) " +
								"values(SQ_WF.NEXTVAL,'"+bizkey+"','"+bni.getNodeID()+"','"+bni.getNAME()+"','"+userid+"','"+zlcpzDt.Rows[0].ItemValue("SERIAL")+"','"+nclml.getBTNNAME()+"',(select ARRTIME from WF_RUN_TASKS where TASKID='"+taskid+"')," +
										"sysdate,?,'"+taskid+"','"+clrunit.get("UNITID")+"','"+clrunit.get("SPUNIT")+"','"+zlcid+"')", null, null,paramList);//插入本次父流程步骤
						SqlAdapter.executeForExecSql("delete WF_RUN_MEMBER where taskid='"+taskid+"' and zlcnodeid in (select id from WF_CONF_ZLCNODEINFO where mlcnodeid='"+bni.getNodeID()+"' ) ", null, null);
						SqlAdapter.executeForExecSql("delete WF_RUN_TASKS where taskid='"+taskid+"'", null, null);
					}
				}
				
			}
		}
		
		
		if(flag){
			//插入处理过程
			SqlAdapter.executeForExecSql("insert into WF_RUN_PROCESSES (ID,BIZKEY,NODEID,NODENAME,OPERATOR,CLMLID,BTNNAME,ARRTIME,RCTIME,OPINION,TASKID,UNITID,SPUNIT) " +
					"values(SQ_WF.NEXTVAL,'"+bizkey+"','"+bni.getNodeID()+"','"+bni.getNAME()+"','"+userid+"','"+nclml.getNodeclmlid()+"','"+nclml.getBTNNAME()+"',(select ARRTIME from WF_RUN_TASKS where TASKID='"+taskid+"'),sysdate,?,'"+taskid+"','"+clrunit.get("UNITID")+"','"+clrunit.get("SPUNIT")+"')", null, null,paramList);
			if("modify".equals(useType)){
				if("1".equals(bni.getHQTAG())){//如果是会签
					List<String> CLRunits=bni.getClRunits(taskid);
					String clsl = StringUtil.getString(SqlAdapter.executeForGetSqlFirstValue("select count(0) from WF_RUN_PROCESSES where taskid='"+taskid+"' and clmlid='"+nclml.getNodeclmlid()+"' and arrtime=(select ARRTIME from WF_RUN_TASKS where TASKID='"+taskid+"')", null, null));
					//判断是否达成会签通过条件
					if(!(StringUtil.isEmpty(nclml.getTGZB())||Float.parseFloat(clsl)/CLRunits.size()>=Float.parseFloat(nclml.getTGZB()))){//未达成
						SqlAdapter.executeForExecSql("delete WF_RUN_MEMBER where TASKID='"+taskid+"' and UNITID='"+clrunit.get("UNITID")+"'", null, null);
						return;
					}
				}
				//if(!("2".equals(bni.getHQTAG()) && "1".equals(bni.getDSLLX()))){//普通节点
				if(!"2".equals(bni.getHQTAG())){//普通节点
					String taskscount = StringUtil.getString(SqlAdapter.executeForGetSqlFirstValue("select count(*) from wf_run_tasks where taskid in (select taskid from wf_run_tasks_relation where firsttaskid = " +
							"(select firsttaskid  from wf_run_tasks_relation where TASKID = '"+taskid+"')) and taskid <> '"+taskid+"' and  nodeid <> '"+bni.getNodeID()+"' ", null, null));//(taskid <> relatetask)
					if(!"0".equals(taskscount)){
						throw new Exception("流程异常，上步节点未审批完，请联系管理员");
					}
				}
				SqlAdapter.executeForExecSql("delete WF_RUN_TASKS where taskid='"+taskid+"'", null, null);
				SqlAdapter.executeForExecSql("delete WF_RUN_MEMBER where taskid='"+taskid+"' and zlcnodeid is null ", null, null);
//				if(!("2".equals(bni.getHQTAG()) && "1".equals(bni.getDSLLX()))){
				if(!"2".equals(bni.getHQTAG())){
					String taskscount = StringUtil.getString(SqlAdapter.executeForGetSqlFirstValue("select count(*) from wf_run_tasks where taskid in (select taskid from wf_run_tasks_relation where firsttaskid = " +
							"(select firsttaskid  from wf_run_tasks_relation where TASKID = '"+taskid+"'))", null, null));
					if(!"0".equals(taskscount)){//多合一 未处理完所有的任务 
						return;
					}
				}
			}else if(!"add".equals(useType)){
				throw(new Exception("流程异常，参数错误，请联系管理员"));
			}
		}
		//firsttaskid
		String id = StringUtil.getString(SqlAdapter.executeForGetSqlFirstValue("select FIRSTTASKID from WF_RUN_TASKS_RELATION where taskid = '"+taskid+"'", null, null));
		if("".equals(id)){
			id = taskid;
		}
		//父节点
		String SUPTASKID = taskid;
		//插入流程实例表
		if(!"1".equals(nclml.getTnodeid())){//如果不是结束指令
			if(!(("2".equals(tni.getHQTAG()) && "1".equals(tni.getDSLLX())))){//下步节点 普通
				if("2".equals(bni.getHQTAG()) && "1".equals(bni.getDSLLX())){//当前节点 多实例
					//本节点
					taskid = StringUtil.getString(SqlAdapter.executeForGetSqlFirstValue("select SQ_WF.NEXTVAL from dual", null, null));
					SqlAdapter.executeForExecSql("insert into WF_RUN_TASKS_RELATION (ID,SUPTASKID,TASKID,FIRSTTASKID) values (SQ_WF.NEXTVAL,'"+SUPTASKID+"','"+taskid+"','"+id+"')", null, null);
					SqlAdapter.executeForExecSql("insert into WF_RUN_TASKS (BIZKEY,WFID,NODEID,ARRTIME,OPERATOR,STATUS,PROJECTID,TASKID,TASKTYPE,RELATETASK,FIRSTTASKID) " +
							"values('"+bizkey+"','"+bni.getWFID()+"','"+tasknodeid+"',sysdate,'"+userid+"','"+lcSTATUS+"','"+projectid+"','"+taskid+"','"+bni.getHQTAG()+"','"+taskid+"','"+id+"')", null, null);
				}else{
					SqlAdapter.executeForExecSql("insert into WF_RUN_TASKS (BIZKEY,WFID,NODEID,ARRTIME,OPERATOR,STATUS,PROJECTID,TASKID,TASKTYPE,RELATETASK,FIRSTTASKID) " +
							"values('"+bizkey+"','"+bni.getWFID()+"','"+tasknodeid+"',sysdate,'"+userid+"','"+lcSTATUS+"','"+projectid+"','"+taskid+"','"+bni.getHQTAG()+"','"+taskid+"','"+taskid+"')", null, null);
				}
			}
		}else{
			SqlAdapter.executeForExecSql("insert into WF_RUN_TASKS (BIZKEY,WFID,NODEID,ARRTIME,OPERATOR,STATUS,PROJECTID,TASKID,TASKTYPE,RELATETASK,FIRSTTASKID) " +
					"values('"+bizkey+"','"+bni.getWFID()+"','"+tasknodeid+"',sysdate,'"+userid+"','"+lcSTATUS+"','"+projectid+"','"+taskid+"','"+bni.getHQTAG()+"','"+taskid+"','"+taskid+"')", null, null);
		}
		if(!"1".equals(nclml.getTnodeid())){//如果不是结束指令
			
			DataTable lsspr=(DataTable)SqlAdapter.executeForGetSqlData("select operator,SPUNIT,UNITID from Wf_Run_Processes where taskid='"+taskid+"' and nodeid='"+tasknodeid+"' and rownum=1 ", null, null);
			
			if(lsspr.Rows.length>0 && "0".equals(tni.getHQTAG())){//流程流转到之前的节点,并且不是会签时，取之前的审批人
				
				//按人员插入流程处理人表
				SqlAdapter.executeForExecSql("insert into WF_RUN_MEMBER (ID,MEMBER,SPUNIT,UNITID,BIZKEY,TASKID) values " +
						"(SQ_WF.NEXTVAL,'"+lsspr.Rows[0].ItemValue("OPERATOR")+"','"+tni.getSPUNIT()+"','"+lsspr.Rows[0].ItemValue("UNITID")+"','"+bizkey+"','"+taskid+"')", null, null);
			
			}else{
				//判断下步节点是否包含子流程
				DataTable zlcpzDt = (DataTable)SqlAdapter.executeForGetSqlData("select * from wf_conf_zlcnodeinfo where mlcnodeid = '"+tni.getNodeID()+"' and serial = '1'", null, null);
				if(zlcpzDt.Rows.length == 1){//下步节点存在子流程
					if("2".equals(tni.getHQTAG()) && "1".equals(tni.getDSLLX())){//下步节点是多实例
						SqlAdapter.executeForExecSql("insert into WF_RUN_TASKS (BIZKEY,WFID,NODEID,ARRTIME,OPERATOR,STATUS,PROJECTID,TASKID,TASKTYPE,RELATETASK,FIRSTTASKID) " +
								"values('"+bizkey+"','"+bni.getWFID()+"','"+tasknodeid+"',sysdate,'"+userid+"','"+lcSTATUS+"','"+projectid+"','"+taskid+"','"+bni.getHQTAG()+"','"+taskid+"','"+taskid+"')", null, null);
					}
					zlcClr(bizkey,taskid,tni,zlcpzDt);
					return;
				}else if(zlcpzDt.Rows.length >1){
					if(isZlcHq(tni.getNodeID())){
						//子流程会签
						zlcClr(bizkey,taskid,tni,zlcpzDt);
						return;
					}else{
						throw new Exception("该子流程流程配置错误，请联系管理员。");
					}
				}
				List<Map<String, String>> tclrs;
				if("2".equals(bni.getHQTAG()) && "1".equals(bni.getDSLLX())){
					tclrs=tni.getNodeclrs(SUPTASKID,null);//获取下步处理人
				}else{
					tclrs=tni.getNodeclrs(taskid,null);//获取下步处理人
				}
				
				Set<String> spList = new HashSet<String>();//审批单元
				if(tclrs.size()==0){
					throw(new Exception("流程异常，下步节点没有处理人，请联系管理员"));
				}
				StringBuilder tclrsql=new StringBuilder("begin ");
				
				String tid = "";
				for(Map<String, String> tclr:tclrs){
					if("2".equals(tni.getHQTAG()) && "1".equals(tni.getDSLLX())){//多实例 
						if(!spList.contains(tclr.get("UNITID"))){//根据审批单元插入WF_RUN_TASKS
							spList.add(tclr.get("UNITID"));
							tid = StringUtil.getString(SqlAdapter.executeForGetSqlFirstValue("select SQ_WF.NEXTVAL from dual", null, null));
							tclrsql.append("insert into WF_RUN_TASKS (BIZKEY,WFID,NODEID,ARRTIME,OPERATOR,STATUS,PROJECTID,TASKID,TASKTYPE,RELATETASK,FIRSTTASKID) " +
									"values('"+bizkey+"','"+bni.getWFID()+"','"+tasknodeid+"',sysdate,'"+userid+"','"+lcSTATUS+"','"+projectid+"','"+tid+"','"+bni.getHQTAG()+"','"+taskid+"','"+id+"');");
							//多实例关联表
							tclrsql.append("insert into WF_RUN_TASKS_RELATION (ID,SUPTASKID,TASKID,FIRSTTASKID) values (SQ_WF.NEXTVAL,'"+taskid+"','"+tid+"','"+id+"');");
						}
						//处理人
						tclrsql.append("insert into WF_RUN_MEMBER (ID,MEMBER,SPUNIT,UNITID,BIZKEY,TASKID) values (SQ_WF.NEXTVAL,'"+tclr.get("USERID")+"','"+tclr.get("SPUNIT")+"','"+tclr.get("UNITID")+"','"+bizkey+"','"+tid+"');");
					}else{
						tclrsql.append("insert into WF_RUN_MEMBER (ID,MEMBER,SPUNIT,UNITID,BIZKEY,TASKID) values (SQ_WF.NEXTVAL,'"+tclr.get("USERID")+"','"+tclr.get("SPUNIT")+"','"+tclr.get("UNITID")+"','"+bizkey+"','"+taskid+"');");
					}
				}
				
				tclrsql.append(" end;");
				//按岗位查询插入流程处理人表
				SqlAdapter.executeForExecSql(tclrsql.toString(), null, null);
			}
			String count;
			if("2".equals(tni.getHQTAG()) && "1".equals(tni.getDSLLX())){
				count=StringUtil.getString(SqlAdapter.executeForGetSqlFirstValue("select count(0) from WF_RUN_MEMBER where taskid in (select taskid from WF_RUN_TASKS_RELATION where FIRSTTASKID = '"+id+"')   ", null, null));
			}else{
				count=StringUtil.getString(SqlAdapter.executeForGetSqlFirstValue("select count(0) from WF_RUN_MEMBER where taskid='"+taskid+"'", null, null));
			}
			if("0".equals(count)){
				throw(new Exception("流程异常，下步节点岗位中没有设置人员，请联系管理员"));
			}
			
		}
		
		
	}
	//解析${}
	public static List<String> getDataVariableList(String scriptText) {
		String inexp = scriptText;
		// ${test} afdfs ${test1}erewr ${test3}
		String regex = "\\$\\{[^}{]+\\}";
		Pattern regexExpType = Pattern.compile(regex);
		Matcher mType = regexExpType.matcher(inexp);
		String expType = inexp;
		List<String> list = new ArrayList<String>();
		while (mType.find()) {
			expType = mType.group();
			expType = expType.substring(2, expType.length() - 1);
			list.add(expType);
		}
		return list;
	}
	/*
	 * 判断当前任务是否是子流程
	 */
	public static DataTable isHasSubFlow(String userid,String taskid)throws Exception{
		return (DataTable)SqlAdapter.executeForGetSqlData("select * from  WF_RUN_MEMBER where TASKID='"+taskid+"' and member='"+userid+"' and ZLCNODEID is not null", null, null);
	}
	
	/*
	 * 插入子流程处理人
	 */
	private static void zlcClr(String bizkey,String taskid,NodeInfo bni,DataTable zlcpzDt)throws Exception{
		List<Map<String, String>> bclrs=bni.getNodeclrs(taskid,zlcpzDt);//获取下步子流程处理人
		if(bclrs.size()==0){
			throw new Exception("流程异常，下步节点没有处理人，请联系管理员");
		}
		StringBuilder tclrsql=new StringBuilder("begin ");
		for(int i=0;i<zlcpzDt.Rows.length;i++){
			for(Map<String, String> bclr:bclrs){
				if(zlcpzDt.Rows.length > 1){//子流程 会签
					if(!StringUtil.isEqual(zlcpzDt.Rows[i].ItemValue("ORGID").toString(), bclr.get("UNITID")))
						continue;
				}
				tclrsql.append("insert into WF_RUN_MEMBER (ID,MEMBER,SPUNIT,UNITID,BIZKEY,TASKID,ZLCNODEID) values " +
						"(SQ_WF.NEXTVAL,'"+bclr.get("USERID")+"','"+bclr.get("SPUNIT")+"','"+bclr.get("UNITID")+"','"+bizkey+"','"+taskid+"','"+zlcpzDt.Rows[i].ItemValue("ID")+"');");
			}
		}
		tclrsql.append(" end;");
		SqlAdapter.executeForExecSql(tclrsql.toString(), null, null);
	}
}
