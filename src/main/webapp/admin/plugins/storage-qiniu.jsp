<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.rebuild.utils.StringsUtils"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/_include/Head.jsp"%>
<title>云存储配置</title>
<style type="text/css">
.syscfg h5{background-color:#eee;margin:0;padding:10px;}
.syscfg .table td{padding:10px;}
.syscfg .table td p{margin:0;color:#999;font-weight:normal;font-size:12px;}
</style>
</head>
<body>
<div class="rb-wrapper rb-fixed-sidebar rb-collapsible-sidebar rb-collapsible-sidebar-hide-logo rb-color-header">
	<jsp:include page="/_include/NavTop.jsp">
		<jsp:param value="云存储配置" name="pageTitle"/>
	</jsp:include>
	<jsp:include page="/_include/NavLeftAdmin.jsp">
		<jsp:param value="plugins-storage" name="activeNav"/>
	</jsp:include>
	<div class="rb-content">
		<div class="main-content container-fluid syscfg">
			<div class="row">
				<div class="col-9">
					<div class="card">
						<div class="card-header card-header-divider">云存储</div>
						<div class="card-body">
							<h5>七牛云</h5>
							<% 
							String account[] = SystemConfiguration.getStorageAccount();
							String domain = account == null ? "" : account[3];
							%>
							<table class="table">
							<tbody>
								<tr>
									<td width="50%">访问域名</td>
									<td><a href="<%=domain%>" class="link" target="_blank"><%=domain%></a></td>
								</tr>
								<tr>
									<td>存储空间</td>
									<td><%=account == null ? "" : account[2]%></td>
								</tr>
								<tr>
									<td>秘钥 AK</td>
									<td><%=account == null ? "" : StringsUtils.stars(account[0])%></td>
								</tr>
								<tr>
									<td>秘钥 SK</td>
									<td><%=account == null ? "" : StringsUtils.stars(account[1])%></td>
								</tr>
							</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="col-3">
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/_include/Foot.jsp"%>
</body>
</html>
