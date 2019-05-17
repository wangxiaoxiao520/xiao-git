<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新闻修改页面</title>
    <script src="${pageContext.request.contextPath}/statics/jquery.min.js"></script>

    <style>
        .container {
            width: 280px;
            margin: 0px auto;
        }

        table {
            width: 100%;
        }
    </style>
</head>
<body>

<div class="container">
    <form id="myform" action="${pageContext.request.contextPath}/index/saveUpdate" method="post">
        <table border="1">
            <tr>
                <td colspan="2" align="center" style="background-color:#F5F2F9;"><h1>更新新闻内容</h1></td>
            </tr>
            <tr>
                <td>新闻编号</td>
                <td>
                    <input type="text" name="detail.id" value="${detail.id}" readonly="readonly"/>
                </td>
            </tr>
            <tr>
                <td>新闻分类</td>
                <td>
                    <select id="category" name="detail.categoryId" >
                        <option value="0">全部</option>
                        <c:forEach items="${categoryList}" var="sorts">
                            <c:choose>
                                <c:when test="${detail.categoryId == sorts.id}">
                                    <option value="${sorts.id}" selected>${sorts.name}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${sorts.id}">${sorts.name}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </td>
            </tr>

            <tr>
                <td>新闻标题(*)</td>
                <td>
                    <input type="text" name="detail.title" id="title" value="${detail.title}" onblur="validateTitle()"/>
                    <span class="tip" style="color:red;"></span>
                </td>
            </tr>
            <tr>
                <td>新闻摘要</td>
                <td>
                    <input type="text" name="detail.summary" value="${detail.summary}"/>
                </td>
            </tr>
            <tr>
                <td>作者</td>
                <td>
                    <input type="text" name="detail.author" value="${detail.author}"/>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <input type="submit" value="提交"/>
                    <input type="button" value="返回"
                           onclick="javascript:location.href='${pageContext.request.contextPath}/index/list'"/>
                </td>
            </tr>
        </table>
    </form>
</div>
<script>

    $(function () {
        var isExist = false;
        $("#myform").submit(function () {  //表单提交函数, isNaN表示非数字。 isFinite判断是否是整数，true表示整数
            if ($("#title").val() == "") {
                alert("新闻标题不能为空");
                return false;
            }
            if (isExist == true) {
                return false;
            }
            return true;  //表单就会被提交。
        });
    });

    function validateTitle() {
       var title = $("#title").val();
       $.ajax({
           url : "/news/validateTitle?title=" + title,
           success : function (data) {
               if (data == "false") {
                   $(".tip").text("新闻标题已存在，请重新输入！");
                   $("#title").focus();
                   isExist = true;
               } else {
                   isExist = false;
               }
           }
       });
    }

</script>
</body>
</html>