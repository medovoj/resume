<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c"      	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"     	uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form"   	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" 	uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="resume" 	tagdir="/WEB-INF/tags"%>

<resume:edit-tab-header selected="profile" />

<div class="container-md edit-profile">
		<h1 class="text-center">${profileForm.fullName }</h1>
		<c:if test="${!profileForm.completed }">
		<hr />
		<h4 class="data-header">The following fields must be filled out to complete your registration!</h4>
		</c:if>
		<resume:form-display-error-if-invalid formName="contactsForm" />
		<form:form commandName="profileForm" action="/edit?${_csrf.parameterName}=${_csrf.token}" method="post" >
			<form:hidden path="firstName"/>
			<form:hidden path="lastName"/>
			<form:hidden path="largePhoto"/>
			<form:hidden path="completed"/>
			
			<resume:form-has-error path="profilePhoto" />
			<div class="form-group ${hasError ? 'has-error' : ''}">
				<label for="inputPhoto" class="col-sm-2 control-label">Photo*</label>
				<div class="col-sm-5">
					<img id="currentPhoto" src="${profileForm.profilePhoto }" class="edit-photo" /><br /> 
					<input type="file" name="profilePhoto" id="profilePhoto" />
					<resume:form-error path="profilePhoto" />
				</div>
				<div class="col-sm-5 help-block">
					<blockquote>
						The size of the photo must be at least 400x400<br />
						The file must be in jpg format <br />
					</blockquote>
				</div>
			</div>
			<resume:form-has-error path="birthDay" />
			<div class="form-group ${hasError ? 'has-error' : ''}">
				<label for="inputBirthDay" class="col-sm-2 control-label">Birthday*</label>
				<div class="col-sm-5">
					<form:input path="birthDay" class="form-control datepicker" data-date-format="yyyy-mm-dd" id="inputBirthDay" placeholder="Example: 1990-12-31" required="required" />
					<resume:form-error path="birthDay" />
				</div>
				<div class="col-sm-5 help-block">
					<blockquote>Date format: yyyyy-mm-dd (four digits of the year - month code - birthday)</blockquote>
				</div>
			</div>
			<resume:form-has-error path="country" />
			<div class="form-group ${hasError ? 'has-error' : ''}">
				<label for="inputCountry" class="col-sm-2 control-label">Country*</label>
				<div class="col-sm-5">
					<form:input path="country" class="form-control" id="inputCountry" placeholder="Example: Ukraine" required="required" />
					<resume:form-error path="country" />
				</div>
				<div class="col-sm-5 help-block"></div>
			</div>
			<resume:form-has-error path="city" />
			<div class="form-group ${hasError ? 'has-error' : ''}">
				<label for="inputCity" class="col-sm-2 control-label">City*</label>
				<div class="col-sm-5">
					<form:input path="city" class="form-control" id="inputCity" placeholder="Example: Kharkiv" required="required" />
					<resume:form-error path="city" />
				</div>
				<div class="col-sm-5 help-block"></div>
			</div>
			<resume:form-has-error path="email" />
			<div class="form-group ${hasError ? 'has-error' : ''}">
				<label for="inputEmail" class="col-sm-2 control-label">Email*</label>
				<div class="col-sm-5">
					<form:input path="email" class="form-control" id="inputEmail" placeholder="Example: richard.hendricks@gmail.com" required="required" />
					<resume:form-error path="email" />
				</div>
				<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
				<div class="col-sm-5 help-block">
					<blockquote>
						Preferably, the email should contain your first and last name as stated in your passport. If this name is already taken, it can be abbreviated.<br />
					</blockquote>
				</div>
			</div>
			<resume:form-has-error path="phone" />
			<div class="form-group ${hasError ? 'has-error' : ''}">
				<label for="inputPhone" class="col-sm-2 control-label">Phone number*</label>
				<div class="col-sm-5">
					<form:input path="phone" class="form-control" id="inputPhone" placeholder="Example: +380501234567" required="required" />
					<resume:form-error path="phone" />
				</div>
				<div class="col-sm-5 help-block">
					<blockquote>
						The phone number must be in the format <a href="https://ru.wikipedia.org/wiki/E.164" target="_blank">E.164</a>, for example: +380501234567
					</blockquote>
				</div>
			</div>
			<resume:form-has-error path="objective" />
			<div class="form-group ${hasError ? 'has-error' : ''}">
				<label for="inputObjective" class="col-sm-2 control-label">Desired position*</label>
				<div class="col-sm-5">
					<form:input path="objective" class="form-control" id="inputObjective" placeholder="Example: Junior java developer position" required="required" />
					<resume:form-error path="objective" />
				</div>
				<div class="col-sm-5 help-block">
					<blockquote>
						In this section, you must specify the desired position, as briefly and clearly as possible
					</blockquote>
				</div>
			</div>
			<resume:form-has-error path="summary" />
			<div class="form-group ${hasError ? 'has-error' : ''}">
				<label for="inputSummary" class="col-sm-2 control-label">Your qualifications*</label>
				<div class="col-sm-5">
					<form:textarea path="summary" class="form-control" id="inputSummary" required="required" rows="7"
						placeholder="Example: Two Java professional courses with developing two web applications: blog and resume (Links to demo are provided)" />
					<resume:form-error path="summary" />
				</div>
				<div class="col-sm-5 help-block">
					<blockquote>
						In this section you should describe your experience (practical or theoretical) in the area in which you are looking for work.<br />
					</blockquote>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary">Save</button>
				</div>
			</div>
		</form:form>
	</div>

<content tag="js-init">
<script>
$(document).ready(function(){
	resume.createDatePicker();
	resume.createPhotoUploader();
});
</script>
</content>