<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/Header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
.margin {
	margin-top: 35px;
}
</style>
<div class="page">
	<div class="container">
		<span class="margin"></span>


		<c:forEach var="s" items="${listOfStatus}">
			<div class="media">
				<a class="pull-left" href="#"> <img class="media-object"
					src="https://www.vovia.com/assets/icon-user2.png">
				</a>
				<div class="media-body">
					<h4 class="media-heading">
						${s.firstName} ${s.lastName}
					</h4>
					<ul class="list-inline list-unstyled">
						<li><i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;${s.location}</li>
						<li><i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;${s.createdDate}</li>
					</ul>
					<p>${s.status}</p>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<%@include file="/WEB-INF/views/layouts/Footer.jsp"%>