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
    </style>
</head>
<br/>
<body class="text">
<h1 align="center" class="c-text">User List</h1>

<c:if test="${!empty listUsers}">
    <div align="center">
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr align="center">
                <td width="20%" align="left" valign="middle"><a href="../../index.jsp" class="c-text"><img src="http://s019.radikal.ru/i631/1604/62/4d64edc2dca8.png" width="61" height="61"></a></td>
                <td width="60%" align="center" valign="middle"><table align="center" class="tg">
                    <tr>
                        <th width="74" align="center" valign="middle"><div align="center"><strong><span class="c-text">ID</span></strong></div></th>
                        <th width="172" align="center" valign="middle"><div align="center"><strong><span class="c-text">Name</span></strong></div></th>
                        <th width="67" align="center" valign="middle"><div align="center"><strong><span class="c-text">Edit</span></strong></div></th>
                        <th width="87" align="center" valign="middle"><div align="center"><strong><span class="c-text">Delete</span></strong></div></th>
                    </tr>
                    <c:forEach items="${listUsers}" var="user">
                        <tr>
                            <td align="center" valign="middle"><div align="center"><span class="c-text">${user.id}</span></div></td>
                            <td align="center" valign="middle"><div align="center"><span class="c-text"><a href="/userdata/${user.id}" target="_parent">${user.name}</a></span></div></td>
                            <td align="center" valign="middle"><div align="center"><span class="c-text"><a href="<c:url value='/edit/${user.id}'/>">Edit</a></span></div></td>
                            <td align="center" valign="middle"><div align="center"><span class="c-text"><a href="<c:url value='/remove/${user.id}'/>">Delete</a></span></div></td>
                        </tr>
                    </c:forEach>
                </table>
                    <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <br/> <br/>
                            <td>
                                <div align="center"><span class="c-text"><a
                                        href="<c:url value='prev/'/>">Prev</a></span></div>
                            </td>
                            <td>
                                <div align="center"><span class="c-text"><a
                                        href="<c:url value='next/'/>">Next</a></span></div>
                            </td>
                        </tr>
                    </table>
                    <p>&nbsp;</p></td>
                <td width="20%" align="right" valign="middle">&nbsp;</td>
            </tr>
        </table>
    </div>
</c:if>


<h1 align="center" class="tg"><span class="c-text">Add a User</span></h1>

<c:url var="addAction" value="/users/add"/>

<form:form action="${addAction}" commandName="user">
    <div align="center"><table align="center">
        <c:if test="${!empty user.name}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="Name"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="age">
                    <spring:message text="Age"/>
                </form:label>
            </td>
            <td>
                <form:input path="age"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="isAdmin">
                    <spring:message text="Admin"/>
                </form:label>
            </td>
            <td>
                <input:checkbox path="isAdmin" value="true" label=" yes"/>
                    <%--<form:checkboxes items="${user.isAdmin}" path="isAdmin"/>--%>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty user.name}">
                    <input type="submit" value="<spring:message text="Edit User"/>"/>
                </c:if>
                <c:if test="${empty user.name}">
                    <input type="submit" value="<spring:message text="Add User"/>"/>
                </c:if></td>
        </tr>
    </table><img src="http://s013.radikal.ru/i322/1604/37/3a73ada63cfc.jpg" width="500" height="157" align="absbottom">    </div>
</form:form>


<%--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////--%>


<%--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////--%>

</body>
</html>

