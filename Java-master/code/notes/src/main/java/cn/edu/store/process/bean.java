package com.skym.workflow.model;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.founder.fix.apputil.util.StringUtil;
import com.founder.fix.dbcore.DataTable;
import com.founder.fix.dbcore.DataTable.DataRow;
import com.founder.fix.webcore.Current;
import com.founder.fix.webcore.ExpressionUtil;
import com.founder.fix.webcore.interfaceLayer.adapter.SqlAdapter;

public class NodeInfo {
	private String tablename;//业务对象表
	private String NodeID;//节点编号
	private String WFID;//流程编号
	private String PROJECTID;//项目编号
	private String NAME;//节点名称
	private String STARTTAG;//开始标记
	private String HQTAG;//节点类型
	private String NOTE;//备注
	private String SERIAL;//序号
	private String SPUNIT;//审批单元
	private String SBTYPE;//上报类型
	private String DSLLX;//多实例类型
	private List<Map<String,String>> nodeclrs=new ArrayList<Map<String,String>>();//处理人
	private List<NodeCLML> nodeclmls=new ArrayList<NodeCLML>();//处理命令
	
	public NodeInfo(DataRow dr) throws Exception{
		this.setNodeID(StringUtil.getString(dr.ItemValue("ID")));
		this.setNAME(StringUtil.getString(dr.ItemValue("NAME")));
		this.setNOTE(StringUtil.getString(dr.ItemValue("NOTE")));
		this.setPROJECTID(StringUtil.getString(dr.ItemValue("PROJECTID")));
		this.setSERIAL(StringUtil.getString(dr.ItemValue("SERIAL")));
		this.setSTARTTAG(StringUtil.getString(dr.ItemValue("STARTTAG")));
		this.setTablename(StringUtil.getString(dr.ItemValue("TABLENAME")));
		this.setWFID(StringUtil.getString(dr.ItemValue("WFID")));
		this.setHQTAG(StringUtil.getString(dr.ItemValue("HQTAG")));
		this.setSPUNIT(StringUtil.getString(dr.ItemValue("SPUNIT")));
		this.setSBTYPE(StringUtil.getString(dr.ItemValue("SBTYPE")));
		this.setDSLLX(StringUtil.getString(dr.ItemValue("DSLLX")));
	}
	//加载处理人
	public void loadCLR(String taskid,DataTable zlcDt)throws Exception{
		String projectid=StringUtil.getString(Current.getUser().getItem("projectId"));
		
		//节点处理人配置
		DataTable clrconfigdt=(DataTable)SqlAdapter.executeForGetSqlData("select * from wf_conf_nodeclr where nodeid='"+this.getNodeID()+"'",null,null);
		
		StringBuilder sqlsb=new StringBuilder();
		
		for(int i=0;clrconfigdt.Rows.length>i;i++){
			if(i!=0){
				sqlsb.append(" union all ");
			}
			
			if(SPUNIT.equals("0")){//按单位审批
				sqlsb.append("select user_name userid,orgid unitid from Fix_Userinfo where 1=1 ");
			}else if(SPUNIT.equals("1")){//按岗位审批 edit by hzy 20180605 x
				sqlsb.append("select user_name userid, sx.fkid unitid from Fix_Userinfo left join sys_xmgwry sx on sx.gwry = user_name and projectid = '"+projectid+"' where sx.fkid is not null ");
			}else if(SPUNIT.equals("2")){//按人审批
				sqlsb.append("select user_name userid,user_name unitid from Fix_Userinfo where 1=1 ");
			}else if(SPUNIT.equals("3")){//按行政区划审批
				DataTable unit=(DataTable)SqlAdapter.executeForGetSqlData("select spunit from wf_conf_nodeinfo where projectid = '"+projectid+"' and id in (select nodeid from wf_conf_clmlxbjd where tnodeid = '"+this.getNodeID()+"')",null,null);
				if(unit.Rows.length == 1){
					if(!"3".equals(StringUtil.getString(unit.Rows[0].ItemValue("spunit")))){
						throw new Exception("节点类型配置错误，上步节点审批单元未设置行政区划，请联系管理员");
					}
				}
				sqlsb.append("select user_name userid,svu.xzqh unitid from Fix_Userinfo left join SYS_V_USERXZQH svu on svu.projectid='"+projectid+"' and user_name=svu.userid where svu.xzqh is not null ");
				if(SBTYPE.equals("1")){
					sqlsb.append(" and (select unitid from (select unitid from WF_RUN_PROCESSES where taskid='"+taskid+"' and nodeid<>'"+this.getNodeID()+"' order by rctime desc) where rownum=1) like svu.xzqh||'%'");
				}else if(SBTYPE.equals("2")){
					sqlsb.append(" and svu.xzqh like (select unitid from (select unitid from WF_RUN_PROCESSES where taskid='"+taskid+"' and nodeid<>'"+this.getNodeID()+"' order by rctime desc) where rownum=1)||'%'");
				}
			}else{
				throw new Exception("节点类型配置错误，请联系管理员");
			}
			
			String GWBH=StringUtil.getString(clrconfigdt.Rows[i].ItemValue("GWBH"));
			String ORGID=StringUtil.getString(clrconfigdt.Rows[i].ItemValue("ORGID"));
			String GZZ=StringUtil.getString(clrconfigdt.Rows[i].ItemValue("GZZ"));
			String XZQH=StringUtil.getString(clrconfigdt.Rows[i].ItemValue("XZQH"));
			String XZQHJB=StringUtil.getString(clrconfigdt.Rows[i].ItemValue("XZQHJB"));
			
			if(ExpressionUtil.hasSigns(GWBH+ORGID+GZZ+XZQH+XZQHJB)){
				List<String> bizfield =ExpressionUtil.getSignList(GWBH+ORGID+GZZ+XZQH+XZQHJB);
				DataTable bizdata=(DataTable)SqlAdapter.executeForGetSqlData("select "+bizfield.toString().replace("[", "").replace("]", "")+" from "+tablename+" where id in (select bizkey from WF_RUN_TASKS where taskid='"+taskid+"')",null,null);
				if(ExpressionUtil.hasSigns(GWBH)){
					GWBH=StringUtil.getString(bizdata.Rows[0].ItemValue(ExpressionUtil.getSigns(GWBH)));
				}
				if(ExpressionUtil.hasSigns(ORGID)){
					ORGID=StringUtil.getString(bizdata.Rows[0].ItemValue(ExpressionUtil.getSigns(ORGID)));
				}
				if(ExpressionUtil.hasSigns(GZZ)){
					GZZ=StringUtil.getString(bizdata.Rows[0].ItemValue(ExpressionUtil.getSigns(GZZ)));
				}
				if(ExpressionUtil.hasSigns(XZQH)){
					XZQH=StringUtil.getString(bizdata.Rows[0].ItemValue(ExpressionUtil.getSigns(XZQH)));
				}
				if(ExpressionUtil.hasSigns(XZQHJB)){
					XZQHJB=StringUtil.getString(bizdata.Rows[0].ItemValue(ExpressionUtil.getSigns(XZQHJB)));
				}
			}
			
			if(StringUtil.isNotEmpty(GWBH)){//岗位不为空 x
				sqlsb.append(" and user_name in (select gwry from sys_xmgwry  where projectid = '"+projectid+"' and fkid in ('"+GWBH.replace(",", "','")+"')) ");
			}else if(StringUtil.isNotEmpty(ORGID)){//单位不为空
				sqlsb.append(" and user_name in (select gwry from sys_xmgwry where projectid = '"+projectid+"' and orgid = '"+ORGID.replace(",", "','")+"')  ");
			}
			
			if(zlcDt!=null && zlcDt.Rows.length > 0){//子流程 x
				if(clrconfigdt.Rows.length > 1 && zlcDt.Rows.length>1){//子流程会签
					for(int j=0;j<zlcDt.Rows.length;j++){
						if(zlcDt.Rows[j].ItemValue("GWID").toString().indexOf(clrconfigdt.Rows[i].ItemValue("ORGID").toString())>0){
							sqlsb.append(" and user_name in (select gwry from sys_xmgwry  where projectid = '"+projectid+"' and fkid in ('"+(String.valueOf(zlcDt.Rows[j].ItemValue("GWID"))).replace(",", "','")+"')) ");
						}
					}
				}else{
					sqlsb.append(" and user_name in (select gwry from sys_xmgwry  where projectid = '"+projectid+"' and fkid in ('"+(String.valueOf(zlcDt.Rows[0].ItemValue("GWID"))).replace(",", "','")+"')) ");
				}
			}
			
			if(StringUtil.isNotEmpty(GZZ)){//工作组不为空 x
				sqlsb.append(" and user_name in (select userid from Sys_Xcdcrypz_Detial where projectid = '"+projectid+"' and fkid in ('"+GZZ.replace(",", "','")+"')) ");
				if(SPUNIT.equals("3")){
					sqlsb.append(" and svu.xzqh in (select xzqh from SYS_XCDCRYPZ where  projectid = '"+projectid+"' and id in ('"+GZZ.replace(",", "','")+"')) ");
				}
			}else if(StringUtil.isNotEmpty(XZQH)){//行政区划不为空
				sqlsb.append(" and user_name in (select userid from SYS_V_USERXZQH where projectid = '"+projectid+"' and xzqh in ('"+XZQH.replace(",", "','")+"')) ");
				if(SPUNIT.equals("3")){
					sqlsb.append(" and svu.xzqh in ('"+XZQH.replace(",", "','")+"') ");
				}
			}else if(StringUtil.isNotEmpty(XZQHJB)){//行政区划等级不为空
				sqlsb.append(" and user_name in (select userid from SYS_V_USERXZQH where projectid = '"+projectid+"' and length(xzqh)="+XZQHJB+") ");
				if(SPUNIT.equals("3")){
					sqlsb.append(" and length(svu.xzqh)="+XZQHJB+" ");
				}
			}
		}
		
		DataTable clrdt=(DataTable)SqlAdapter.executeForGetSqlData("select * from ("+sqlsb.toString()+") order by unitid ", null, null);
				//"select nclr.*,sg.gwry from wf_conf_nodeclr nclr " +
				//"left join sys_gwlc sg on sg.id=nclr.gwbh where nodeid='"+this.getNodeID()+"'"
		for(int i=0;clrdt.Rows.length>i;i++){
			Map<String,String> clr=new LinkedHashMap<String,String>();
			clr.put("USERID",StringUtil.getString(clrdt.Rows[i].ItemValue("USERID")));
			clr.put("UNITID",StringUtil.getString(clrdt.Rows[i].ItemValue("UNITID")));
			clr.put("SPUNIT",SPUNIT);
			nodeclrs.add(clr);
		}
	}
	//加载处理命令
	public void loadCLML()throws Exception{
		
		DataTable clmldt=(DataTable)SqlAdapter.executeForGetSqlData(
				"select * from wf_conf_clmlxbjd nclml where nodeid='"+this.getNodeID()+"' order by serial", null, null);
		for(int i=0;clmldt.Rows.length>i;i++){
			NodeCLML clml=new NodeCLML();
			clml.setNodeclmlid(StringUtil.getString(clmldt.Rows[i].ItemValue("ID")));
			clml.setNodeid(StringUtil.getString(clmldt.Rows[i].ItemValue("NODEID")));
			clml.setBTNNAME(StringUtil.getString(clmldt.Rows[i].ItemValue("BTNNAME")));
			clml.setFILTER(StringUtil.getString(clmldt.Rows[i].ItemValue("FILTER")));
			clml.setTnodeid(StringUtil.getString(clmldt.Rows[i].ItemValue("TNODEID")));
			clml.setSERIAL(StringUtil.getString(clmldt.Rows[i].ItemValue("SERIAL")));
			clml.setTGZB(StringUtil.getString(clmldt.Rows[i].ItemValue("TGZB")));
			clml.setCONFIELD(StringUtil.getString(clmldt.Rows[i].ItemValue("CONFIELD")));
			clml.setCONSYMBOL(StringUtil.getString(clmldt.Rows[i].ItemValue("CONSYMBOL")));
			clml.setCONCONTENT(StringUtil.getString(clmldt.Rows[i].ItemValue("CONCONTENT")));
			nodeclmls.add(clml);
		}
	}
	//获取处理人单元信息
	public Map<String,String> getClrUnit(String userid,String taskid) throws Exception {
		for(Map<String,String> clr:this.getNodeclrs(taskid,null)){
			if(clr.get("USERID").equals(userid)){
				return clr;
			}
		}
		return null;
	}
	
