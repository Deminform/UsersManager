<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
    <title>UserData</title>

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

        #textC {
            font-family: Century Gothic;
        }

        .textC {
            font-family: Century Gothic;
        }
    </style>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<table width="90%" height="545" border="0" align="center" cellpadding="0" cellspacing="0" class="textC">
    <tr>
        <td colspan="3" align="center" valign="top">
            <div align="center"><strong>User Details</strong></div>
        </td>
    </tr>
    <tr>
        <td width="20%" height="70%" align="left" valign="middle"><a href="/users"><img
                src="http://s019.radikal.ru/i631/1604/62/4d64edc2dca8.png" width="61" height="61" longdesc="../users"
                align="left"></a></td>
        <td width="60%" height="70%" align="center" valign="middle">
            <c:if test="${!empty searchpage}">
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
                    <c:forEach items="${searchpage}" var="user">
                        <tr>
                            <td align="center" valign="middle">
                                <div align="center"><span class="c-text">${user.id}</span></div>
                            </td>
                            <td align="center" valign="middle">
                                <div align="center"><span class="c-text"><a href="/userdata/${user.id}"
                                                                            target="_parent">${user.name}</a></span>
                                </div>
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
            </c:if>
            <c:if test="${empty searchpage}">

            </c:if></td>
        <td width="20%" height="70%" align="right" valign="middle">&nbsp;</td>
    </tr>
    <tr>
        <td height="30%" colspan="3" align="center" valign="bottom">&nbsp;</td>
    </tr>
</table>
<p>&nbsp;</p>
</body>
</html>