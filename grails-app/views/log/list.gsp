<%@ page import="compendium.data.Project; compendium.data.Log" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'log.label', default: 'Log')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>

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

                <g:sortableColumn property="id" title="${message(code: 'log.id.label', default: 'Id')}"/>

                <g:sortableColumn property="name" title="${message(code: 'log.name.label', default: 'Name')}"/>

                <g:sortableColumn property="type" title="${message(code: 'log.type.label', default: 'Type')}"/>

                <g:sortableColumn property="project" title="${message(code: 'log.project.label', default: 'Project')}"/>

                <g:sortableColumn property="timeStamp" title="${message(code: 'log.timeStamp.label', default: 'Time Stamp')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${logInstanceList}" status="i" var="logInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td>${fieldValue(bean: logInstance, field: "id")}</td>

                    <td>${fieldValue(bean: logInstance, field: "name")}</td>

                    <td>${fieldValue(bean: logInstance, field: "type")}</td>


                    <g:if test="${!logInstance.project.equals('*')}">
                        <g:if test="${Project.get(logInstance.project.toLong()) != null}">
                            <g:set var="pdesc" value="${Project.get(logInstance.project.toLong()).title}"></g:set>
                            <td><a href="${createLink(controller: 'project', action: 'show', id: logInstance.project.toLong())}">${pdesc}</a>  (<b>${Project.get(logInstance.project.toLong()).session}</b>)
                            </td>
                        </g:if>
                    </g:if>
                    <g:else>
                        <td>*</td>
                    </g:else>

                    <td><g:formatDate date="${logInstance.timeStamp}"/></td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="paginateButtons">
        <g:paginate total="${logInstanceTotal}"/>
    </div>
</div>
</body>
</html>
