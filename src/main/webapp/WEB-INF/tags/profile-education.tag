<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<div class="card">
    <div class="card-header" style="background-color: #b6d4fe">
        Education <a class="float-end" href="/edit/education">Edit</a>
    </div>

    <div class="card-body">
        <blockquote class="blockquote mb-0">
            <div class="timeline p-4 block mb-4">

                <c:forEach var="education" items="${educations}">

                    <div class="tl-item">
                        <div class="tl-dot b-primary"></div>
                        <div class="tl-content">
                            <div class="">${education.university}</div>
                            <div class="">${education.faculty}</div>
                            <div class="">${education.summary}</div>
                            <div class="tl-date text-muted mt-1">${education.beginYear}</div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </blockquote>
    </div>
</div>