	//加载待处理人
	
	public String getNodeID() {
		return NodeID;
	}
	public void setNodeID(String nodeID) {
		NodeID = nodeID;
	}
	public String getWFID() {
		return WFID;
	}
	public void setWFID(String wFID) {
		WFID = wFID;
	}
	public String getPROJECTID() {
		return PROJECTID;
	}
	public void setPROJECTID(String pROJECTID) {
		PROJECTID = pROJECTID;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getNOTE() {
		return NOTE;
	}
	public void setNOTE(String nOTE) {
		NOTE = nOTE;
	}
	public String getSERIAL() {
		return SERIAL;
	}
	public void setSERIAL(String sERIAL) {
		SERIAL = sERIAL;
	}
	public List<Map<String,String>> getNodeclrs(String taskid,DataTable dt) throws Exception{
		if(dt !=null){
			this.loadCLR(taskid,dt);
		}else{
			if(nodeclrs.size()==0){
				this.loadCLR(taskid,null);
			}
		}
		return nodeclrs;
	}
	public void setNodeclrs(List<Map<String,String>> nodeclrs) {
		this.nodeclrs = nodeclrs;
	}
	public List<NodeCLML> getNodeclmls() throws Exception{
		if(nodeclmls.size()==0){
			this.loadCLML();
		}
		return nodeclmls;
	}
	public void setNodeclmls(List<NodeCLML> nodeclmls) {
		this.nodeclmls = nodeclmls;
	}
	public String getSTARTTAG() {
		return STARTTAG;
	}
	public void setSTARTTAG(String sTARTTAG) {
		STARTTAG = sTARTTAG;
	}
	public String getTablename() {
		return tablename;
	}
	public void setTablename(String tablename) {
		this.tablename = tablename;
	}
	public void autoLoadCLML(){
		nodeclmls.add(new NodeCLML());
	}
	public String getHQTAG() {
		return HQTAG;
	}
	public void setHQTAG(String hQTAG) {
		HQTAG = hQTAG;
	}
	public String getSPUNIT() {
		return SPUNIT;
	}
	public void setSPUNIT(String sPUNIT) {
		SPUNIT = sPUNIT;
	}
	public String getSBTYPE() {
		return SBTYPE;
	}
	public void setSBTYPE(String sBTYPE) {
		SBTYPE = sBTYPE;
	}
	public String getDSLLX() {
		return DSLLX;
	}
	public void setDSLLX(String dSLLX) {
		DSLLX = dSLLX;
	}
	//获取所有参与单元不重复
	public List<String> getClRunits(String taskid) throws Exception{
		List<String> ClROrgs=new ArrayList<String>();
		
		for(Map<String,String> clr:this.getNodeclrs(taskid,null)){
			if(!ClROrgs.contains(clr.get("UNITID"))){
				ClROrgs.add(clr.get("UNITID"));
			}
		}
		return ClROrgs;
	}
	//节点处理命令子类
	public class NodeCLML {
		private String nodeclmlid;//编号
		private String nodeid;//关联节点编号
		private String BTNNAME;//按钮名称
		private String FILTER;//执行条件
		private String TGZB;//会签通过占比
		private String SERIAL;//序号
		private String tnodeid;//下步节点编号
		private String CONFIELD;//比较字段
		private String CONSYMBOL;//比较符号
		private String CONCONTENT;//比较内容
		
		public String getNodeclmlid() {
			return nodeclmlid;
		}
		public void setNodeclmlid(String nodeclmlid) {
			this.nodeclmlid = nodeclmlid;
		}
		public String getNodeid() {
			return nodeid;
		}
		public void setNodeid(String nodeid) {
			this.nodeid = nodeid;
		}
		public String getBTNNAME() {
			return BTNNAME;
		}
		public void setBTNNAME(String bTNNAME) {
			BTNNAME = bTNNAME;
		}
		public String getFILTER() {
			return FILTER;
		}
		public void setFILTER(String fILTER) {
			FILTER = fILTER;
		}
		public String getSERIAL() {
			return SERIAL;
		}
		public void setSERIAL(String sERIAL) {
			SERIAL = sERIAL;
		}
		public String getTnodeid() {
			return tnodeid;
		}
		public void setTnodeid(String tnodeid) {
			this.tnodeid = tnodeid;
		}
		public String getTGZB() {
			return TGZB;
		}
		public void setTGZB(String tGZB) {
			TGZB = tGZB;
		}
		public String getCONFIELD() {
			return CONFIELD;
		}
		public void setCONFIELD(String cONFIELD) {
			CONFIELD = cONFIELD;
		}
		public String getCONSYMBOL() {
			return CONSYMBOL;
		}
		public void setCONSYMBOL(String cONSYMBOL) {
			CONSYMBOL = cONSYMBOL;
		}
		public String getCONCONTENT() {
			return CONCONTENT;
		}
		public void setCONCONTENT(String cONCONTENT) {
			CONCONTENT = cONCONTENT;
		}
		
	}
	/*//节点处理人子类
	public class NodeCLR {
		private String nodeclrid;//编号
		private String nodeid;//关联节点编号
		private String orgid;//单位编号
		private String GWBH;//岗位编号
		private String gwry;//岗位人员
		private String QYTJ;//启用条件
		
		public String getNodeclrid() {
			return nodeclrid;
		}
		public void setNodeclrid(String nodeclrid) {
			this.nodeclrid = nodeclrid;
		}
		public String getNodeid() {
			return nodeid;
		}
		public void setNodeid(String nodeid) {
			this.nodeid = nodeid;
		}
		public String getOrgid() {
			return orgid;
		}
		public void setOrgid(String orgid) {
			this.orgid = orgid;
		}
		public String getGWBH() {
			return GWBH;
		}
		public void setGWBH(String gWBH) {
			GWBH = gWBH;
		}
		public String getGwry() {
			return gwry;
		}
		public void setGwry(String gwry) {
			this.gwry = gwry;
		}
		public String getQYTJ() {
			return QYTJ;
		}
		public void setQYTJ(String qYTJ) {
			QYTJ = qYTJ;
		}
		
	}*/
}
