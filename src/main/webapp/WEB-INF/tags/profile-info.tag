<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>




<c:if test="${profile.info != null }">
    <div class="card">
        <div class="card-header" style="background-color: #b6d4fe">
            Info <a class="float-end" href="/edit/info">Edit</a>
        </div>
        <div class="card-body">
            <blockquote class="blockquote mb-0">
                    ${profile.info}
            </blockquote>
        </div>
    </div>
</c:if>
