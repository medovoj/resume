<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="showEdit"  required="false" type="java.lang.Boolean" %>



<div class="card">
    <div class="card-header" style="background-color: #b6d4fe">
        Technical Skills
<%--        <c:if test="${showEdit }">--%>
            <a href="/edit/skills" class="edit-block float-end">Edit</a>
<%--        </c:if>--%>
    </div>
    <div class="card-body">
        <table class="table table-striped float-start">
            <thead>
            <tr>
                <th scope="col">Category</th>
                <th scope="col">Frameworks and Technologies</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="skill" items="${skills }">
                <tr>
                    <td>${skill.category } </td>
                    <td>${skill.value } </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>


