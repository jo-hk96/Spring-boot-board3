<%@page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var ="startnum" value = "${searchDTO.pagination.startPage}"/>
<c:set var ="endnum" value = "${searchDTO.pagination.endPage}"/>
<c:set var ="totalpageconut" value = "${searchDTO.pagination.totalPageCount}"/>

<div id = "paging">
	<table>
		<tr>
		
			<c:if test = "">
				<!-- 처음 이전 -->
				<td><a href = "/BoardPaging/Blist?nowpage=1&menu_id=MENU01">⏮</a></td>		
				<td><a href = "">⏪</a></td>		
			</c:if>	
				
				<c:forEach var = "pagenum" begin ="${startnum}" end = "${endnum}" step ="1">
					<td><a href = "/BoardPaging/Blist?nowpage=${pagenum}&menu_id=${menuDTO.menu_id}">${pagenum}</a></td>		
				</c:forEach>
			<!-- 다음 마지막 -->
			<td><a href = "">⏩</a></td>		
			<td><a href = "">⏭</a></td>		
		</tr>
	</table>
</div>



<%-- <div id = "paging">
	<table>
		<tr>
		<c:forEach var = "pagenum" begin ="#{startnum}" end = "${endnum}" step ="1">
			<td><a href = "">${pagenum}</a></td>		
		</c:forEach>
		</tr>
	</table>
</div> --%>