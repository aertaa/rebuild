<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/_include/Head.jsp"%>
<link rel="stylesheet" type="text/css" href="${baseUrl}/assets/css/view-page.css">
<title>${entityLabel}视图</title>
</head>
<body class="view-body">
<div class="view-header">
	<span class="header-icon zmdi zmdi-${entityIcon}"></span>
	<h3 class="title">${entityLabel}视图</h3>
	<span>
		<a class="close J_close"><i class="zmdi zmdi-close"></i></a>
	</span>
</div>
<div class="main-content container-fluid">
	<div class="row">
		<div class="col-sm-9 pr-0">
			<div class="tab-container">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active" href="#tab-rbview" data-toggle="tab">${entityLabel}信息</a></li>
				</ul>
				<div class="tab-content">
                    <div class="tab-pane active" id="tab-rbview"></div>
				</div>
			</div>
		</div>
		<div class="col-sm-3 view-metas">
			<div class="view-action row">
				<div class="col-6 pr-1 mb-2">
					<button class="btn btn-secondary J_edit" type="button"><i class="icon zmdi zmdi-border-color"></i> 编辑</button>
				</div>
				<div class="col-6 pl-1 mb-2 btn-group J_action">
					<button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown"><i class="icon zmdi zmdi-more-vert"></i> 更多</button>
					<div class="dropdown-menu dropdown-menu-right">
						<a class="dropdown-item J_delete"><i class="icon zmdi zmdi-delete"></i> 删除</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item J_changeDept"><i class="icon zmdi zmdi-accounts"></i> 改变部门</a>
						<a class="dropdown-item J_changeRole"><i class="icon zmdi zmdi-lock"></i> 改变角色</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/_include/Foot.jsp"%>
<script src="${baseUrl}/assets/js/rb-forms.jsx" type="text/babel"></script>
<script src="${baseUrl}/assets/js/rb-forms-ext.jsx" type="text/babel"></script>
<script src="${baseUrl}/assets/js/rb-view.jsx" type="text/babel"></script>
<script type="text/babel">
$(document).ready(function(){
	RbViewPage.init('${id}', ['User','${entityLabel}','${entityIcon}'])
	if (rb.isAdminUser == false || rb.isAdminVerified == false) $('.view-action').remove()

	$('.J_delete').off('click').click(function(){
		rb.alert('我们建议你停用用户，而非删除', '删除用户', { confirmText: '停用', confirm: function(){
			let _data = { isDisabled: true }
			_data.metadata = { entity: 'User', id: '${id}' }
			$.post(rb.baseUrl + '/app/entity/record-save', JSON.stringify(_data), function(res){
            	if (res.error_code == 0){
					rb.notice('用户已停用', 'success')
					location.reload()
				}
        	})
		} })
	})
	$('.J_changeDept').click(function(){
		rb.modal(rb.baseUrl + '/p/admin/bizuser/change-dept?user=${id}', '改变部门', { width:580 } )
	})
	$('.J_changeRole').click(function(){
		rb.modal(rb.baseUrl + '/p/admin/bizuser/change-role?user=${id}', '改变角色', { width:580 } )
	})
});
</script>
</body>
</html>
