<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/statics/jquery.min.js"></script>
    <c:if test="${empty categoryList}">
        <c:redirect url="/index/list"/>
    </c:if>
    <style>
        .container {
            width :700px;
            margin:0px auto;
            text-align:center;
        }
        form {
            width:500px;
        }
        table tr:nth-child(odd) {
            background: #F5F2F9;
        }
        .bb{
            background: #F5F2F9;
        }
        .kk {
            background-color: transparent;
        }
        h1{
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <form method="post" action="${pageContext.request.contextPath}/index/list" id="myform">
        新闻分类：
        <select id="category" name="categoryId" >
            <option value="">全部</option>
            <c:forEach items="${categoryList}" var="sorts">
                <option value="${sorts.id}"<c:if test="${sorts.id == categoryId}">selected</c:if> >${sorts.name}</option>
            </c:forEach>
        </select>
        &nbsp;&nbsp;&nbsp;&nbsp;
        新闻标题<input type="text" name="title" />
        <input type="submit" value="查询"/>
    </form>
    <table border="1" cellpadding="10" cellspacing="0">
        <tr class="kk" style="background-color:transparent;"><td colspan="7"><h1>新闻列表</h1></td></tr>
        <tr class="bb">
            <th>新闻编号</th>
            <th>新闻标题</th>
            <th>新闻概要</th>
            <th>作者</th>
            <th>创建时间</th>
            <th>新闻分类</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${detailList}" var="detail">
            <tr>
                <td>${detail.id}</td>
                <td>${detail.title}</td>
                <td>${detail.summary}</td>
                <td>${detail.author}</td>
                <td><fmt:formatDate value="${detail.createDate}" pattern="yyyy-MM-ddHH:mm:ss" /></td>
                <td>${detail.newsCategory.name}</td>
                <td><a href="${pageContext.request.contextPath}/index/toUpdate?id=${detail.id}">修改</a></td>
            </tr>
        </c:forEach>
    </table>
    ${msg}

</div>

</body>
</html>
