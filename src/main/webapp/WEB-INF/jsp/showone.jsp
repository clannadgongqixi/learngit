<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 2018/8/6
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>

<div id="gg"></div>
<script type="text/javascript">
   $("#gg").datagrid({
           url:'<%=request.getContextPath()%>/showall/selectuser',
           singleSelect:true,
           checkOnSelect:false,
           selectOnCheck:false,
           columns:[[

               {field:'text',title:'方法'},
               {field:'text',title :"gg"}


       ]]





   }
   )





    </script>






</body>
</html>
