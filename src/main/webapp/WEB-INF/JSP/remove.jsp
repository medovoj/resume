<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" 	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="resume" 	tagdir="/WEB-INF/tags"%>
<sec:authentication property="principal" var="CURRENT_PROFILE" />
<div class="panel panel-warning">
	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="fa fa-exclamation-circle"></i> Deleting an account is an irrevocable operation!
		</h3>
	</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-xs-12 text-center">
				<h4>Delete account <strong>MAY NOT BE CANCELLED</strong>. Please confirm the deletion: <strong>${CURRENT_PROFILE.username }</strong>!</h4>
				<hr/>
				<form action="/remove" method="post">
					<sec:csrfInput/>
					<input type="submit" value="Confirm deleting" class="btn btn-danger" />
				</form>
			</div>
		</div>
	</div>
</div>