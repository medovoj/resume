<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="profile" items="${profiles }">
	<div class="card profile-item">
		<div class= "card-body ">
			<div class="media-left media-top">
				<a href="/${profile.uid }"><img alt="${profile.fullName }" src="${profile.smallPhoto }" class="photo rounded"></a>
				<a href="/${profile.uid }" class="btn btn-primary float-end" style="margin-top: 15px;">Details</a>
			</div>
			<div class="media-body search-result-item">
				<h4 class="media-heading">
					<a href="/${profile.uid }">${profile.fullName }, ${profile.age }</a>
				</h4>
				<strong>${profile.objective }</strong>
				<p>${profile.city }, ${profile.country }</p>
				<blockquote>
					<small>${profile.summary }</small>
				</blockquote>
			</div>
		</div>
	</div>
</c:forEach>