<%@ page import="compendium.data.Project" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>
<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
    <span class="menuButton"><g:link class="list" action="list">Collection List</g:link></span>
</div>
<div class="body">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${projectInstance}">
        <div class="errors">
            <g:renderErrors bean="${projectInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form action="save" method="post">
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="title"><g:message code="project.title.label" default="Title"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'title', 'errors')}">
                        <g:textField style="width:340px" name="title" value="${projectInstance?.title}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="year"><g:message code="project.year.label" default="Project Year"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'projectYear', 'errors')}">
                        <g:textField name="projectYear" value="${projectInstance?.projectYear}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="year"><g:message code="project.category1.label" default="Primary Category"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'category1', 'errors')}">
                        %{--<g:textField name="category1" value="${projectInstance?.category1}"/>--}%

                        <g:select id="category1" name="category1" value="${projectInstance?.category1}" noSelection="${['Uncategorised (UC)':'Uncategorised (UC)']}"
                                from="${Project.executeQuery('select distinct p.category1 from Project as p Order By p.category1')}"></g:select>

                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="year"><i><g:message code="project.category2.label" default="Secondary Category"/></i></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'category2', 'errors')}">
                        %{--<g:textField name="category2" value="${projectInstance?.category2}"/>--}%
                        <g:select id="category2" name="category2" value="${projectInstance?.category2}" noSelection="${['':'']}"
                                from="${Project.executeQuery('select distinct p.category1 from Project as p Order By p.category1')}"></g:select>

                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="type"><g:message code="project.type.label" default="Type"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'type', 'errors')}">
                        <g:select name="type" from="${projectInstance.constraints.type.inList}" value="${projectInstance?.type}" valueMessagePrefix="project.type"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="session"><g:message code="project.session.label" default="Session"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'session', 'errors')}">
                        <g:textField name="session" value="${projectInstance?.session}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="description"><g:message code="project.description.label" default="Description"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'description', 'errors')}">
                        <g:textArea name="description" cols="40" rows="5" value="${projectInstance?.description}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="proposedYear"><g:message code="project.proposedYear.label" default="Proposed Year"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'proposedYear', 'errors')}">
                        <g:textField name="proposedYear" value="${projectInstance?.proposedYear}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="startDate"><g:message code="project.startDate.label" default="Start Date"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'startDate', 'errors')}">
                        <g:textField name="startDate" value="${projectInstance?.startDate}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="endDate"><g:message code="project.endDate.label" default="End Date"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'endDate', 'errors')}">
                        <g:textField name="endDate" value="${projectInstance?.endDate}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="scope"><g:message code="project.scope.label" default="Scope"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'scope', 'errors')}">
                        <g:select name="scope" from="${projectInstance.constraints.scope.inList}" value="${projectInstance?.scope}" valueMessagePrefix="project.scope"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="partnerOrganisation"><g:message code="project.partnerOrganisation.label" default="Partner Organisation"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'partnerOrganisation', 'errors')}">
                        <g:textField name="partnerOrganisation" value="${projectInstance?.partnerOrganisation}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="partnerAssistance"><g:message code="project.partnerAssistance.label" default="Partner Assistance"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'partnerAssistance', 'errors')}">
                        <g:textField name="partnerAssistance" value="${projectInstance?.partnerAssistance}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="output"><g:message code="project.output.label" default="Project Output"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'projectOutput', 'errors')}">
                        <g:textArea name="projectOutput" cols="40" rows="5" value="${projectInstance?.projectOutput}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="keywords"><g:message code="project.keywords.label" default="Keywords"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'keywords', 'errors')}">
                        <g:textField name="keywords" value="${projectInstance?.keywords}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="contactDetails"><g:message code="project.contactDetails.label" default="Contact Details"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'contactDetails', 'errors')}">
                        <g:textArea name="contactDetails" cols="40" rows="5" value="${projectInstance?.contactDetails}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="reference"><g:message code="project.reference.label" default="Reference"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'reference', 'errors')}">
                        <g:textArea name="reference" cols="40" rows="5" value="${projectInstance?.reference}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="comments"><g:message code="project.comments.label" default="Comments"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'comments', 'errors')}">
                        <g:textArea name="comments" cols="40" rows="5" value="${projectInstance?.comments}"/>
                    </td>
                </tr>

                </tbody>
            </table>
        </div>
        <div class="buttons">
            <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
        </div>
    </g:form>
</div>
</body>
</html>
