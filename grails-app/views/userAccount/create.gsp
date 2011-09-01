

<%@ page import="compendium.data.UserAccount" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'userAccount.label', default: 'UserAccount')}" />
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
            <g:hasErrors bean="${userAccountInstance}">
            <div class="errors">
                <g:renderErrors bean="${userAccountInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="realName"><g:message code="userAccount.realName.label" default="Real Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userAccountInstance, field: 'realName', 'errors')}">
                                    <g:textField name="realName" value="${userAccountInstance?.realName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="userName"><g:message code="userAccount.userName.label" default="User Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userAccountInstance, field: 'userName', 'errors')}">
                                    <g:textField name="userName" value="${userAccountInstance?.userName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="userAccount.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userAccountInstance, field: 'password', 'errors')}">
                                    <g:passwordField name="password" value="${userAccountInstance?.password}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="administrator"><g:message code="userAccount.administrator.label" default="Administrator" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userAccountInstance, field: 'administrator', 'errors')}">
                                    <g:checkBox name="administrator" value="${userAccountInstance?.administrator}" />
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
