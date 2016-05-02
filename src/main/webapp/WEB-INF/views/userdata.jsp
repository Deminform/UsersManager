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
        <td height="15%" colspan="3" align="center" valign="top"><div align="center"><img src="http://s017.radikal.ru/i440/1604/b9/0942a8ad4d74.jpg" width="658" height="125" align="top"></div></td>
    </tr>
    <tr>
        <td height="10" colspan="3"><div align="center"><strong>User Details</strong></div></td>
    </tr>
    <tr>
        <td width="20%" height="70%" align="left" valign="middle"><a href="/users"><img src="http://s019.radikal.ru/i631/1604/62/4d64edc2dca8.png" width="61" height="61" longdesc="../users" align="left"></a></td>
        <td width="60%" height="70%" align="center" valign="middle"><table align="center" class="tg">
            <tr>
                <th width="80" align="center" valign="middle">ID</th>
                <th width="120" align="center" valign="middle">Name</th>
                <th width="120" align="center" valign="middle">Is Admin</th>
                <th width="120" align="center" valign="middle">Age</th>
                <th width="120" align="center" valign="middle">Created date</th>
            </tr>
            <tr>
                <td align="center" valign="middle">${user.id}</td>
                <td align="center" valign="middle">${user.name}</td>
                <td align="center" valign="middle">${user.isAdmin.toString()}</td>
                <td align="center" valign="middle">${user.age}</td>
                <td align="center" valign="middle">${user.createdDate}</td>
            </tr>
        </table></td>
        <td width="20%" height="70%" align="right" valign="middle">&nbsp;</td>
    </tr>
    <tr>
        <td height="30%" colspan="3" align="center" valign="bottom"><img src="http://s019.radikal.ru/i640/1604/f3/db4ef9798304.jpg" width="658" height="223" align="middle"></td>
    </tr>
</table>
<p>&nbsp;</p>
</body>
</html>