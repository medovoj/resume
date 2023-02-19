<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>

<%@ attribute name="selected" required="true" type="java.lang.String" %>


<ul class="nav justify-content-center">

    <li class="nav-item" role="presentation" ${selected == 'profile'     ? 'class="active"' : ''}>
        <a class="nav-link" aria-current="page" href="/edit">Profile</a>
    </li>
    <li class="nav-item" role="presentation" ${selected == 'contacts'     ? 'class="active"' : ''}>
        <a class="nav-link" aria-current="page" href="/edit/contacts">Contacts</a>
    </li>
    <li class="nav-item" role="presentation" ${selected == 'skills'     ? 'class="active"' : ''}>
        <a class="nav-link" aria-current="page" href="/edit/skills">Skills</a>
    </li>
    <li class="nav-item" role="presentation" ${selected == 'practices'     ? 'class="active"' : ''}>
        <a class="nav-link" aria-current="page" href="/edit/practices">Practice</a>
    </li>
    <li class="nav-item" role="presentation" ${selected == 'certificates'     ? 'class="active"' : ''}>
        <a class="nav-link" aria-current="page" href="/edit/certificates">Certificates</a>
    </li>
    <li class="nav-item" role="presentation" ${selected == 'courses'     ? 'class="active"' : ''}>
        <a class="nav-link" aria-current="page" href="/edit/courses">Courses</a>
    </li>
    <li class="nav-item" role="presentation" ${selected == 'education'     ? 'class="active"' : ''}>
        <a class="nav-link" aria-current="page" href="/edit/education">Education</a>
    </li>
    <li class="nav-item" role="presentation" ${selected == 'languages'     ? 'class="active"' : ''}>
        <a class="nav-link" aria-current="page" href="/edit/languages">Languages</a>
    </li>
    <li class="nav-item" role="presentation" ${selected == 'hobbies'     ? 'class="active"' : ''}>
        <a class="nav-link" aria-current="page" href="/edit/hobbies">Hobby</a>
    </li>
    <li class="nav-item" role="presentation" ${selected == 'info'     ? 'class="active"' : ''}>
        <a class="nav-link" aria-current="page" href="/edit/info">Info</a>
    </li>


</ul>