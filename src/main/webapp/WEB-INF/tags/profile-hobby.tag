<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<div class="card">
    <div class="card-header" style="background-color: #b6d4fe">
        Hobbies <a class="float-end" href="/edit/hobbies">Edit</a>
    </div>
    <div class="card-body">
        <ul class="list-group list-group-flush">
            <c:forEach var="hobby" items="${hobbies}">
            <li class="list-group-item float-start">${hobby.name}</li>
            </c:forEach>
        </ul>
    </div>
</div>