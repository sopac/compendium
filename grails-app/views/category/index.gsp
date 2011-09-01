<%@ page import="compendium.data.Project; compendium.data.ImportController; compendium.data.Country" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}"/>
  <title>Collections by Category</title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
</div>
<div class="body">
  <h1>Collections by Category</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="list">
    <table>
      <thead>
      <tr>

        <g:sortableColumn property="name" title="Category"/>

        <g:sortableColumn property="name" title="Code"/>

        <g:sortableColumn property="name" title="Projects"/>

      </tr>
      </thead>
      <tbody>
      <g:each in="${ImportController.getCategoryMap().keySet()}" status="i" var="map1">

        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <g:if test="${!map1.trim().equals('')}">

            <td><g:link action="list" params="[category:ImportController.getCategoryMap().get(map1) + ' (' + map1 + ')']">${ImportController.getCategoryMap().get(map1)}</g:link></td>

            <td>${map1}</td>

            <td>${Project.findAllWhere(category1: ImportController.getCategoryMap().get(map1) + ' (' + map1 + ')').size()}</td>
            
          </g:if>

        </tr>
      </g:each>
      </tbody>
    </table>
  </div>

</div>
</body>
</html>
