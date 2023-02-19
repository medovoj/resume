<%--
  Created by IntelliJ IDEA.
  User: medovoy
  Date: 26.01.2023
  Time: 13:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <jsp:include page="../section/css.jsp"/>
</head>
<body class="resume">
<jsp:include page="../section/header.jsp"/>
<jsp:include page="../section/nav.jsp"/>
<section class="main">
    <sitemesh:write property='body'/>
</section>
<jsp:include page="../section/footer.jsp"/>
<jsp:include page="../section/js.jsp"/>

</body>

</html>
