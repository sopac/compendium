<%--
  Created by IntelliJ IDEA.
  User: sachin
  Date: Jul 13, 2010
  Time: 9:08:23 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="compendium.data.Project" contentType="text/html;charset=UTF-8" %>
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
</div>
<div class="body">
  <h1>Browse Collections by Type</h1>


  <div class="list">
    <table>
      <thead>
      <tr>
        <g:sortableColumn property="title" title="Project Type"/>

        <g:sortableColumn property="title" title="Projects"/>

      </tr>
      </thead>

      <g:each in="${types}" status="i" var="t">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

          <td><g:link action="list" params="[type:t]">
            <g:if test="${t.trim().equals('')}">
              Uncategorised Type
            </g:if>
            <g:if test="${!t.trim().equals('')}">
              ${t}
            </g:if>

          </g:link></td>

          <td>${Project.findAllWhere(type: t).size()}</td>

        </tr>
      </g:each>
    </tbody>
    </table>
  </div>

</div>

</body>
</html>