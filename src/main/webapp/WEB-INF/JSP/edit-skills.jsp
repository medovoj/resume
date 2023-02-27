<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<select size="category" class="form-control">
    <c:forEach var="category" items="${skillCategories}">
        <option value="${category.id}">${category.category}</option>
    </c:forEach>
</select>

