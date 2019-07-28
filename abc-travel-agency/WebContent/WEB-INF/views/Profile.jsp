<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/Header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link
	href="http://emis.icddrb.org:8080/emis-monitoringtools/resources/TemplateCSS/select2.min.css"
	rel="stylesheet" type="text/css" />
<style>
body {
	background: #F1F3FA;
}

/* Profile container */
.profile {
	margin: 20px 0;
}

/* Profile sidebar */
.profile-sidebar {
	padding: 20px 0 10px 0;
	background: #fff;
}

.profile-userpic img {
	float: none;
	margin: 0 auto;
	width: 50%;
	height: 50%;
	-webkit-border-radius: 50% !important;
	-moz-border-radius: 50% !important;
	border-radius: 50% !important;
}

.profile-usertitle {
	text-align: center;
	margin-top: 20px;
}

.profile-usertitle-name {
	color: #5a7391;
	font-size: 16px;
	font-weight: 600;
	margin-bottom: 7px;
}

.profile-usertitle-job {
	text-transform: uppercase;
	color: #5b9bd1;
	font-size: 12px;
	font-weight: 600;
	margin-bottom: 15px;
}

.profile-userbuttons {
	text-align: center;
	margin-top: 10px;
}

.profile-userbuttons .btn {
	text-transform: uppercase;
	font-size: 11px;
	font-weight: 600;
	padding: 6px 15px;
	margin-right: 5px;
}

.profile-userbuttons .btn:last-child {
	margin-right: 0px;
}

.profile-usermenu {
	margin-top: 30px;
}

.profile-usermenu ul li {
	border-bottom: 1px solid #f0f4f7;
}

.profile-usermenu ul li:last-child {
	border-bottom: none;
}

.profile-usermenu ul li a {
	color: #93a3b5;
	font-size: 14px;
	font-weight: 400;
}

.profile-usermenu ul li a i {
	margin-right: 8px;
	font-size: 14px;
}

.profile-usermenu ul li a:hover {
	background-color: #fafcfd;
	color: #5b9bd1;
}

.profile-usermenu ul li.active {
	border-bottom: none;
}

.profile-usermenu ul li.active a {
	color: #5b9bd1;
	background-color: #f6f9fb;
	border-left: 2px solid #5b9bd1;
	margin-left: -2px;
}

/* Profile Content */
.profile-content {
	padding: 20px;
	background: #fff;
	min-height: 460px;
}

.page .container {
	margin-top: -5px;
}

fieldset .section {
	padding: 12px 26px;
}

label {
	margin-bottom: 2px;
}

fieldset textarea {
	margin-bottom: 10px !important;
}

.user-type {
	margin-bottom: 5px;
}

fieldset {
	margin-bottom: -25px;
}

fieldset .col-sm-offset-9 {
	margin-left: 76.5%;
	margin-top: 8px;
}

.post-submit {
	margin-top: 10px !important;
}

/* 	only for this page */
.btn-post {
	display: none;
}

.center {
	text-align: center;
}
</style>


