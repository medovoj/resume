<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>



<div class="card">
    <div class="card-header" style="background-color: #b6d4fe">
        Certificates <a class="float-end" href="/edit/certificates">Edit</a>
    </div>
    <div class="card-body">
        <blockquote class="blockquote mb-0">
            <c:forEach var="certificate" items="${certificates }">
                <img src="${certificate.smallUrl}" class="img-fluid rounded" alt="..." href="${certificate.largeUrl}">
            </c:forEach>
        </blockquote>
    </div>
</div>