<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="resume" tagdir="/WEB-INF/tags"%>

<div class="well">
  <p>Find <strong>${page.totalElements }</strong> profiles</p>
</div>

<jsp:include page="profiles.jsp" />