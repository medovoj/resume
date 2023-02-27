<%--
  Created by IntelliJ IDEA.
  User: medovoy
  Date: 03.02.2023
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form"   	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" 	tagdir="/WEB-INF/tags"%>

<resume:edit-tab-header selected="info" />


<div class="container-sm">
        <h3 class="data-header text-center">Technical skills in frameworks and technologies</h3>
        <hr/>
        <div class="row" style="margin-bottom: 20px;">
            <div class="col-xs-5 col-sm-4 col-md-2 text-center"><strong>Category</strong></div>
            <div class="col-xs-7 col-sm-8 col-md-10 text-center"><strong>Framework and technologies</strong></div>
        </div>
        <form:form action="/edit/skills" method="post" commandName="skillForm">
            <div id="ui-block-container">
                <c:forEach var="skill" items="${skillForm.items }" varStatus="status">
                    <resume:edit-skill-block index="${status.index}" skill="${skill }" />
                </c:forEach>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <a href="javascript:resume.ui.addBlock();">Add skill</a>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-xs-12 text-center">
                    <input type="submit" class="btn btn-primary" value="Save">
                </div>
            </div>
        </form:form>
    </div>
</div>
<script id="ui-block-template" type="text/x-handlebars-template">
    <resume:edit-skill-block index="{{blockIndex}}" />
</script>
