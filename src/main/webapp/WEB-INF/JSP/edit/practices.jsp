<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"   	uri="http://www.springframework.org/tags/form"%>
<%--<%@ taglib prefix="sec" 	uri="http://www.springframework.org/security/tags" %>--%>
<%@ taglib prefix="resume" 	tagdir="/WEB-INF/tags"%>

<resume:edit-tab-header selected="practices"/>

<div class="container-sm ">
		<h3 class="data-header text-center">Personal experience</h3>
		<resume:form-display-error-if-invalid formName="practiceForm" />
		<form:form action="/edit/practices" method="post" commandName="practiceForm">
<%--			<sec:csrfInput/>--%>
			<div id="ui-block-container">
				<c:forEach var="practice" items="${practiceForm.items }" varStatus="status">
					<resume:edit-practice-block index="${status.index}" practice="${practice }" />
				</c:forEach>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<a href="javascript:resume.ui.addBlock();">Add</a>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 text-center">
					<input type="submit" class="btn btn-primary" value="Save">
				</div>
			</div>
		</form:form>
	</div>
</div>
<script id="ui-block-template" type="text/x-handlebars-template">
	<resume:edit-practice-block index="{{blockIndex}}" />
</script>