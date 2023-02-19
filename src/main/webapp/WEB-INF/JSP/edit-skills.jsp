<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: medovoy
  Date: 02.02.2023
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<select size="category" class="form-control">
    <c:forEach var="category" items="${skillCategories}">
        <option value="${category.id}">${category.category}</option>
    </c:forEach>
</select>

