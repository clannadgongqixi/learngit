
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="quanxian_buju" class="easyui-layout" data-options="fit:true">
    <div data-options="region:'west',title:'选择',split:true" style="width:200px;">
         <a href="javascript:selectxxk('/index/gouser','查询用户')">查询用户</a><br>
         <a href="javascript:selectxxk('/index/gorole','查询角色')">查询角色</a>
    </div>

    <div data-options="region:'center',title:'内容'" style="padding:5px;background:#eee;">
        <div id="cwgl_xxks" class="easyui-tabs" data-options="fit:true"  >
        </div>
    </div>
</div>

<script>
    function selectxxk(dizhi,ming){

        var flag = $('#cwgl_xxks').tabs('exists',ming);
        if(flag){

            $('#cwgl_xxks').tabs('select',ming);
        }else{
            $('#cwgl_xxks').tabs('add',{
                title:ming,
                href:"<%=request.getContextPath()%>"+dizhi,
                closable:true,
                tools:[{
                    iconCls:'icon-mini-refresh',
                    handler:function(){
                        $('#cwgl_xxks').tabs('getSelected').panel('refresh')
                    }
                }]
            });
        }
    }

</script>
</body>
</html>
