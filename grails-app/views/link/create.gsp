

<%@ page import="compendium.data.Link" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'link.label', default: 'Link')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${linkInstance}">
            <div class="errors">
                <g:renderErrors bean="${linkInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title"><g:message code="link.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: linkInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${linkInstance?.title}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type"><g:message code="link.type.label" default="Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: linkInstance, field: 'type', 'errors')}">
                                    <g:select name="type" from="${linkInstance.constraints.type.inList}" value="${linkInstance?.type}" valueMessagePrefix="link.type"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="url"><g:message code="link.url.label" default="Url" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: linkInstance, field: 'url', 'errors')}">
                                    <g:textField name="url" value="${linkInstance?.url}" />
                                    <i><br/>
                                    For Virtual Library Reports enter ReportID eg: MA186  <br/>
                                    For Imagery, enter Geonerwork UUID eg: 81cc3832-fc1c-42e4-b235-23068d7e3b36 <br/>
                                    For Documents, enter filename eg: Contract-Vanuatu.pdf from <a target="_blank" href="http://ict.sopac.org/compendium-documents/">http://ict.sopac.org/compendium-documents/</a>
                                </i>
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
