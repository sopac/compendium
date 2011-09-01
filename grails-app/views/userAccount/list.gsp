<%@ page import="compendium.data.UserAccount" %>
<html>
<head>

  <g:if test="${session.user == null}">
    <META http-equiv="refresh" content="0; URL='${createLink(controller: 'login', action: 'index')}'">
  </g:if>


  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'userAccount.label', default: 'UserAccount')}"/>
  <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></span>
</div>
<div class="body">
  <h1><g:message code="default.list.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="list">
    <table>
      <thead>
      <tr>

        <g:sortableColumn property="realName" title="${message(code: 'userAccount.realName.label', default: 'Real Name')}"/>

        <g:sortableColumn property="userName" title="${message(code: 'userAccount.userName.label', default: 'User Name')}"/>

        <g:sortableColumn property="administrator" title="${message(code: 'userAccount.administrator.label', default: 'Administrator')}"/>

      </tr>
      </thead>
      <tbody>
      <g:each in="${userAccountInstanceList}" status="i" var="userAccountInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td><g:link action="show" id="${userAccountInstance.id}">${fieldValue(bean: userAccountInstance, field: "realName")}</g:link></td>

          <td>${fieldValue(bean: userAccountInstance, field: "userName")}</td>


          <td><g:formatBoolean boolean="${userAccountInstance.administrator}"/></td>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
  <div class="paginateButtons">
    <g:paginate total="${userAccountInstanceTotal}"/>
  </div>
</div>
</body>
</html>
