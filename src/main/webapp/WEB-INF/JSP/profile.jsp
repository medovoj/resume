<%--
  Created by IntelliJ IDEA.
  User: medovoy
  Date: 26.01.2023
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="resume" tagdir="/WEB-INF/tags" %>

<div class="container text-center">
    <div class="row">
        <div class="col-lg-4 col-sm-6">
            <resume:profile-main/>
            <br>
            <resume:profile-language/>
            <br>
            <resume:profile-hobby/>
            <br>
            <resume:profile-info/>
            <br>
        </div>

        <div class="col-lg-8 col-sm-6">
            <resume:profile-objective/>
            <br>
            <resume:profile-skills/>
            <br>
            <resume:profile-practice/>
            <br>
            <resume:profile-certificates/>
            <br>
            <resume:profile-courses/>
            <br>
            <resume:profile-education/>
            <br>
        </div>
    </div>
</div>

