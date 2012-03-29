<%@ page import="compendium.data.Project" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <g:javascript library="jquery"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>

</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
    <span class="menuButton"><g:link class="list" action="list">Collection List</g:link></span>
    <span class="menuButton"><g:link class="create" action="create">New Collection</g:link></span>
</div>

<div class="body">
<h1><g:message code="default.edit.label" args="[entityName]"/></h1>
<g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${projectInstance}">
    <div class="errors">
        <g:renderErrors bean="${projectInstance}" as="list"/>
    </div>
</g:hasErrors>
<g:form method="post">
<g:hiddenField name="id" value="${projectInstance?.id}"/>
<g:hiddenField name="version" value="${projectInstance?.version}"/>
<div class="dialog">
<table>
<tbody>

<tr class="prop">
    <td valign="top" class="name">
        <label for="title"><g:message code="project.title.label" default="Title"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'title', 'errors')}">
        <g:textField name="title" style="width:340px" value="${projectInstance?.title}"/>
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
        <g:textField name="category1" value="${projectInstance?.category1}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="year"><i><g:message code="project.category2.label" default="Secondary Category"/></i>
        </label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'category2', 'errors')}">
        <g:textField name="category2" value="${projectInstance?.category2}"/>
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

<tr class="prop">
    <td valign="top" class="name">
        <label for="links"><g:message code="project.links.label" default="Links"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'links', 'errors')}">

        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'A'])}">A</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'B'])}">B</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'C'])}">C</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'D'])}">D</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'E'])}">E</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'E'])}">F</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'G'])}">G</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'H'])}">H</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'I'])}">I</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'J'])}">J</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'K'])}">K</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'L'])}">L</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'M'])}">M</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'N'])}">N</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'O'])}">O</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'P'])}">P</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'Q'])}">Q</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'R'])}">R</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'S'])}">S</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'T'])}">T</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'U'])}">U</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'V'])}">V</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'W'])}">W</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'X'])}">X</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'Y'])}">Y</a>
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [alpha: 'Z'])}">Z</a>
        |
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [type: 'Report'])}">Show Only Reports</a>
        |
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [type: 'Imagery'])}">Show Only Imageries</a>
        |
        <a href="${createLink(action: 'edit', id: projectInstance.id, params: [type: 'Document'])}">Show Only Documents</a>




        <br/>

        <g:select name="links" from="${links}" multiple="yes" optionKey="id" size="100" value="${projectInstance?.links*.id}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="countries"><g:message code="project.countries.label" default="Countries"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: projectInstance, field: 'countries', 'errors')}">
        <g:select name="countries" from="${compendium.data.Country.list()}" multiple="yes" optionKey="id" size="5" value="${projectInstance?.countries*.id}"/>
    </td>
</tr>

</tbody>
</table>
</div>

<div class="buttons">
    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
</div>
</g:form>
</div>
</body>
</html>
