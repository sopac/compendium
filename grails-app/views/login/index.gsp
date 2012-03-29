<%--
  Created by IntelliJ IDEA.
  User: sachin
  Date: Sep 15, 2010
  Time: 12:23:09 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>SOPAC Compendium</title>
    <meta name="layout" content="main"/>
</head>

<body>

<div class="nav">
    %{--<span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>--}%
    <span class="menuButton" style="margin-left: 20px;"><b>Digital collection of the entire body of knowledge of SOPAC/CCOP from 1972 - 2010</b>
    </span>

</div>

<div id="pageBody">
    <h1></h1>

    <p></p>

    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>

    <div style="width: 300px; margin-left: 40px">
        <g:form action="doLogin" controller="login" method="post">
            <div class="dialog">
                <table style="width: 300px">
                    <tr class='prop'>
                        <td valign='top' style='text-align: left;' width='20%'><label
                                for='username'>Username:</label></td>
                        <td valign='top' style='text-align: left;' width='80%'><input
                                id="username" type='text' name='username'/></td>
                    </tr>
                    <tr class='prop'>
                        <td valign='top' style='text-align: left;' width='20%'><label
                                for='password'>Password:</label></td>
                        <td valign='top' style='text-align: left;' width='80%'><input
                                id="password" type='password' name='password'/></td>
                    </tr>
                </table>
            </div>
            <br/>

            <input style="font-weight: bolder;" type="submit" value="Login"/>

        </g:form>
    </div>
</div>

</body>
</html>


