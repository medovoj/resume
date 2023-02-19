<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<div class="card">
    <div class="card-header" style="background-color: #b6d4fe">
        Practice <a class="float-end" href="/edit/practice">Edit</a>
    </div>

    <div class="card-body">
        <blockquote class="blockquote mb-0">
            <div class="timeline p-4 block mb-4">

            <c:forEach var="practice" items="${practices}">

                <div class="tl-item">
                    <div class="tl-dot b-primary"></div>
                    <div class="tl-content">
                        <div class="">${practice.company}</div>
                        <div class="">${practice.position}</div>
                        <div class="">${practice.responsibilities}</div>
                        <div class="tl-date text-muted mt-1">${practice.beginDate}</div>
                    </div>
                </div>
            </c:forEach>
            </div>
        </blockquote>
    </div>
</div>