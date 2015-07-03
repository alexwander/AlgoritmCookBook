<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:import url="header.jsp">
<c:param name="title" value="AlgorithmCookBook"></c:param>
</c:import>

<sql:setDataSource var="ds"  driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/picturesquirrel"
     user="root"  password="sasasa1122" />



<sql:query dataSource="${ds}" var="results">
select * from images order by id;
</sql:query>

<table class="images">

<c:set var="tablewidth" value="3" />

<c:forEach var="image" items="${results.rows}" varStatus="row">

	<c:if test="${row.index % tablewidth == 0}">
	<tr>
	
	</c:if>

	<c:set scope="page" var="imgname" value="${image.stem}.${image.image_extension}"></c:set>

	<td>
		<a href="<c:url value="/gallery?action=image&image=${image.id}" />">
			<img width="360" src="${pageContext.request.contextPath}/pics/${imgname}" />
		</a>
	</td>
	
	<c:if test="${row.index + 1 % tablewidth == 0}">
	</tr>
	</c:if>

</c:forEach>

</table>

<c:import url="footer.jsp"></c:import>
