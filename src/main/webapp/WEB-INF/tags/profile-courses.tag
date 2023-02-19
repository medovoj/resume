<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<div class="card">
    <div class="card-header" style="background-color: #b6d4fe">
        Course <a class="float-end" href="/edit/course">Edit</a>
    </div>

    <div class="card-body">
        <blockquote class="blockquote mb-0">
            <div class="timeline p-4 block mb-4">

                <c:forEach var="course" items="${courses}">

                    <div class="tl-item">
                        <div class="tl-dot b-primary"></div>
                        <div class="tl-content">
                            <div class="">${course.school}</div>
                            <div class="">${course.name}</div>
                            <div class="tl-date text-muted mt-1">${course.endDate}</div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </blockquote>
    </div>
</div>