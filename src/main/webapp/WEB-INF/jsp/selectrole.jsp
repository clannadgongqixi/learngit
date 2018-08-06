<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table id="wchenroletable"></table>
<div id="updateroleDivId"></div>
<script type="text/javascript">
$('#wchenroletable').datagrid({    
    url:'<%=request.getContextPath()%>/showall/selectroleall',
    singleSelect:true,
    checkOnSelect:false,
    selectOnCheck:false,
    columns:[[    
        {field:'text',title:'角色名称',width:100},    
        {field:'           ',title:'操作',width:100,
        	formatter: function(value,row,index){
return "<a href='javascript:roletojurisdiction("+row.id+")'>编辑</a>"+"&nbsp <a href='javascript:deluser("+row.id+")'>删除</a>";
			}
        }    
    ]]
});




function roletojurisdiction(roleid){
	$('#updateroleDivId').dialog({    
	    title: '赋予权限',    
	    width: 600,    
	    height: 400,    
	    closed: false,    
	    cache: false,    
	    href: '../vacation/roletojurisdiction.do?roleid='+roleid,    
	    modal: true,
		    buttons:[{
				text:'保存',
				handler:function(){
					var caketeroleid = $("#roleid_update").val();
					 var urisdiction_qxxz_arr = $("#jurisdictiontree").tree('getChecked')
					 var urisdiction = "";
						for (var i = 0; i < urisdiction_qxxz_arr.length; i++) {
							urisdiction += "," + urisdiction_qxxz_arr[i].id
						}
						urisdiction = urisdiction.substring(1);
							 $.ajax({
								url:'../vacation/roletojurisdictionupdate.do',
								type:"post",
								data:{'caketeroleid':caketeroleid,'urisdiction':urisdiction},
								dataType:"json",
								success:function (result){
									if(result==1){
										alert("赋予成功")
										$('#updateroleDivId').window('close');
									}
								}
							}); 
				}
			},{
				text:'关闭',
				handler:function(){
					$('#updateroleDivId').window('close');
				}
			}]
		})
}
    function deluser (ids) {
      $.ajax({
          url:"<%=request.getContextPath()%>/showall/deleuser",
          type:"post",
          data:{"ids":ids},
          dataType:"json",
          success:function(result){
              if(result.success=="true"){
                  alert(result.result);
                  search1();
              } else {
                  alert(result.result);
              }
          },
          error:function(){

          }
      })





}





</script>
</body>
</html>