<div class="page">
	<div class="container">
	<input type="hidden" value="${pageContext.request.contextPath}/change-status" name="change-status">
		<div class="row profile">
			<c:if test="${post}">
				<div class="col-md-12">
					<div class="alert alert-success alert-dismissible fade in center">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<strong>Success!</strong> Your status has been created.
					</div>
				</div>
			</c:if>
			<c:if test="${post==false}">
				<div class="col-md-12">
					<div
						class="alert alert-danger center alert-dismissible fade in center">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<strong>Sorry!</strong> Something went wrong, try later.
					</div>
				</div>
			</c:if>
			<div class="col-md-3">
				<div class="profile-sidebar">
					<!-- SIDEBAR USERPIC -->
					<div class="profile-userpic">
						<img src="https://www.vovia.com/assets/icon-user2.png"
							class="img-responsive" alt="">
					</div>
					<!-- END SIDEBAR USERPIC -->
					<!-- SIDEBAR USER TITLE -->
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">${user.firstName}
							${user.lastName}</div>
						<div class="profile-usertitle-job-">
							<i class="fa fa-envelope-o" aria-hidden="true"></i> Email:
							${user.email}
						</div>
						<div class="profile-usertitle-job-">
							<i class="fa fa-clock-o" aria-hidden="true"></i> Join: <span
								id="join-info">${user.createdDate}</span>
						</div>
					</div>
					<!-- END SIDEBAR USER TITLE -->
					<!-- SIDEBAR BUTTONS -->
					<div class="profile-userbuttons">
						<button type="button" class="btn btn-success btn-sm">Follow</button>
						<button type="button" class="btn btn-danger btn-sm">Message</button>
					</div>
					<!-- SIDEBAR MENU -->
					<div class="profile-usermenu">
						<ul class="nav">
							<li class="active"><a href="#"> <i class="fa fa-home"
									aria-hidden="true"></i> Overview
							</a></li>
							<li><a href="#"> <i class="fa fa-user"
									aria-hidden="true"></i> Account Settings
							</a></li>
							<li><a href="#" target="_blank"> <i class="fa fa-check"
									aria-hidden="true"></i> Tasks
							</a></li>
							<li><a href="#"> <i class="fa fa-flag"
									aria-hidden="true"></i> Help
							</a></li>
						</ul>
					</div>
					<!-- END MENU -->
				</div>
			</div>

			<div class="col-md-9">
				<form:form action="${pageContext.request.contextPath}/profile"
					method="POST" id="postStatus" commandName="status">
					<fieldset>
						<div class="section postdetails">
							<h4>Write a new post</h4>
							<div class="row form-group item-description">

								<label class="col-sm-12 label-title">Status<span
									class="required">*</span></label>
								<div class="col-sm-12">
									<form:textarea path="status" name="status" id="status"
										class="form-control" placeholder="Write status here" rows="4" />
									<form:errors path="status" cssClass="error" />
								</div>

								<label class="col-sm-12 label-title">Choose privacy<span
									class="required">*</span></label>
								<div class="col-sm-12 user-type">
									<form:radiobutton path="access" name="access" value="0"
										id="public" />
									<label for="male">Public </label>
									<form:radiobutton path="access" name="access" value="1"
										id="private" />
									<label for="female">Private</label>
								</div>
								<form:errors path="access" cssClass="error" />

								<label class="col-sm-12 label-title">Check in<span
									class="required">*</span></label>
								<div class="col-sm-12">

									<form:select path="locationId" name="locationId"
										id="locationId"
										class="form-control select2 select2-hidden-accessible"
										style="width: 100%; margin-right: 30px !important;"
										tabindex="-1" aria-hidden="true">
										<option selected="selected">Type your location here</option>
										<c:if test="${fn:length(locations) gt 0}">
											<c:forEach var="location" items="${locations}">
												<option value="${location.locationId}">${location.name}</option>
											</c:forEach>
										</c:if>
									</form:select>
									<form:errors path="locationId" cssClass="error" />
								</div>
								<div class="col-md-3 post-submit">
									<button type="submit"
										class="btn btn-primary btn-post-submit btn-xs">
										<i class="fa fa-paper-plane" aria-hidden="true"></i>&nbsp;
										Post
									</button>
								</div>
							</div>
						</div>
					</fieldset>
				</form:form>

				<c:forEach var="s" items="${listOfStatus}">
					<div class="media">
						<a class="pull-left" href="#"> <img class="media-object"
							src="https://www.vovia.com/assets/icon-user2.png">
						</a>
						<div class="media-body">
							<h4 class="media-heading">
								${user.firstName} ${user.lastName}
								<div class="dropdown pull-right clickable">
									<p class="dropdown-toggle" type="button" data-toggle="dropdown">
										<i class="fa fa-ellipsis-h" aria-hidden="true"></i>
									</p>
									<ul class="dropdown-menu">
										<li><a id="changePrivacy" data-info='{"statusId": ${s.statusId}, "access": ${s.access}}'>Privacy</a></li>
										<li><a href="#">Edit</a></li>
										<li><a href="#">Pin post</a></li>
									</ul>
								</div>
							</h4>
							<ul class="list-inline list-unstyled">
								<li><i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;${s.location}</li>
								<li><i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;${s.createdDate}</li>
								<li><i class="fa fa-globe" aria-hidden="true"></i>&nbsp;<span id="aceess${s.statusId}"><c:out
										value="${s.access eq 0 ? 'Public': 'Private'}" /></span></li>
							</ul>
							<p>${s.status}</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="privacyModal" role="dialog">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Change privacy</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-3">
						<div class="radio">
						  <label><input type="radio" name="accessEdit" value="0" id="publicEdit">Public</label>
						  <label><input type="radio" name="accessEdit" value="1" id="privateEdit">Private</label>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-success" id="submitAccessChange">Submit</button>
			</div>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/layouts/Footer.jsp"%>
<script
	src="http://emis.icddrb.org:8080/emis-monitoringtools/resources/TemplateJs/other/select2.full.min.js"
	type="text/javascript"></script>
<script>
	$(function () {
	    $.profile = $.profile || {
	    	currAccess : null,
	        init: function () {
	        	$('.select2').select2();
	    		$('#join-info').text($.app.convertTimeStamp($('#join-info').text()));
	    		$.profile.events.bindEvent();
        	},
            events: {
                bindEvent: function () {
                    $.profile.events.changePrivacy();
                    $.profile.events.submitAccessChange();
                },
                changePrivacy: function () {
                    $(document).off('click', '#changePrivacy').on('click', '#changePrivacy', function (e) {
                    	$('#privacyModal').modal('show');
                    	currAccess = $(this).data("info");
                    	if(currAccess.access==0){
                    		$('#publicEdit').prop('checked', true);
                    	}else{
                    		$('#privateEdit').prop('checked', true);
                    	}
                    });
                },
                submitAccessChange: function () {
                    $(document).off('click', '#submitAccessChange').on('click', '#submitAccessChange', function (e) {
                    	var radioVal = $("input[name='accessEdit']:checked").val();
                    	if(currAccess.access!=radioVal){
                    		$('#privacyModal').modal('hide');
                            $.ajax({
                                url: $('input[name="change-status"]').val(),
                                type: "GET",
                                data: {
                                	statusId: currAccess.statusId,
                                	access: radioVal
                                },
                                success: function (response) {
                                	response = JSON.parse(response);
                                	alert("Status change successfully");
                                	location.reload();
                                	
                                	
                                },error: function (error) {
                                	alert("Somthing went wrong");	
                                }
                            });
                    	}else{
                    		$('#privacyModal').modal('hide');
                    	}
                    });
                }
             },
	    };
	    $.profile.init();
	});
</script>