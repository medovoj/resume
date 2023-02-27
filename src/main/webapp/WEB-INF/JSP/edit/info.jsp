<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c"      	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"     	uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form"   	uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="resume" 	tagdir="/WEB-INF/tags"%>

<resume:edit-tab-header selected="info" />

<div class="container-sm">
    <h3 class="text-center">Additional information</h3>
    <hr />
    <h4 class="data-header">A few words about yourself that will give you an advantage over other candidates </h4>
    <resume:form-display-error-if-invalid formName="infoForm"/>
    <form:form commandName="infoForm" action="/edit/info" method="post" cssClass="form-horizontal data-form">
      <resume:form-has-error path="info" />
      <div class="form-group row">
        <div class="col-sm-12">
          <form:textarea path="info" class="form-control" id="inputSummary" rows="7"
                         placeholder="Additional information may include civic activities, awards and recognitions, volunteering, or cultural skills like language or travel. It may also include other interests or activities that may show leadership, character, or qualities you feel are beneficial to your career." />
          <resume:form-error path="info" />
        </div>
      </div>
      <div class="form-group">
        <div class="row">
          <div class="col-xs-12 text-center"><br>
            <button type="submit" class="btn btn-primary">Save</button>
          </div>
        </div>
      </div>
    </form:form>
  </div>
</div>
