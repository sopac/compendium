<%@ page import="compendium.data.Country" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}"/>
  <title>Projects by Country</title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></span>
</div>
<div class="body">
  <h1>Browse Collections by Country</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="list">
    <table>
      <thead>
      <tr>

        <g:sortableColumn property="name" title="${message(code: 'country.name.label', default: 'Name')}"/>

        <g:sortableColumn property="code" title="${message(code: 'country.code.label', default: 'Code')}"/>

        <g:sortableColumn property="membership" title="${message(code: 'country.membership.label', default: 'Membership')}"/>

        <g:sortableColumn property="membership" title="${message(code: 'country.membership.label', default: 'Projects')}"/>

      </tr>
      </thead>
      <tbody>
      <g:each in="${countryInstanceList}" status="i" var="countryInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td><g:link action="show" id="${countryInstance.id}">${fieldValue(bean: countryInstance, field: "name")}</g:link></td>

          <td>${fieldValue(bean: countryInstance, field: "code")}</td>

          <td>${fieldValue(bean: countryInstance, field: "membership")}</td>

          <td><i>${countryInstance.projects.size()}</i></td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
  <div class="paginateButtons">
    <g:paginate total="${countryInstanceTotal}"/>
  </div>
</div>
</body>
</html>
