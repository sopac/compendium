

<%@ page import="compendium.data.Log" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'log.label', default: 'Log')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${logInstance}">
            <div class="errors">
                <g:renderErrors bean="${logInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${logInstance?.id}" />
                <g:hiddenField name="version" value="${logInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="log.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: logInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${logInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="type"><g:message code="log.type.label" default="Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: logInstance, field: 'type', 'errors')}">
                                    <g:textField name="type" value="${logInstance?.type}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="project"><g:message code="log.project.label" default="Project" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: logInstance, field: 'project', 'errors')}">
                                    <g:textField name="project" value="${logInstance?.project}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="timeStamp"><g:message code="log.timeStamp.label" default="Time Stamp" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: logInstance, field: 'timeStamp', 'errors')}">
                                    <g:datePicker name="timeStamp" precision="day" value="${logInstance?.timeStamp}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
