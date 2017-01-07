<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="${pageContext.request.contextPath}/bootstrap2.3.2/css/bootstrap.min.css" rel="stylesheet" />
    <title></title>
    <link href="${pageContext.request.contextPath}/css/Common.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/Index2.css" rel="stylesheet" />
    <script src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
</head>

<body>
    <div class="container-fluid">
        <div class="row-fluid">
            <h4>数据列表</h4>
            <div>
            	<form action="">
            		 <div class="uinArea" id="uinArea">
						客户名称：
                	 <input type="text" id="cust_name" name="cust_name" class="inputstyle" value=${query.cust_name }>
                		客户类型：
               		<input type="text" id="cust_type" name="cust_type" class="inputstyle" value=${query.cust_type }>
               		<input type="submit" value="查询" style="width:60px;" class="button_blue"/>
                </div>
            	</form>
            </div>
            <div class="add"><a class="btn btn-success" onclick="openadd();">新增</a></div>
            <div class="w">
                <div class="span12">
                    <table class="table table-condensed table-bordered table-hover tab">
                        <thead>
                            <tr>
                                <th>客户名称</th>
                                <th>客户类型</th>
                                <th>客户电话</th>
                                <th>客户地址</th>
                                <th>所属用户角色</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody id="tbody">
                            <c:forEach items="${page.rows}" var="row">
                             <tr>
                               <%--  <td>${row.cid}</td> --%>
								<td>${row.cust_name}</td>
								<td>${row.cust_type}</td>
								<td>${row.cust_phone}</td>
								<td>${row.cust_address}</td>
								<td>${row.nickname}</td>
                                <th><a href="#"  onclick="deleteCustomer(${row.cid})">删除</a></th>
                            </tr>
                            </c:forEach> 
                            <%-- <c:forEach items="${customerList}" var="c">
                             <tr>
                                <td>${c.cid}</td>
								<td>${c.cust_name}</td>
								<td>${c.cust_type}</td>
								<td>${c.cust_phone}</td>
								<td>${c.cust_address}</td>
								<td>${c.cust_link_user}</td>
                                <th><a href="#">删除</a></th>
                            </tr>
                            </c:forEach> --%>
                        </tbody>
                    </table>
                    <div id="page" class="tr"></div>
                </div>
            </div>

            <div id="addModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="myModalLabel">添加客户</h3>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="save_customer_form">
                        <div class="control-group">
                            <label class="control-label" for="cust_name">客户名称</label>
                            <div class="controls">
                                <input type="text" id="cust_name" name="cust_name"  placeholder="客户名称" >
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="cust_type">客户类型</label>
                            <div class="controls">
                                <input type="text" id="cust_type" name="cust_type" placeholder="客户类型"  >
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="cust_phone">客户电话</label>
                            <div class="controls">
                                <input type="text" id="cust_phone" name="cust_phone" placeholder="客户电话">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="cust_address">客户地址</label>
                            <div class="controls">
                                <input type="text" id="cust_address" name="cust_address" placeholder="客户地址">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="cust_link_user">所属用户角色</label>
                            <!-- <div class="controls">
                                <input type="text" id="cust_link_user" name="cust_link_user" placeholder="所属用户角色">
                            </div> -->
                            <select	class="form-control" id="cust_link_user" placeholder="客户来源" name="uid">
								<option value="">--请选择--</option>
								<c:forEach items="${userlist}" var="item">
									<option value="${item.uid}">${item.nickname }</option>
								</c:forEach>
							</select>
                            
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
                    <button class="btn btn-primary" id="add" onclick="add();">保存</button>
                </div>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap2.3.2/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/Index2.js"></script>
    <script type="text/javascript">
	 function deleteCustomer(id) {
	if(confirm('确实要删除该客户吗?')) {
		$.post("${pageContext.request.contextPath}/delete.action",{"id":id},function(data){
			if(data == "OK"){
				alert("客户信息更新成功！");
			} else{
				alert("更新失败, 请重新尝试!");
			}
			window.location.reload();
		});
	}
	} 
	function add() {
		//alert($("#edit_customer_form").serialize());
		$.post("${pageContext.request.contextPath}/add.action",$("#save_customer_form").serialize(),function(data){
			if(data == "OK"){
				alert("客户信息保存成功！");
			} else{
				alert("保存失败, 请重新尝试!");
			}
			window.location.reload();
		});
	}
</script>
</body>
</html>