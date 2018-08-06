
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!-- 引入EasyUI的样式文件-->
<link rel="stylesheet"
      href="<%=request.getContextPath()%>/EasyUI/themes/default/easyui.css" type="text/css"/>

<!-- 引入EasyUI的图标样式文件-->
<link rel="stylesheet"
      href="<%=request.getContextPath()%>/EasyUI/themes/icon.css" type="text/css"/>
<head>
    <title>Title</title>
</head>
<body>
<!-- 引入JQuery -->
<script type="text/javascript"
        src="<%=request.getContextPath()%>/EasyUI/jquery.min.js"></script>

<!-- 引入EasyUI -->
<script type="text/javascript"
        src="<%=request.getContextPath()%>/EasyUI/jquery.easyui.min.js"></script>
<!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
<script type="text/javascript"
        src="<%=request.getContextPath()%>/EasyUI/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/EasyUI/util-js.js"></script>


<div id="tree_buju" class="easyui-layout" data-options="fit:true">
    <div data-options="region:'north',title:'欢迎',split:true" style="height:150px;">
    </div>

    <div data-options="region:'west',title:'列表',split:true" style="width:200px;">
        <ul id="chongwugl_tree"></ul>
    </div>

    <div data-options="region:'center',title:'内容'" style="padding:5px;background:#eee;">
        <div id="cwgl_xxk" class="easyui-tabs" data-options="fit:true"  >

        </div>
    </div>
</div>


<script>
    $(function (){
        $('#chongwugl_tree').tree({
            url:'<%=request.getContextPath()%>/showall/selectquanxian ' ,
            parentField: "pid",//对应实体类中父级节点的属性名
            onSelect:function(node){
                if(node.url != null && node.url != ''){
                    lbxxk(node.url,node.text);
                }
            }
        });
    })

    function lbxxk(dizhi,ming){

        var flag = $('#cwgl_xxk').tabs('exists',ming);
        if(flag){

            $('#cwgl_xxk').tabs('select',ming);
        }else{
            $('#cwgl_xxk').tabs('add',{
                title:ming,
                href:"<%=request.getContextPath()%>"+dizhi,
                closable:true,
                tools:[{
                    iconCls:'icon-mini-refresh',
                    handler:function(){
                        $('#cwgl_xxk').tabs('getSelected').panel('refresh')
                    }
                }]
            });
        }
    }


</script>
</body>
</html>
