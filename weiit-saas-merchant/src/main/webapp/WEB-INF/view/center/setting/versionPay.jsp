<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="../common/header.jsp" %>
 
			
			<!-- Main content -->
			<div class="content-wrapper">

				<!-- Content area -->
				<div class="content">
				
					<div class="row">
						<div class="col-md-12">
							<!-- 表单验证开始 -->
							<div class="panel panel-flat"> 
								<div class="panel-body">
								<ul class="stepy-header">
									<li>
									<div>1</div><span>选择服务版本</span>
									</li>
									<li><div>2</div><span>确认付款</span></li>
									<li class="stepy-active" id="payFinishStep"><div>3</div><span>完成订购</span></li>
							    </ul>
								<form class="form-horizontal" method="post" >
									<fieldset class="content-group">
										<div class="form-group">
											<label class="col-md-6 text-right">订单编号：<span
												class="text-danger">*</span></label>
											<div class="col-md-6">
												<span class="text-bold">${payOrderInfo.out_trade_no }</span>
												<input type="hidden" name="out_trade_no" id="out_trade_no" value="${payOrderInfo.out_trade_no }"/>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-6 text-right">支付金额：<span
												class="text-danger">*</span></label>
											<div class="col-md-6">
												<span class="text-success text-bold"><fmt:formatNumber type="number" value="${payOrderInfo.pay_price }" pattern="0.00" maxFractionDigits="2" /> </span>
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-6 text-right">系统版本：<span
												class="text-danger">*</span></label>
											<div class="col-md-6">
												<span class="text-success text-bold">${payOrderInfo.product_name }</span>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-md-6 text-right"></label>
											<div class="col-md-3" style="width:220px;margin-left:-60px;">
												<img src="${imageDomain }${payOrderInfo.weixin_qr_code }" height="200" width="200" class="ep-wxpay-qrcode">
												<div style="height:30px;line-height:30px;background-color:#00c800;font-size:12px;color:#fff;width:200px;text-align:center;margin-bottom:20px;">请打开手机微信，扫一扫完成支付</div> 
											</div>
											<div class="col-md-3">
												<img src="${pageContext.request.contextPath}/resource/images/ep_sys_wx_tip.jpg">
											</div>
										</div>
										<div class="form-group" id="showState" style="display:none;">
											<label class="col-md-6 text-right"></label>
											<div class="col-md-6" style="margin-left:-60px;">
												<a class="btn border-success text-success btn-flat btn-icon btn-rounded btn-sm"><i class="icon-checkmark3"></i></a>
												<span class="text-bold text-success">订单付款成功,请刷新当前页面.</span>
											</div>
										</div>
										<div class="text-center">
											&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:history.back(-1)" id="qua1" class="btn btn-default" >返回上一步<i class="icon-undo2 position-right"></i></a>	
										</div>
									</fieldset>
				
								</form>
								</div>
							</div>
							<!-- /form validation -->
						</div>
					 </div>
					
					
				</div>
				<!-- /content area -->
				
			</div>
			
			<!-- /main content -->
			<%@include file="../common/footer.jsp" %>
<script>
//启动定时器

var timeout = false; //启动及关闭按钮  
checkOrderState();
function checkOrderState()  
{  
  if(timeout) return;  
  $.ajax({
	    url:'${pageContext.request.contextPath}/center/account/versionPayCheck',
	    type:'POST',
	    data:{"out_trade_no":$("#out_trade_no").val()},
	    dataType:'json',
	    success:function(result){
	    	if(result.code==0){
	    		if(result.data.state==1){
	    			$("#showState").show();
	    			timeout=true;
	    			$("#payFinishStep").attr("class","");//最后一步变成√
	    		}else{
	    			$("#showState").hide();
	    		} 
	    	}else{
	    		$("#showState").hide();
	    	}
	    },
	    error:function(xhr,textStatus){
	    }
  });
  setTimeout(checkOrderState,2000); //time是指本身,延时递归调用自己,100为间隔调用时间,单位毫秒  
}  


</script>
