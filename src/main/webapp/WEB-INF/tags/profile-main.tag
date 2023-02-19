<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>

<div class="card">
    <div class="card-body">
        <img src="${profile.largePhoto}" class="img-fluid rounded" alt="photo">
        <h1 class="text-center">
            <a style=" color: #1a1e21" href="/edit">${profile.fullName}</a>
        </h1>
        <h6 class="text-center">
            <strong>${profile.city}</strong>
        </h6>
        <h6 class="text-center">
            <strong>Age: </strong> ${profile.age}, <strong>Birthday: </strong> <fmt:formatDate value="${profile.birthDay }" type="date" dateStyle="medium"/>
        </h6>

        <ul class="list-group list-group-flush">

            <a href="tel: +380501770454" class="list-group-item list-group-item-action text-lg-start">
                <ion-icon name="call-outline"></ion-icon>
                ${profile.phone}</a>

            <a href="mailto: memm@gmail.com" class="list-group-item list-group-item-action text-lg-start">
                <ion-icon name="mail-outline"></ion-icon>
                ${profile.email}</a>

            <c:if test="${profile.contacts.skype != null }">
                <a href="javascript:void(0);" class="list-group-item list-group-item-action text-lg-start">
                    <ion-icon name="mail-outline" size="medium"></ion-icon>
                        ${profile.contacts.skype}</a>
            </c:if>

            <c:if test="${profile.contacts.github != null }">
            <a href="https://github.com" class="list-group-item list-group-item-action text-lg-start">
                <ion-icon name="logo-github"></ion-icon>
                </i>  ${profile.contacts.github}</a>
            </c:if>

            <c:if test="${profile.contacts.facebook != null }">
            <a href="https://facebook.com" class="list-group-item list-group-item-action text-lg-start">
                <ion-icon name="logo-facebook"></ion-icon>
                ${profile.contacts.facebook}</a>
            </c:if>

        </ul>

    </div>
</div>