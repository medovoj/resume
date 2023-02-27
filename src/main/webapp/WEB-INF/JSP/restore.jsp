<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="col d-flex justify-content-center">
    <div class="card w-80 float-none ">
        <div class="card-header" style="background-color: #b6d4fe">
            Restore access
        </div><br>
        <div class="panel-body">
            <form action="/restore" method="post">
                <%--			<sec:csrfInput/>--%>
                <div class="form-group">
                    <label for="uid">Enter your UID or Email or Phone</label><br>
                    <input id="uid" name="uid" class="form-control" required="required"
                           placeholder="UID or Email or Phone">
                </div><br>
                <button type="submit" class="btn btn-primary">Restore</button>
            </form>
        </div>
    </div>
</div>