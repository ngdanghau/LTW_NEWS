<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tg" tagdir="/WEB-INF/tags" %>

<!doctype html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
      <title>Dashboard - ${ SettingsData.getSite_name() }</title>
      <meta name="description" content="${ SettingsData.getSite_description() }">
      <meta name="author" content="pixelcave">
      <meta name="robots" content="noindex, nofollow">
      <meta property="og:site_name" content="${ SettingsData.getSite_name() }">
      <meta property="og:type" content="website">
      <meta property="og:title" content="${ SettingsData.getSite_name() } - ${ SettingsData.getSite_slogan() }" />
      <meta property="og:url" content="${HOMEURL}" />
      <meta property="og:description" content="${ SettingsData.getSite_description() }" />
      <base href="${APPURL }/"/>
      <link rel="shortcut icon" href="./public/admin/media/favicons/favicon.png">
      <link rel="icon" type="image/png" sizes="192x192" href="./public/admin/media/favicons/favicon-192x192.png">
      <link rel="apple-touch-icon" sizes="180x180" href="./public/admin/media/favicons/apple-touch-icon-180x180.png">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap">
      <link rel="stylesheet" id="css-main" href="./public/admin/css/oneui.min.css">
      <link rel="stylesheet" href="./public/admin/js/plugins/sweetalert2/sweetalert2.min.css">
            
   </head>
   <body>
   	  <!-- ADMIN CATEGORY  -->
   
      <div id="page-container" class="sidebar-o sidebar-dark enable-page-overlay side-scroll page-header-fixed main-content-narrow">
      <!-- SIDEBAR FRAGMENT -->
      <jsp:include page="./fragments/sidebar.fragment.jsp"/>
      <!-- HEADER FRAGMENT -->
      <jsp:include page="./fragments/header.fragment.jsp"/>
      <main id="main-container">
         <div class="content">
            <div class="col-xl-12">
               <div class="block block-rounded">
                  <div class="block-header block-header-default">
                     <h3 class="block-title">Thể loại</h3>
                     <div class="block-options">
                        <div class="block-options-item">
                           <code>.category</code>
                        </div>
                     </div>
                  </div>
                  <div class="block-content">
                     <table class="table table-hover table-vcenter">
                        <thead>
                           <tr>
                              <th class="text-center" style="width: 50px;">#</th>
                              <th>Description</th>
                              <th class="d-none d-sm-table-cell" style="width: 15%;">Name</th>
                              <th class="text-center" style="width: 100px;">Actions</th>
                           </tr>
                        </thead>
                        
                        
                        
                        <tbody>
                        	<!-- PAGINATION - HIEN THI BAI VIET NHUNG CO PHAN TRANG -->
			            	<jsp:useBean id="pagedListHolder" scope="request" type="org.springframework.beans.support.PagedListHolder"/>
							<c:url value="/admin/category.htm" var="pagedLink">
								<c:param name="p" value="~" />
							</c:url>
                                                		
                        	<c:forEach var="element" items="${ pagedListHolder.pageList }" varStatus="status" begin="1"> 
                        		<tr data-uid="${ element.id }">
	                              <th class="text-center" scope="row"> ${ status.index } </th>
	                              <td class="fw-semibold fs-sm">
	                                 <a href="be_pages_generic_profile.html">${ element.description }</a>
	                              </td>
	                              <td class="d-none d-sm-table-cell">
	                                 <span class="fs-xs fw-semibold d-inline-block py-1 px-3 rounded-pill bg-success-light text-success">${ element.name }</span>
	                              </td>
	                              <td class="text-center">
	                                 <div class="btn-group">
		                                 <a href="${APPURL }/admin/edit-category-${element.id}.htm" class="btn-edit-category btn btn-sm btn-alt-secondary" data-bs-toggle="tooltip" title="Edit">
		                                 	<i  class="fa fa-fw fa-pencil-alt"></i> 
		                                 </a>
		                                 
		                                 <a data-uid="${ element.id }" class="btn-remove-category btn btn-sm btn-alt-secondary" data-bs-toggle="tooltip" title="Remove"> 
		                                   	<i  class="fa fa-fw fa-times"></i>
	                                     </a>
	                                 </div>
	                              </td>
	                           </tr>
                        	</c:forEach>
                        	
                        	
                        </tbody>
                        	
                        	
                     </table>
                     
                     <!-- PAGINGATION -->
			         <tg:paging_admin pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}" />
                  </div>
               </div>
            </div>
         </div>
      </main>
      	<!-- FOOTER FRAGMENT -->
      	<jsp:include page="./fragments/footer.fragment.jsp"/>
      
		</div>
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
		<script src="./public/admin/js/oneui.app.min.js"></script>
		<script src="./public/admin/js/plugins/sweetalert2/sweetalert2.min.js"></script>
		<script src="./public/admin/js/pages/category.js"></script>
		
  </body>
</html>