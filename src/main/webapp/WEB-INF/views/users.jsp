<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Users Page</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }

        .text {
            font-family: Palatino Linotype, Book Antiqua, Palatino, serif;
        }

        textC {
            font-family: Century Gothic;
        }

        txtxt {
            font-family: Century Gothic;
        }

        .c-text {
            font-family: Century Gothic;
        }

        .textc {
            font-family: Century Gothic;
        }
    </style>
</head>
<br/>
<body class="text">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td width="70"><a href="../../index.jsp" class="c-text"><img
                src="http://s019.radikal.ru/i631/1604/62/4d64edc2dca8.png" width="61" height="61"></a></td>
        <td width="250" align="left" valign="middle">
            <div align="center"><strong><span class="c-text">Add a User</span></strong></div>
        </td>
        <td width="250" align="left" valign="middle">
            <div align="center"><strong><span class="c-text">Search</span></strong></div>
        </td>
        <td align="center" valign="middle">
            <div align="center"><strong><span class="c-text">User List</span></strong></div>
        </td>
    </tr>
    <tr>
        <td width="70">&nbsp;</td>
        <td width="250" align="left" valign="top"><c:url var="addAction" value="/users/add"/>

            <form:form action="${addAction}" commandName="user">
                <div align="center">
                    <table align="left">
                        <c:if test="${!empty user.name}">
                            <tr>
                                <td width="30%" class="textc">
                                    <form:label path="id">
                                        <spring:message text="ID"/>
                                    </form:label>
                                </td>
                                <td align="center" valign="middle" class="textc">
                                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                                    <form:hidden path="id"/>
                                </td>
                            </tr>
                        </c:if>
                        <tr>
                            <td width="30%" class="textc">
                                <form:label path="name">
                                    <spring:message text="Name"/>
                                </form:label>
                            </td>
                            <td align="center" valign="middle" class="textc">
                                <form:input path="name"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="30%" class="textc">
                                <form:label path="age">
                                    <spring:message text="Age"/>
                                </form:label>
                            </td>
                            <td align="center" valign="middle" class="textc">
                                <form:input path="age"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="30%" class="textc">
                                <form:label path="isAdmin">
                                    <spring:message text="Admin"/>
                                </form:label>
                            </td>
                            <td align="center" class="textc">
                                <input:checkbox path="isAdmin" value="true" label=" yes"/>
                                    <%--<form:checkboxes items="${user.isAdmin}" path="isAdmin"/>--%>
                            </td>
                        </tr>
                        <tr>
                            <td width="30%" align="center" valign="bottom">
                            </td>
                            <td align="center" valign="bottom"><c:if test="${!empty user.name}">
                                <input type="submit" value="<spring:message text="Edit User"/>"/>
                            </c:if>
                                <c:if test="${empty user.name}">
                                    <input type="submit" value="<spring:message text="Add User"/>"/>
                                </c:if></td>
                        </tr>
                    </table>
                </div>
            </form:form></td>
        <td width="250" align="left" valign="top">

            <form action="search">
                <div class="row">
                    <div class="textc">
                        <div class="textc"><label for="name"></label>
                            <input type="text" name="name" id="name"></div>
                    </div>
                    <div class="textc"><input class="btn btn-success" type='submit' value='Search'/></div>
                </div>
            </form>
        </td>
        <td align="center" valign="top">
            <table align="center" class="tg">
                <tr>
                    <th width="74" align="center" valign="middle">
                        <div align="center"><strong><span class="c-text">ID</span></strong></div>
                    </th>
                    <th width="172" align="center" valign="middle">
                        <div align="center"><strong><span class="c-text">Name</span></strong></div>
                    </th>
                    <th width="67" align="center" valign="middle">
                        <div align="center"><strong><span class="c-text">Edit</span></strong></div>
                    </th>
                    <th width="87" align="center" valign="middle">
                        <div align="center"><strong><span class="c-text">Delete</span></strong></div>
                    </th>
                </tr>
                <c:forEach items="${listUsers}" var="user">
                    <tr>
                        <td align="center" valign="middle">
                            <div align="center"><span class="c-text">${user.id}</span></div>
                        </td>
                        <td align="center" valign="middle">
                            <div align="center"><span class="c-text"><a href="/userdata/${user.id}"
                                                                        target="_parent">${user.name}</a></span></div>
                        </td>
                        <td align="center" valign="middle">
                            <div align="center"><span class="c-text"><a
                                    href="<c:url value='/edit/${user.id}'/>">Edit</a></span></div>
                        </td>
                        <td align="center" valign="middle">
                            <div align="center"><span class="c-text"><a href="<c:url value='/remove/${user.id}'/>">Delete</a></span>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <table width="50%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr><br/>
                    <br/>
                    <%--<c:if test="${!empty listUsers}">--%>
                    <%--</c:if>--%>
                    <td>
                        <div align="center"><span class="c-text"><a href="<c:url value='/firstPage'/>"> First page </a></span>
                        </div>
                    </td>
                    <td>
                        <div align="center"><span class="c-text"><a href="<c:url value='/prev'/>"> Prev </a></span>
                        </div>
                    </td>
                    <td>
                        <div align="center"><span class="c-text"><a href="<c:url value='/next'/>"> Next </a></span>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td width="70">&nbsp;</td>
        <td width="500" colspan="2" align="left" valign="top"><img
                src="http://s013.radikal.ru/i322/1604/37/3a73ada63cfc.jpg" width="500" height="157" align="absbottom">
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
<h1 align="center" class="c-text">&nbsp;</h1>


<div align="center">
    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr align="center">
            <td width="20%" align="left" valign="middle"><a href="../../index.jsp" class="c-text"></a></td>
            <td width="60%" align="center" valign="middle"><p>&nbsp;</p></td>
            <td width="20%" align="right" valign="middle">&nbsp;</td>
        </tr>
    </table>
</div>


<h1 align="center" class="tg">&nbsp;</h1>


</body>
</html>

