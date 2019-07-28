<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!-- footer -->
	<footer id="footer" class="clearfix">
		<div class="footer-bottom clearfix text-center">
			<div class="container">
				<p class="center">Copyright &copy; <a href="#">ABC Travel Agency</a> 2019</p>
			</div>
		</div>
	</footer>
    <!-- JS Library-->
    <script src="${pageContext.request.contextPath}/static/scripts/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/scripts/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/scripts/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/scripts/js/jquery.blockUI.js"></script>
    <script src="${pageContext.request.contextPath}/static/scripts/js/price-range.js"></script>   
    <script src="${pageContext.request.contextPath}/static/scripts/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/static/scripts/js/switcher.js"></script>
	<script src="${pageContext.request.contextPath}/static/scripts/js/font-awesome.js"></script>
	<script src="${pageContext.request.contextPath}/static/scripts/js/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath}/static/scripts/js/toastr.js"></script>
	<!--validation -->
	<script src="${pageContext.request.contextPath}/static/scripts/js/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/scripts/js/additional-methods.min.js"></script>
	<!-- JS -->
	<script src="${pageContext.request.contextPath}/static/scripts/Script.js"></script>
	<script src="${pageContext.request.contextPath}/static/scripts/App.js"></script>
  </body>
</html>
<%@include file="/WEB-INF/views/layouts/Validator.jsp"%>
<script>
	$('.datePicker').datepicker({
	    format: 'dd/mm/yyyy',
	    todayBtn: "linked",
	    clearBtn: true,
	    autoclose: true
	});
</script>