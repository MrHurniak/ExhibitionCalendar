<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: andrii
  Date: 07.04.19
  Time: 19:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Calendar of exhibitions</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/paint-board-and-brush.png"
          sizes="96x96">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <fmt:setBundle var="link" basename="messages" scope="session"/>
    <jsp:include page="../../bootstrap.jsp"/>
</head>
<body>
<jsp:include page="../../header.jsp"/>
<div class="container-fluid">
    <div class="container">
        <div class="row  justify-content-center">
            <div class="col-xs-12 col-sm-8 p-2">
                <h3><fmt:message key="user.tickets.bought" bundle="${link}"/></h3>
                <c:forEach items="${requestScope['tickets']}" var="elem">
                    <div class="card my-1">
                        <div class="card-body">
                            <h5 class="card-title" style="text-align: left;"><a href="#"><c:out
                                    value="${elem.exposition.theme}"/></a></h5>
                            <p class="card-text"><c:out value="${elem.exposition.shortDescription}"/></p>
                            <p class="card-text"><fmt:message key="tickets.status" bundle="${link}"/>: <c:out
                                    value="${elem.exposition.expositionStatus}"/></p>
                            <p class="card-text"><fmt:message key="price.per.unit" bundle="${link}"/>: <c:out
                                    value="${elem.exposition.price}"/><fmt:message
                                    key="price.currency" bundle="${link}"/></p>
                            <p class="card-text"><fmt:message key="tickets.current.count" bundle="${link}"/>: <c:out
                                    value="${elem.count}"/></p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>
