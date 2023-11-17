<%--
  Created by IntelliJ IDEA.
  User: ngcha
  Date: 16/11/2023
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dictionary</title>
</head>
<body>

<h1>Từ điển nè!</h1>
<form action="/trans" method="post">
    <input type="text" name="word" value="${word}">
    <button type="submit">OK</button>
</form>
<h2> result : ${rs} </h2>
</body>
</html>
