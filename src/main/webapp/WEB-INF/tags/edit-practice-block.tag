<%@ tag pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" 	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" 	tagdir="/WEB-INF/tags"%>

<%@ attribute name="index"   required="true" type="java.lang.Object"%>
<%@ attribute name="practice" required="false" type="com.medovoy.resume.entity.Practice"%>

<div id="ui-item-${index }" class="card">
		<div class="row">
			<div class="col-xs-12">
				<button type="button" class="btn-close float-end" onclick="$('#ui-item-${index }').remove();">
				</button>
			</div>
		</div>
		<div class="row">
			<c:if test="${practice != null }"><resume:form-has-error path="items[${index }].position"/></c:if>
			<div class="col-xs-12 col-md-6 form-group ${hasError ? 'has-error has-feedback' : ''}">
				<label class="control-label" for="items${index }position">Position</label>
				<input class="form-control" name="items[${index }].position" id="items${index }position"
					   placeholder="Example: Java trainee" value="${practice.position }" required="required">
				<c:if test="${practice != null }">
					<resume:form-error path="items[${index }].position" />
				</c:if>
			</div>
			<c:if test="${practice != null }"><resume:form-has-error path="items[${index }].company"/></c:if>
			<div class="col-xs-12 col-md-6 form-group ${hasError ? 'has-error has-feedback' : ''}">
				<label class="control-label" for="items${index }company">Company</label>
				<input class="form-control" name="items[${index }].company" id="items${index }.company"
					   placeholder="Example: DevStudy.net" value="${practice.company }" required="required">
				<c:if test="${practice != null }">
					<resume:form-error path="items[${index }].company" />
				</c:if>
			</div>
			<div class="col-xs-12 col-md-6 form-group">
				<label class="control-label" for="items${index }beginDate">Start date</label>
				<div class="row">
					<div class="col-xs-6">
						<select name="items[${index }].beginDateMonth" class="form-control" >
							<c:forEach var="month" items="${months }">
								<option value="${month.key }" ${month.key == practice.beginDateMonth ? 'selected="selected"' : '' }>${month.value }</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-xs-6">
						<select name="items[${index }].beginDateYear" class="form-control" >
							<c:forEach var="year" items="${years }">
								<option value="${year }" ${year == practice.beginDateYear ? 'selected="selected"' : '' }>${year }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			<c:if test="${practice != null }"><resume:form-has-error path="items[${index }].endDate"/></c:if>
			<div class="col-xs-12 col-md-6 form-group ${hasError ? 'has-error has-feedback' : ''}">
				<label class="control-label" for="items${index }endDate">End date</label>
				<div class="row">
					<div class="col-xs-6">
						<select id="items${index }finishDateMonth" name="items[${index }].finishDateMonth" class="form-control" onchange="resume.ui.updateSelect($(this))" data-ref-select="items${index }finishDateYear">
							<option value="">Not finished yet</option>
							<c:forEach var="month" items="${months }">
								<option value="${month.key }" ${month.key == practice.finishDateMonth ? 'selected="selected"' : '' }>${month.value }</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-xs-6">
						<select id="items${index }finishDateYear" name="items[${index }].finishDateYear" class="form-control" onchange="resume.ui.updateSelect($(this))" data-ref-select="items${index }finishDateMonth">
							<option value="">Not finished yet</option>
							<c:forEach var="year" items="${years }">
								<option value="${year }" ${year == practice.finishDateYear ? 'selected="selected"' : '' }>${year }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<c:if test="${practice != null }">
					<resume:form-error path="items[${index }].endDate" displayIcon="false" />
				</c:if>
			</div>
			<c:if test="${practice != null }"><resume:form-has-error path="items[${index }].responsibilities"/></c:if>
			<div class="col-xs-12 col-md-12 ${hasError ? 'has-error has-feedback' : ''}">
				<label class="control-label" for="items${index }responsibilities">Responsibilities/Accomplishments</label>
				<textarea class="form-control" name="items[${index }].responsibilities" id="items${index }responsibilities" style="margin-bottom: 10px;"
						  required="required" rows="2">${practice.responsibilities }</textarea>
				<c:if test="${practice != null }">
					<resume:form-error path="items[${index }].responsibilities" />
				</c:if>
			</div>
			<c:if test="${practice != null }"><resume:form-has-error path="items[${index }].demo"/></c:if>
			<div class="col-xs-12 col-md-6 form-group ${hasError ? 'has-error has-feedback' : ''}">
				<label class="control-label" for="items${index }demo">Link</label>
				<input class="form-control" name="items[${index }].demo" id="items${index }demo"
					   placeholder="Example: http://demoproject.com" value="${practice.demo }" >
				<c:if test="${practice != null }">
					<resume:form-error path="items[${index }].demo" />
				</c:if>
			</div>
			<c:if test="${practice != null }"><resume:form-has-error path="items[${index }].src"/></c:if>
			<div class="col-xs-12 col-md-6 form-group ${hasError ? 'has-error has-feedback' : ''}">
				<label class="control-label" for="items[${index }].src">GitHub</label>
				<input class="form-control" name="items[${index }].src" id="items[${index }].src"
					   placeholder="Example: https://github.com/demo" value="${practice.src }" >
				<c:if test="${practice != null }">
					<resume:form-error path="items[${index }].src" />
				</c:if>
			</div>
		</div>
	</div>
