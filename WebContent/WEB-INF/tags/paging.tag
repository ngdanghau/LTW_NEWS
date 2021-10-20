<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag import="org.springframework.util.StringUtils"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ attribute name="pagedListHolder" required="true"
	type="org.springframework.beans.support.PagedListHolder"%>
	
<%@ attribute name="pagedLink" required="true" type="java.lang.String"%>
<!-- <link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> -->
	
	
<!-- <div class="wi-pagination fox-pagination font-heading pagination-3">
	   <div class="pagination-inner">
	      <span aria-current="page" class="page-numbers current"><span>1</span></span>
	      <a class="page-numbers" href="/category/the-gioi?page=2"><span>2</span></a>
	      <a class="page-numbers" href="/category/the-gioi?page=3"><span>3</span></a>
	      <a class="next page-numbers" href="/category/the-gioi?page=2"><span>Tiến</span></a>
	      <a class="next page-numbers" href="/category/the-gioi?page=13"><span>Cuối</span></a>
	   </div>
	</div> -->	
	
<c:if test="${pagedListHolder.pageCount > 1}">
	<div class="wi-pagination fox-pagination font-heading pagination-3">
		<div class="pagination-inner">
		
		
		
		<!-- PREVIOUS - VI TRI KHONG PHAI TRANG DAU TIEN-->
		<c:if test="${!pagedListHolder.firstPage}">
			<a class="next page-numbers" href="<%=StringUtils.replace(pagedLink, "~", String.valueOf(pagedListHolder.getPage() - 1))%>"><span>Previous</span></a>
		</c:if>
		
		<!-- TRANG HIEN TAI -->
		<%-- <span aria-current="page" class="page-numbers current"><span>${ pagedListHolder.page + 1}</span></span> --%>
		
		<!-- TRANG DAU TIEN -->
		<%-- <c:if test="${pagedListHolder.firstLinkedPage > 0}">
			<a class="page-numbers current" href="<%=StringUtils.replace(pagedLink, "~", "0")%>"><span>1</span></a></li>
		</c:if> --%>
		
		
		 <c:if test="${pagedListHolder.firstLinkedPage > 1}">
			<a class="page-numbers"><span>...</span></a>
		</c:if>
		
		
		<c:forEach begin="${pagedListHolder.firstLinkedPage}" end="${pagedListHolder.lastLinkedPage}" var="i">
			<c:choose>
				<c:when test="${pagedListHolder.page == i}">
					<a class="page-numbers current" href="<%=StringUtils.replace(pagedLink, "~", String.valueOf( pagedListHolder.getPage() + 1 ))%>">${i+1}</a></li>
				</c:when>
				
				 <c:otherwise>
					<a class="page-numbers" href="<%=StringUtils.replace(pagedLink, "~", String.valueOf( pagedListHolder.getPage() + 2))%>">${i+1}</a>
				</c:otherwise>
				
			</c:choose>
		</c:forEach>
		
		<!-- PAGE IN THE MIDDLE - PREVIOUS ... 4 5 6 .. NEXT -->
		<c:if test="${pagedListHolder.lastLinkedPage < pagedListHolder.pageCount - 2}">
			<a class="page-numbers"><span class="pagingDots">...</span></a>
		</c:if>
		
		<!-- LAST PAGE -->
		<c:if test="${pagedListHolder.lastLinkedPage < pagedListHolder.pageCount - 1}">
			<a class="page-numbers" href="<%=StringUtils.replace(pagedLink, "~", String.valueOf(pagedListHolder.getPageCount() - 1))%>">${pagedListHolder.pageCount}</a></li>
		</c:if>
		
		<!-- NEXT - VI TRI HIEN TAI KHONG PHAI CUOI CUNG-->
		<c:if test="${!pagedListHolder.lastPage}">
			<a class="next page-numbers" href="<%=StringUtils.replace(pagedLink, "~", String.valueOf(pagedListHolder.getPage() + 1))%>">Next</a></li>
		</c:if>
		
		</div>
	</div>
</c:if>