<%@ page import="compendium.data.Project" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton"><g:link class="list" action="list">Collection List</g:link></span>
  <span class="menuButton"><g:link class="create" action="create">New Collection</g:link></span>
</div>
<div class="body">
  <h1>Show Collection</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="dialog">
    <table>
      <tbody>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="project.title.label" default="Title"/></td>

        <td valign="top" class="value"><b>${fieldValue(bean: projectInstance, field: "title")}</b></td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="project.year.label" default="Project Year"/></td>

        <td valign="top" class="value">${fieldValue(bean: projectInstance, field: "projectYear")}</td>

      </tr>

       <tr class="prop">
        <td valign="top" class="name"><g:message code="project.type.label" default="Primary Category"/></td>

        <td valign="top" class="value">${fieldValue(bean: projectInstance, field: "category1")}</td>

      </tr>

       <tr class="prop">
        <td valign="top" class="name"><i><g:message code="project.type.label" default="Secondary Category"/></i></td>

        <td valign="top" class="value">${fieldValue(bean: projectInstance, field: "category2")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="project.type.label" default="Type"/></td>

        <td valign="top" class="value">${fieldValue(bean: projectInstance, field: "type")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="project.session.label" default="Session"/></td>

        <td valign="top" class="value">${fieldValue(bean: projectInstance, field: "session")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="project.description.label" default="Description"/></td>

        <td valign="top" class="value">${fieldValue(bean: projectInstance, field: "description")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="project.proposedYear.label" default="Proposed Year"/></td>

        <td valign="top" class="value">${fieldValue(bean: projectInstance, field: "proposedYear")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="project.startDate.label" default="Start Date"/></td>

        <td valign="top" class="value">${fieldValue(bean: projectInstance, field: "startDate")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="project.endDate.label" default="End Date"/></td>

        <td valign="top" class="value">${fieldValue(bean: projectInstance, field: "endDate")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="project.scope.label" default="Scope"/></td>

        <td valign="top" class="value">${fieldValue(bean: projectInstance, field: "scope")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="project.partnerOrganisation.label" default="Partner Organisation"/></td>

        <td valign="top" class="value">${fieldValue(bean: projectInstance, field: "partnerOrganisation")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="project.partnerAssistance.label" default="Partner Assistance"/></td>

        <td valign="top" class="value">${fieldValue(bean: projectInstance, field: "partnerAssistance")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="project.output.label" default="Project Output"/></td>

        <td valign="top" class="value">${fieldValue(bean: projectInstance, field: "projectOutput")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="project.keywords.label" default="Keywords"/></td>

        <td valign="top" class="value">${fieldValue(bean: projectInstance, field: "keywords")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="project.contactDetails.label" default="Contact Details"/></td>

        <td valign="top" class="value">${fieldValue(bean: projectInstance, field: "contactDetails")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="project.reference.label" default="Reference"/></td>

        <td valign="top" class="value">${fieldValue(bean: projectInstance, field: "reference")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="project.comments.label" default="Comments"/></td>

        <td valign="top" class="value">${fieldValue(bean: projectInstance, field: "comments")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="project.links.label" default="Links"/></td>

        <td valign="top" style="text-align: left;" class="value">
          <ul>
            <g:each in="${projectInstance.links}" var="l">
              <li><g:link controller="link" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="project.countries.label" default="Countries"/></td>

        <td valign="top" style="text-align: left;" class="value">
          <ul>
            <g:each in="${projectInstance.countries}" var="c">
              <li><g:link controller="country" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
            </g:each>
          </ul>
        </td>

      </tr>

      </tbody>
    </table>
  </div>
  <div class="buttons">
    <g:form>
      <g:hiddenField name="id" value="${projectInstance?.id}"/>
      <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
      <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
    </g:form>
  </div>
</div>
</body>
</html>
