<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<%@ taglib prefix="sec" 	uri="http://www.springframework.org/security/tags" %>--%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags" %>

<div class="col d-flex justify-content-center">
    <div class="card w-40 float-none ">
        <div class="card-header" style="background-color: #b6d4fe">
            Logging in to your personal account
        </div>
        <div class="card-body">
            <form action="/sign-in-handler" method="post">
                <%--			<sec:csrfInput/>--%>
                <c:if test="${sessionScope.SPRING_SECURITY_LAST_EXCEPTION != null}">
                    <div class="alert alert-danger" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                            ${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message }
                        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
                    </div>
                </c:if>
                <div class="help-block">You can use your UID or Email or Phone as your login</div>
                <br>
                <div class="form-group">
                    <label for="uid">Login</label> <input id="uid" name="uid" class="form-control"
                                                          placeholder="UID or Email or Phone" required autofocus>
                </div>
                <br>
                <div class="form-group">
                    <label for="password">Password</label> <input id="password" type="password" name="password"
                                                                  class="form-control" placeholder="Password" required>
                </div>
                <div class="form-group">
                    <label><input type="checkbox" name="remember-me" value="true"> Remember me</label>
                </div><br>

                <div class="form-group">
                    <button type="submit" class="btn btn-success">Login</button>
                    <div class="text-center">
                        <a href="/restore">Restore</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
