<%@ page import="compendium.data.Project" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}"/>
  <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton"><g:link class="create" action="create">New Collection</g:link></span>
</div>
<div class="body">
  <h1>Collections Listing</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="list">
    <table>
      <thead>
      <tr>

        <g:sortableColumn property="title" title="${message(code: 'project.title.label', default: 'Title')}"/>

        <g:sortableColumn property="projectYear" title="${message(code: 'project.year.label', default: 'Year')}"/>

        <g:sortableColumn property="category1" title="${message(code: 'project.category1.label', default: 'Category')}"/>

        <g:sortableColumn property="type" title="${message(code: 'project.type.label', default: 'Type')}"/>

        <g:sortableColumn property="session" title="${message(code: 'project.session.label', default: 'Session')}"/>

        <g:sortableColumn property="description" title="${message(code: 'project.description.label', default: 'Description')}"/>

      </tr>
      </thead>
      <tbody>
      <g:each in="${projectInstanceList}" status="i" var="projectInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td><g:link action="show" id="${projectInstance.id}">${fieldValue(bean: projectInstance, field: "title")}</g:link></td>

          <td>${fieldValue(bean: projectInstance, field: "projectYear")}</td>

          <td>${fieldValue(bean: projectInstance, field: "category1")}</td>

          <td>${fieldValue(bean: projectInstance, field: "type")}</td>

          <td>${fieldValue(bean: projectInstance, field: "session")}</td>

          <td>${fieldValue(bean: projectInstance, field: "description")}</td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
  <div class="paginateButtons">
    <g:paginate total="${projectInstanceTotal}"/>
  </div>
</div>
</body>
</html>
