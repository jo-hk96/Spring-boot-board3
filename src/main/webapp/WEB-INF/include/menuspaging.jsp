<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    

<!--  메뉴목록  -->

	<table  id="menu">
	  <tr>
	    <c:forEach  var="menu"  items="${menuList}">
	      <td>
	         <a href="/BoardPaging/Blist?nowpage=${nowpage}&menu_id=${menuDTO.menu_id}">
	           ${ menu.menu_name }
	         </a>
	      </td>
	    </c:forEach>
	  </tr>
	</table>