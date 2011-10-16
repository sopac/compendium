<%@ page import="compendium.data.Link" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'link.label', default: 'Link')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
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

               <g:sortableColumn property="title" title="${message(code: 'link.title.label', default: 'Title')}"/>

                <g:sortableColumn property="type" title="${message(code: 'link.type.label', default: 'Type')}"/>

                <g:sortableColumn property="url" title="${message(code: 'link.url.label', default: 'Url')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${linkInstanceList}" status="i" var="linkInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show" id="${linkInstance.id}">${fieldValue(bean: linkInstance, field: "title")}</g:link></td>

                    <td>${fieldValue(bean: linkInstance, field: "type")}</td>

                    <td>${fieldValue(bean: linkInstance, field: "url")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="paginateButtons">
        <g:paginate total="${linkInstanceTotal}"/>
    </div>
</div>
</body>
</html>
