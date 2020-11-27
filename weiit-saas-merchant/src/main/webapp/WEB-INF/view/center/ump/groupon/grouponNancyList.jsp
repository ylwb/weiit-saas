<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="../../common/header.jsp" %>

			<!-- Secondary sidebar -->
			<div class="sidebar sidebar-secondary sidebar-default" style="width:180px">
				<div class="sidebar-content">
					<!-- Sub navigation -->
					<div class="sidebar-category">
						<div class="category-title">
							<span>营销服务</span>
						</div>
						<div class="category-content no-padding">
							<ul class="navigation navigation-alt navigation-accordion">
								<li class="active"><a href="${pageContext.request.contextPath}/center/ump/dashboard"><i class="icon-wrench2"></i>常规营销</a></li>
								<%--<li class="active"><a href="${pageContext.request.contextPath}/center/ump/scene"><i class="icon-diamond"></i>场景营销</a></li>--%>
							</ul>
						</div>
					</div>
					<!-- /sub navigation -->
					
				</div>
			</div>	
			<!--  /Secondary sidebar -->
			
			<!-- Main content -->
			<div class="content-wrapper">
				<!-- Page header -->
				<div class="page-header">
					<div class="page-header-content">
						<div class="page-title"  style="height:70px;padding-top:20px;">
							<h4>
								<i class="icon-arrow-left52 position-left"></i> <span
									class="text-semibold"> 拼团活动详情记录 </span>
							</h4>
						</div>
					</div> 
				</div>
				<!-- /page header -->
			
				<!-- Content area -->
				<div class="content">
					<!-- Bordered striped table -->
					<div class="panel panel-flat">
			
						<div class="panel-body">
							<form class="form-horizontal" name="searchform" id="searchform" 
								action="${pageContext.request.contextPath}/center/ump/groupon/grouponNancyList" method="post">
								<input type="hidden" name="validate_id" id="validate_id" value="${queryParam.validate_id}"/>
								<input type="hidden" name="validate_id_token" id="validate_id_token" value="${queryParam.validate_id_token}"/>
								<div style="margin-left: -10px;"> 
									<div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">订单编号</span> <input type="text" class="form-control" name="order_num" value="${queryParam.order_num }">
										</div>
									</div>
								</div>
								&nbsp;&nbsp;
								<button class="btn bg-blue" type="submit">搜索</button>&nbsp;&nbsp;&nbsp;
								<a href="${pageContext.request.contextPath}/center/ump/groupon/grouponDetailList?validate_id=${queryParam.validate_id}&validate_id_token=${queryParam.validate_id_token}" id="qua1" class="btn btn-default" >返回</a>	
								<br> <br>
								<div class="table-responsive">
									<table id="data-table" class="table">
										 <thead>
											<tr > 
												<th>编号</th>
												<th>团员</th>
												<th>参团时间</th>
												<th>付款时间</th>
												<th>参团状态</th>
												<th>订单编号</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${pageInfo.list}" var="info" varStatus="ind">
						                    <tr>
						                        <td>${ind.count}</td> 
						                        <td><img src="${info.user_img}" width="40" height="40"/>${info.user_name}</td> 
						                        <td><fmt:formatDate value="${info.create_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
												<td><fmt:formatDate value="${info.pay_time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
												<td>
						                           	<c:if test="${info.state == 1 }">进行中</c:if>
						                           	<c:if test="${info.state == 2 }">未完成</c:if>
						                           	<c:if test="${info.state == 3 }">已完成</c:if>
						                           	<c:if test="${info.state == 4 }">未支付</c:if>
						                           	<c:if test="${info.state == -1 }">已取消</c:if>
												</td>
												<td>	<c:if test="${info.state == 3 }"><a href="${pageContext.request.contextPath}/center/order/orderDetail?order_num=${info.order_num}" class="text-blue text-bold">${info.order_num}</a></c:if><c:if test="${info.state != 3 }">${info.order_num}</c:if></td>

						                    </tr>
						                </c:forEach>
									</table>
			
								</div>
								<div id="pager" class="panel-body">  
								</div>
							</form>
						</div>
					</div> 
					<!-- /bordered striped table -->
			 
				</div>
				<!-- /content area -->
			</div>
			<!-- /main content -->
			
			<%@include file="../../common/footer.jsp"%>
			
			<script>
			$(document).ready(function() {
			    $("#pager").pager({
			        pagenumber: ${pageInfo.pageNum}, 
			        pagecount: ${pageInfo.pages},
			        pagesize: ${pageInfo.pageSize} ,
			        pagerecordSize: ${pageInfo.total},
			        buttonClickCallback: searchSubmit });
			});
		 	 
			</script>
						
