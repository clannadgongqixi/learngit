<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table id="wchenusertable"></table>
<div id="updatesystemDivId"></div>
<script type="text/javascript">
$('#wchenusertable').datagrid({    
    url:'<%=request.getContextPath()%>/showall/selectuser',
    singleSelect:true,
    checkOnSelect:false,
    selectOnCheck:false,
    columns:[[    
        {field:'text',title:'用户名称',width:100},    
        {field:'           ',title:'操作',width:100,
        	formatter: function(value,row,index){
return "<a href='javascript:usertorole("+row.id+")'>编辑</a>";
			}
        }    
    ]]
});
function usertorole(userid){
	$('#updatesystemDivId').dialog({    
	    title: '赋予角色',    
	    width: 600,    
	    height: 400,    
	    closed: false,    
	    cache: false,    
	    href: '<%=request.getContextPath()%>/index/usertorole?userid='+userid,
	    modal: true,
		    buttons:[{
				text:'保存',
				handler:function(){
					var caketeuserid = $("#useridss").val();
					 var qx_qxxz_arr = $("#roletree").tree('getChecked')
					 var qxids = "";
						for (var i = 0; i < qx_qxxz_arr.length; i++) {
							qxids += "," + qx_qxxz_arr[i].id
						}
						qxids = qxids.substring(1);
						alert(caketeuserid)
						alert(qxids)
							 $.ajax({
								url:"<%=request.getContextPath()%>/showall/addusertorole",
								type:"post",
								data:{'caketeuserid':caketeuserid,'qxids':qxids},
								dataType:"json",
								success:function (result){
									if(result==1){
										alert("赋予成功")
										$('#updatesystemDivId').window('close');
									}
								}
							}); 
				}
			},{
				text:'关闭',
				handler:function(){
					$('#updatesystemDivId').window('close');
				}
			}]
		})
}
</script>
</body>
</html>