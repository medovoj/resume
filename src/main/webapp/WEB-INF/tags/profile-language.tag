<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>

<div class="card">
    <div class="card-header" style="background-color: #b6d4fe">
        Languages <a class="float-end" href="/edit/language">Edit</a>
    </div>
    <div class="card-body">
        <blockquote class="blockquote mb-0">
            <ul class="list-group list-group-flush">
                <c:forEach var="language" items="${languages }">
                    <li class="list-group-item float-start"><strong>${language.name }:</strong> ${language.level}, ${language.type}</li>
                </c:forEach>
            </ul>
        </blockquote>
    </div>
</div>