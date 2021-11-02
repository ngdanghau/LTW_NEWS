<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="format" uri="http://java.sun.com/jstl/fmt_rt" %>
<!doctype html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
      <title>Bình luận - ${ SettingsData.getSite_name() }</title>
      <meta name="description" content="${ SettingsData.getSite_description() }">
      <meta name="author" content="pixelcave">
      <meta name="robots" content="noindex, nofollow">
      <meta property="og:site_name" content="${ SettingsData.getSite_name() }">
      <meta property="og:type" content="website">
      <meta property="og:title" content="${ SettingsData.getSite_name() } - ${ SettingsData.getSite_slogan() }" />
      <meta property="og:url" content="${HOMEURL}" />
      <meta property="og:description" content="${ SettingsData.getSite_description() }" />
      <base href="${APPURL }/"/>
      <link rel="icon" href="${ SettingsData.getLogomark() != '' ? SettingsData.getLogomark() : './public/images/favicon.ico' }" type="image/x-icon">
      <link rel="shortcut icon" href="${ SettingsData.getLogomark() != '' ? SettingsData.getLogomark() : './public/images/favicon.ico' }" type="image/x-icon">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap">
      <link rel="stylesheet" id="css-main" href="./public/admin/css/oneui.min.css">
      <link rel="stylesheet" href="./public/admin/js/plugins/sweetalert2/sweetalert2.min.css">
      
      <style>
	      	.btn-option{
	      		display:none;
	      	}
	      	.commentcontent:hover .btn-option{
	      		display:block;
	      		transition-duration: 5s;  
	      	}
	      	
	      	center {
			    margin: auto;
			    width: 60%;
			    padding: 20px;
			    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			}
			
			.hideform {
			    display: none;
			}
      </style>
   </head>
   <body>
      <div id="page-container" class="sidebar-o sidebar-dark enable-page-overlay side-scroll page-header-fixed main-content-narrow remember-theme">
         <!-- SIDEBAR FRAGMENT -->
         <jsp:include page="./fragments/sidebar.fragment.jsp"/>
         <!-- HEADER FRAGMENT -->
         <jsp:include page="./fragments/header.fragment.jsp"/>
         <main id="main-container">
            <div class="bg-body-light">
               <div class="content content-full">
                  <div class="d-flex flex-column flex-sm-row justify-content-sm-between align-items-sm-center py-2">
                     <div class="flex-grow-1">
                        <h1 class="h3 fw-bold mb-0">
                           Bình luận
                        </h1>
                     </div>
                  </div>
               </div>
            </div>
            <div class="content">
               <!-- IN RA TRANG THAI VA SO LUONG BINH LUAN THUOC TRANG THAI DO -->
               <div class="sub mb-3 fs-sm">
               	<c:if test="${ commentStatusNow == 'all' }">
               		<a class=" link-fx text-primary-darker" href="${ ADMINURL }/comment.htm">
                              <strong>Tổng số (<span id="quantityTotalComment">${ totalComment }</span>)|</strong>
               	</c:if>
               	<c:if test="${ commentStatusNow != 'all' }">
               		<a class=" link-fx" href="${ ADMINURL }/comment.htm?commentStatus=all">
                              Tổng số(<span id="quantityTotalComment">${ totalComment }</span>)
                    </a>
               	</c:if>
               	 
               
                  <!-- CHAP NHAN -->
                  <c:forEach items="${listStatus}" var="element">
                     <c:if test="${ element[0] == 'approved' }">
                        <c:choose>
                           <c:when test="${ commentStatusNow == 'approved' }">
                              <a class=" link-fx text-primary-darker" href="${ ADMINURL }">
                              <strong>Chấp nhận (<span id="quantityApprovedComment"> ${ element[1] } </span>)</strong>
                              </a>
                           </c:when>
                           <c:otherwise>
                              <a class=" link-fx" href="${ ADMINURL }/comment.htm?commentStatus=approved">
                              Chấp nhận (<span id="quantityApprovedComment"> ${ element[1] } </span>)
                              </a>
                           </c:otherwise>
                        </c:choose>
                        |
                     </c:if>
                  </c:forEach>
                  <!-- CHO DUYET -->
                  <c:forEach items="${listStatus}" var="element">
                     <c:if test="${ element[0] == 'pending' }">
                        <c:choose>
                           <c:when test="${ commentStatusNow == 'pending' }">
                              <a class=" link-fx text-primary-darker" href="${ ADMINURL }/comment.htm?commentStatus=pending">
                              <strong>Chờ duyệt (<span id="quantityPendingComment">  ${ element[1] } </span>)</strong>
                              </a>
                           </c:when>
                           <c:otherwise>
                              <a class=" link-fx" href="${ ADMINURL }/comment.htm?commentStatus=pending">
                              Chờ duyệt (<span id="quantityPendingComment">  ${ element[1] } </span>)
                              </a>
                           </c:otherwise>
                        </c:choose>
                        |
                     </c:if>
                  </c:forEach>
                  <!-- THUNG RAC -->
                  <c:forEach items="${listStatus}" var="element">
                     <c:if test="${ element[0] == 'trash' }">
                        <c:choose>
                           <c:when test="${ commentStatusNow == 'trash' }">
                              <a class=" link-fx text-primary-darker" href="${ ADMINURL }/comment.htm?commentStatus=trash">
                              <strong>Thùng rác (<span id="quantityTrashComment"> ${ element[1] } </span>)</strong>
                              </a>
                           </c:when>
                           <c:otherwise>
                              <a class=" link-fx" href="${ ADMINURL }/comment.htm?commentStatus=trash">
                              Thùng rác (<span id="quantityTrashComment"> ${ element[1] } </span>)
                              </a>
                           </c:otherwise>
                        </c:choose>
                     </c:if>
                  </c:forEach>
               </div>
               <div class="block block-rounded">
                  <div class="block-header block-header-default">
                     <div class="row">
                        <div class="col-sm-6">
                           <div class="form-group">
                              <select class="form-control form-control-sm" id="action" name="action" style="width: 120px">
                                 <option value="-1">Chọn hành động</option>
                                 <c:choose>
                                    <c:when test="${ param.post_status == 'trash' }">
                                       <option value="restore">Khôi phục</option>
                                       <option value="delete">Xóa vĩnh viễn</option>
                                    </c:when>
                                    <c:otherwise>
                                       <option value="trash">Cho vào rác</option>
                                    </c:otherwise>
                                 </c:choose>
                              </select>
                           </div>
                        </div>
                        <div class="col-sm-6">
                           <button class="btn btn-sm btn-primary btn-action" data-url="${ADMINURL }/post_bulk.htm" >Thực hiện</button>
                        </div>
                     </div>
                     <!-- <div class="block-options">
                        <button type="button" class=" btn-sm btn-alt-secondary" data-toggle="class-toggle" data-target="#one-search" data-class="d-none">
                        	<i class="fa fa-search"></i>
                        </button>
                     </div> -->
                     <div class="block-options">
                     	<div class="input-group">
							  <div class="form-outline">
							    <input type="search" id="keyword" class="form-control" />
							    <label class="form-label" for="form1">Search</label>
							  </div>
							  <button type="button" class="btn-search-comment btn btn-primary">
							    <i class="fas fa-search"></i>
							  </button>
						</div>
					</div>
                  </div>
                  <%-- <div id="one-search" class="block-content border-bottom d-none">
                     <form action="${ADMINURL }/comment.htm" method="GET">
                        <div class="push">
                           <div class="input-group">
                              <input type="text" class="form-control form-control-alt" id="keyword" name="keyword" placeholder="Tìm bài viết">
                              <button class="btn-search input-group-text bg-body border-0">
                              		<i class="fa fa-search"></i>
                              </button>
                           </div>
                        </div>
                     </form>
                  </div> --%>
                  <div class="block-content">
                     <table class="table table-bordered table-striped table-vcenter">
                        <thead>
                           <tr>
                              <!-- <th class="text-center" style="width: 100px;">
                                 <i class="far fa-user"></i>
                              </th> -->
                              <th style="width: 100px;">Tác giả</th>
                              <th style="width: 20%">Nội dung</th>
                              <th style="width: 40%;">Bài viết</th>
                              <th style="width: 15%;">Ngày</th>
                              <th class="text-center" style="width: 100px;">Trạng thái</th>
                           </tr>
                        </thead>
                        <tbody id="commentBody">
                        
                           <!-- PAGINATION - HIEN THI BAI VIET NHUNG CO PHAN TRANG -->
                           <jsp:useBean id="pagedListHolder" scope="request" type="org.springframework.beans.support.PagedListHolder"/>
                           <c:url value="/admin/comment.htm" var="pagedLink">
                              <c:param name="p" value="~" />
                           </c:url>
                           <c:forEach items="${pagedListHolder.pageList }" var="element">
                              <tr data-uid="${element.id }">
                                <!--  <td class="text-center">
                                    <img class="img-avatar img-avatar48" src="element." alt="">
                                 </td> -->
                                 <td class="fw-semibold fs-sm">
                                    <a href="${ADMINURL }/comment.htm?commentAuthor=${element.comment_author}">${ element.comment_author }</a>
                                 </td>
                                 
                                 <td class="fw-semibold fs-sm">
                                 	<div class="commentcontent">
                                 		${ element.comment_content } 
                                 		</br>
                                    	<div class="btn-group" data-uid="${ element.id }">
                                    		<!-- IN RA CAC NUT HANH DONG TUY THEO TRANG THAI COMMENT -->
                                    		<c:if test="${ element.comment_status == 'pending' }">
                                    			<button type="button" data-uid=${ element.id } class="btn-option btn-approve-comment btn btn-sm btn-alt-secondary" data-bs-toggle="tooltip">
		                                       		Chấp thuận
		                                       </button>
		                                       
		                                       <button type="button" data-uid=${ element.id } class="btn-option btn-trash-comment btn-trash-comment btn btn-sm btn-alt-secondary" data-bs-toggle="tooltip">
	                                       			Thùng rác
	                                       	   </button>
                                    		</c:if>
                                    		
                                    		<c:if test="${ element.comment_status == 'approved' }">
                                    			<button type="button" data-uid=${ element.id } class="btn-option btn-response-comment btn btn-sm btn-alt-secondary" data-bs-toggle="tooltip">
		                                       		Phản hồi
		                                       </button>
		                                       
		                                       <button type="button" data-uid=${ element.id } class="btn-option btn-trash-comment btn btn-sm btn-alt-secondary" data-bs-toggle="tooltip">
	                                       			Thùng rác
	                                       		</button>
                                    		</c:if>
	                                       
	                                       <c:if test="${ element.comment_status == 'trash'}">
	                                       		<button type="button" data-uid=${ element.id } class="btn-option btn-restore-comment btn btn-sm btn-alt-secondary" data-bs-toggle="tooltip" >
		                                       		Phục hồi
		                                       </button>
	                                       
		                                       	<button type="button" data-uid=${ element.id } class="btn-option btn-remove-comment btn btn-sm btn-alt-secondary" data-bs-toggle="tooltip" title="">
		                                       		Xoá
		                                       </button>
	                                       </c:if>
	                                       
	                                       
	                                    </div>
                                    </div>
                                    
                                 </td>
                                
                                 <td class="fs-sm"><a href="${APPURL }/article/${element.post.id }/${element.post.post_slug}.htm">${ element.post.title }</a></em></td>
                                 <td>
									<format:formatDate value="${element.comment_date }" pattern="dd-MM-yyyy hh:mm aa" />
                                 </td>
                                 <td class="text-center" data-uid="${ element.id }">
                                    <c:if test="${ element.comment_status == 'approved' }">
	                              		<span class="fs-xs fw-semibold d-inline-block py-1 px-3 rounded-pill bg-success-light text-success">${ element.comment_status }</span>
	                              	</c:if>
	                                 <c:if test="${ element.comment_status == 'pending' }">
	                              		<span class="fs-xs fw-semibold d-inline-block py-1 px-3 rounded-pill bg-info-light text-info">${ element.comment_status }</span>
	                              	</c:if>
	                              	<c:if test="${ element.comment_status == 'trash' }">
	                              		<span class="fs-xs fw-semibold d-inline-block py-1 px-3 rounded-pill bg-danger-light text-danger">${ element.comment_status }</span>
	                              	</c:if>
	                              	
                                 </td>
                                 <!-- form phan hoi binh luan - moi the <tr> deu co 1 form nhu nay -->
                                 <div class="center hideform col-xs-4" data-uid="${ element.id }">
								    <button class="btn-close-response" style="float: right;">X</button>
								    
								    <form action="${URL }/admin/response-comment-${element.id}.htm" method="POST">
								    	
								    	<div class="form-group">
										    <label for="exampleInputEmail1">Bài viết</label>
										   	<input class="form-control" type="text" placeholder="${ element.post.title }" readonly>
										</div>
										<br/>
										<a class="col-sm-1 btn btn-warning btn-sm" href="${APPURL }/article/${element.post.id }/${element.post.post_slug}.htm" target="_blank">Truy cập</a>
								    	<br/>
								    	<br/>
								    	<div class="form-group">
										    <label for="exampleInputEmail1">Người dùng</label>
										   	<input class="form-control" type="text" placeholder="${ element.comment_author }" readonly>
										</div>
								    	<br/>
								    	
								        <div class="form-group">
										    <label for="exampleInputEmail1">Bình luận</label>
										   	<input class="form-control" type="text" placeholder="${ element.comment_content }" readonly>
										</div>
								       <br/>
								       
								       <div class="form-group">
										    <label for="exampleInputEmail1">Bình luận của bạn</label>
										   	<textarea id="content" class="form-control" name="content" rows="10" cols="40">abc</textarea>
									   </div>
								        <br/>
								        
									  <div class="text-center">
									    	<input type="button" data-uid="${ element.id }" class="btn-confirm-response-comment btn btn-primary" value="Lưu lại">
									    	<input type="button" class="btn-cancel-response-comment btn- btn btn-danger" value="Hủy bỏ">
									  </div>
									 
								    </form>
								</div>
                              </tr>
	                          
                           </c:forEach>
                           
                        </tbody>
                        
                     </table>
                     <tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}" />
                  </div>
               </div>
            </div>
         </main>
         <c:remove var="successMessage" scope="session" />
         <c:remove var="errorMessage" scope="session" />
         <!-- FOOTER FRAGMENT -->
         <jsp:include page="./fragments/footer.fragment.jsp"/>
      </div>
      	<script src="./public/admin/js/lib/jquery.min.js"></script>
		<script src="./public/admin/js/oneui.app.min.js"></script>
		<script src="./public/admin/js/plugins/sweetalert2/sweetalert2.min.js"></script>
		<script src="./public/admin/js/pages/comment.js"></script>
	     
	    <script src="./public/vendor/ckeditor/ckeditor.js"></script>
		<script src="./public/vendor/ckfinder/ckfinder.js"></script>
		<script>
			$( document ).ready(function() {
			    // khoi tao ckeditor va ckfinder
				var editor = CKEDITOR.replace('content');
				editor.config.height = '500px';
				CKFinder.setupCKEditor( editor, '${APPURL}/public/vendor/ckfinder/' );
				
				
				TimesWriter.Thumbnail();
				TimesWriter.SlugUrl();
			    
				
			});
		</script>
   </body>
</html>