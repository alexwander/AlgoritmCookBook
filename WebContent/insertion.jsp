<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:import url="header.jsp">
	<c:param name="title" value="AlgorithmCookBook - View image"></c:param>
</c:import>

<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/picturesquirrel" user="root"
	password="sasasa1122" />



<sql:query dataSource="${ds}" var="results">
select from images where id=1;
<sql:param>${param.image}</sql:param>
</sql:query>

<c:set scope="page" var="image"
	value="${result.rows[0]}"></c:set>

<c:set scope="page" var="imgname"
	value="${image.stem}.${image.image_extension}"></c:set>


<img width="360"
	src="${pageContext.request.contextPath}/pics/${imgname}" />
	
	
	
	<div id="discussion">
		<h2>Algorithm</h2>
		<div class="algorithm_wrapper">
			
<!--
<pre>
<i># move min to front, as sentinel</i>
k = 1
for i = 2:n, if a[i] &lt; a[k], k = i
swap a[1,k]
<i class="invariant">&rarr; invariant: a[1] &lt;= a[2..n]</i>

<i># insertion sort with sentinel</i>
for i = 2:n,
    for (k = i; a[k] &lt; a[k-1]; k--) swap a[k,k-1]
    <i class="invariant">&rarr; invariant: a[1..i] is sorted</i>
end
</pre>
-->
<pre class="notranslate">
for i = 2:n,
    for (k = i; k > 1 and a[k] &lt; a[k-1]; k--) 
        swap a[k,k-1]
    <i class="invariant">&rarr; invariant: a[1..i] is sorted</i>
end
</pre>

		</div>
		<h2>Properties</h2>
		
<ul>
	<li> Stable </li>
	<li> O(1) extra space </li>
	<li> O(n<sup>2</sup>) comparisons and swaps </li>
	<li> Adaptive: O(n) time when nearly sorted </li>
	<li> Very low overhead </li>
</ul>

		<h2>Discussion</h2>
		
<p>
	Although it is one of the elementary sorting algorithms with
	O(n<sup>2</sup>) worst-case time, insertion sort is the
	algorithm of choice either when the data is nearly sorted
	(because it is adaptive) or when the problem size is small
	(because it has low overhead).
</p>
<p>
	For these reasons, and because
	it is also stable, insertion sort is often used as the recursive base
	case (when the problem size is small) for higher overhead
	divide-and-conquer sorting algorithms, such as 
	merge sort or quick sort.
</p>

	</div>
	
		<h2>Directions</h2>
<ul>
	<li>
		Click on <img src="/static/img/reload-24x24.gif" alt="" /> above to restart 
		the animations in a row, a column, or the entire table.
	</li>
	<li>
		Click directly on an animation image to start or restart it.
	</li>
	<li>
		Click on a problem size number to reset all animations.
	</li>
</ul>

		<h2>Key</h2>
		<ul>
		
			<li> Black values are sorted. </li>
			<li> Gray values are unsorted. </li>
			<li> A red triangle marks the algorithm position. </li>
		
		</ul>
	


<c:import url="footer.jsp"></c:import>
