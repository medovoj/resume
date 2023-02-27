<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags" %>

<div class="container-sm">

    Please provide your personal information
    <hr>
    <div class="card-body">
        <resume:form-display-error-if-invalid formName="profileForm"/>
        <form:form action="/sign-up" commandName="profileForm" method="post">
            <sec:csrfInput/>
            <div class="help-block text-justify">
                Keep in mind that the first and last names you enter cannot be changed in the future! So please provide
                your real first and last name!
            </div><br>

            <resume:form-has-error path="firstName"/>
            <div class="form-group ${hasError ? 'has-error has-feedback' : ''}">
                <label for="firstName">Name</label>
                <form:input path="firstName" id="firstName" cssClass="form-control" placeholder="Example: Richard"
                            required="required"/>
                <resume:form-error path="firstName"/>
            </div>

            <resume:form-has-error path="lastName"/>
            <div class="form-group ${hasError ? 'has-error has-feedback' : ''}">
                <label for="lastName">Surname</label>
                <form:input path="lastName" id="lastName" cssClass="form-control" placeholder="Example: Hendricks"
                            required="required"/>
                <resume:form-error path="lastName"/>
            </div>

            <resume:form-has-error path="password"/>
            <div class="form-group ${hasError ? 'has-error has-feedback' : ''}">
                <label class="control-label" for="password">Password</label>
                <form:password path="password" id="password" cssClass="form-control" required="required"/>
                <resume:form-error path="password"/>
            </div>

            <resume:form-has-error path="confirmPassword"/>
            <div class="form-group ${hasError ? 'has-error has-feedback' : ''}">
                <label class="control-label" for="confirmPassword">Repeat Password</label>
                <form:password path="confirmPassword" id="confirmPassword" cssClass="form-control" required="required"/>
                <resume:form-error path="confirmPassword"/>
            </div><br>
            <button type="submit" class="btn btn-success">Registration</button>
        </form:form>
    </div>
</div>