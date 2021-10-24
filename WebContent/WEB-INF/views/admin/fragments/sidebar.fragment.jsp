<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav id="sidebar" aria-label="Main Navigation">
   <div class="content-header">
      <a class="fw-semibold text-dual" href="index.html">
      <span class="smini-visible">
      <i class="fa fa-circle-notch text-primary"></i>
      </span>
      <span class="smini-hide fs-5 tracking-wider">${ SettingsData.getSite_name() }</span>
      </a>
      <div>
         <button type="button" class="btn btn-sm btn-alt-secondary" data-toggle="layout" data-action="dark_mode_toggle">
         <i class="far fa-moon"></i>
         </button>
         <div class="dropdown d-inline-block ms-1">
            <button type="button" class="btn btn-sm btn-alt-secondary" id="sidebar-themes-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="far fa-circle"></i>
            </button>
            <div class="dropdown-menu dropdown-menu-end fs-sm smini-hide border-0" aria-labelledby="sidebar-themes-dropdown">
               <a class="dropdown-item d-flex align-items-center justify-content-between fw-medium" data-toggle="theme" data-theme="default" href="#">
               <span>Default</span>
               <i class="fa fa-circle text-default"></i>
               </a>
               <a class="dropdown-item d-flex align-items-center justify-content-between fw-medium" data-toggle="theme" data-theme="./public/admin/css/themes/amethyst.min-5.1.css" href="#">
               <span>Amethyst</span>
               <i class="fa fa-circle text-amethyst"></i>
               </a>
               <a class="dropdown-item d-flex align-items-center justify-content-between fw-medium" data-toggle="theme" data-theme="./public/admin/css/themes/city.min-5.1.css" href="#">
               <span>City</span>
               <i class="fa fa-circle text-city"></i>
               </a>
               <a class="dropdown-item d-flex align-items-center justify-content-between fw-medium" data-toggle="theme" data-theme="./public/admin/css/themes/flat.min-5.1.css" href="#">
               <span>Flat</span>
               <i class="fa fa-circle text-flat"></i>
               </a>
               <a class="dropdown-item d-flex align-items-center justify-content-between fw-medium" data-toggle="theme" data-theme="./public/admin/css/themes/modern.min-5.1.css" href="#">
               <span>Modern</span>
               <i class="fa fa-circle text-modern"></i>
               </a>
               <a class="dropdown-item d-flex align-items-center justify-content-between fw-medium" data-toggle="theme" data-theme="./public/admin/css/themes/smooth.min-5.1.css" href="#">
               <span>Smooth</span>
               <i class="fa fa-circle text-smooth"></i>
               </a>
               <div class="dropdown-divider"></div>
               <a class="dropdown-item fw-medium" data-toggle="layout" data-action="sidebar_style_light" href="javascript:void(0)">
               <span>Sidebar Light</span>
               </a>
               <a class="dropdown-item fw-medium" data-toggle="layout" data-action="sidebar_style_dark" href="javascript:void(0)">
               <span>Sidebar Dark</span>
               </a>
               <div class="dropdown-divider"></div>
               <a class="dropdown-item fw-medium" data-toggle="layout" data-action="header_style_light" href="javascript:void(0)">
               <span>Header Light</span>
               </a>
               <a class="dropdown-item fw-medium" data-toggle="layout" data-action="header_style_dark" href="javascript:void(0)">
               <span>Header Dark</span>
               </a>
            </div>
         </div>
         <a class="d-lg-none btn btn-sm btn-alt-secondary ms-1" data-toggle="layout" data-action="sidebar_close" href="javascript:void(0)">
         <i class="fa fa-fw fa-times"></i>
         </a>
      </div>
   </div>
   <div class="js-sidebar-scroll">
      <div class="content-side">
         <ul class="nav-main">
         
         	
            <li class="nav-main-item">
               <a class="nav-main-link active" href="${APPURL }/dashboard.htm">
               <i class="nav-main-link-icon si si-speedometer"></i>
               <span class="nav-main-link-name">Dashboard</span>
               </a>
            </li>
            
            <li class="nav-main-heading">Post</li>
            
            <li class="nav-main-item">
               <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
               		<i class="nav-main-link-icon si si-badge"></i>
               		<span class="nav-main-link-name"> Bài viết </span>
               </a>
               
               <ul class="nav-main-submenu">
               		<li class="nav-main-item">
	                     <a class="nav-main-link" href="be_blocks_styles.html">
	                     	<span class="nav-main-link-name"> Xem tất cả</span>
	                     </a>
                  	</li>
                  	
                  	<li class="nav-main-item">
	                     <a class="nav-main-link" href="be_blocks_styles.html">
	                     	<span class="nav-main-link-name"> Thêm mới</span>
	                     </a>
                  	</li>
               </ul>
            </li>
            
            
            <li class="nav-main-item">
               <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
               		<i class="nav-main-link-icon si si-badge"></i>
               		<span class="nav-main-link-name"> Thể loại </span>
               </a>
               
               <ul class="nav-main-submenu">
               		<li class="nav-main-item">
	                     <a class="nav-main-link" href="${APPURL }/admin/category.htm">
	                     	<span class="nav-main-link-name"> Xem tất cả</span>
	                     </a>
                  	</li>
                  	
                  	<li class="nav-main-item">
	                     <a class="nav-main-link" href="${APPURL }/admin/add-category.htm">
	                     	<span class="nav-main-link-name"> Thêm mới</span>
	                     </a>
                  	</li>
               </ul>
            </li>
            
            <li class="nav-main-item">
               <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
               		<i class="nav-main-link-icon si si-badge"></i>
               		<span class="nav-main-link-name"> Trang thông tin </span>
               </a>
               
               <ul class="nav-main-submenu">
               		<li class="nav-main-item">
	                     <a class="nav-main-link" href="be_blocks_styles.html">
	                     	<span class="nav-main-link-name"> Xem tất cả</span>
	                     </a>
                  	</li>
                  	
                  	<li class="nav-main-item">
	                     <a class="nav-main-link" href="be_blocks_styles.html">
	                     	<span class="nav-main-link-name"> Thêm mới</span>
	                     </a>
                  	</li>
               </ul>
            </li>
            
            <li class="nav-main-item">
               <a class="nav-main-link" aria-haspopup="true" aria-expanded="false" href="#">
               		<i class="nav-main-link-icon si si-badge"></i>
               		<span class="nav-main-link-name"> Bình luận </span>
               </a>
            </li>
            
            
            <li class="nav-main-heading">MEDIA</li>
            <li class="nav-main-item">
               <a class="nav-main-link" aria-haspopup="true" aria-expanded="false" href="#">
               		<i class="nav-main-link-icon si si-badge"></i>
               		<span class="nav-main-link-name"> Media </span>
               </a>
            </li>
            
            
            <!-- TABLE -->
            
            <!--<li class="nav-main-item">
               <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
               <i class="nav-main-link-icon si si-grid"></i>
               <span class="nav-main-link-name">Tables</span>
               </a>
               <ul class="nav-main-submenu">
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_tables_styles.html">
                     <span class="nav-main-link-name">Styles</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_tables_responsive.html">
                     <span class="nav-main-link-name">Responsive</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_tables_helpers.html">
                     <span class="nav-main-link-name">Helpers</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_tables_datatables.html">
                     <span class="nav-main-link-name">DataTables</span>
                     </a>
                  </li>
               </ul>
            </li> -->
            
            <!-- FORMS -->
            
            <!--<li class="nav-main-item">
               <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
               <i class="nav-main-link-icon si si-note"></i>
               <span class="nav-main-link-name">Forms</span>
               </a>
               <ul class="nav-main-submenu">
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_forms_elements.html">
                     <span class="nav-main-link-name">Elements</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_forms_layouts.html">
                     <span class="nav-main-link-name">Layouts</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_forms_input_groups.html">
                     <span class="nav-main-link-name">Input Groups</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_forms_plugins.html">
                     <span class="nav-main-link-name">Plugins</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_forms_editors.html">
                     <span class="nav-main-link-name">Editors</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                     <span class="nav-main-link-name">CKEditor 5</span>
                     </a>
                     <ul class="nav-main-submenu">
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="be_forms_ckeditor5_classic.html">
                           <span class="nav-main-link-name">Classic</span>
                           </a>
                        </li>
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="be_forms_ckeditor5_inline.html">
                           <span class="nav-main-link-name">Inline</span>
                           </a>
                        </li>
                     </ul>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_forms_validation.html">
                     <span class="nav-main-link-name">Validation</span>
                     </a>
                  </li>
               </ul>
            </li> -->
            
            
            <li class="nav-main-heading">ADMINSTRATOR</li>
            <li class="nav-main-item">
               <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
               <i class="nav-main-link-icon si si-wrench"></i>
               <span class="nav-main-link-name">Thành viên</span>
               </a>
               <ul class="nav-main-submenu">
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_comp_loaders.html">
                     <span class="nav-main-link-name">Loaders</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_comp_image_cropper.html">
                     <span class="nav-main-link-name">Image Cropper</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_comp_appear.html">
                     <span class="nav-main-link-name">Appear</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_comp_charts.html">
                     <span class="nav-main-link-name">Charts</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_comp_calendar.html">
                     <span class="nav-main-link-name">Calendar</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_comp_sliders.html">
                     <span class="nav-main-link-name">Sliders</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_comp_carousel.html">
                     <span class="nav-main-link-name">Carousel</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_comp_syntax_highlighting.html">
                     <span class="nav-main-link-name">Syntax Highlighting</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_comp_rating.html">
                     <span class="nav-main-link-name">Rating</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_comp_maps_vector.html">
                     <span class="nav-main-link-name">Vector Maps</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_comp_dialogs.html">
                     <span class="nav-main-link-name">Dialogs</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_comp_notifications.html">
                     <span class="nav-main-link-name">Notifications</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_comp_gallery.html">
                     <span class="nav-main-link-name">Gallery</span>
                     </a>
                  </li>
               </ul>
            </li>
            <li class="nav-main-item">
               <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
               <i class="nav-main-link-icon si si-magic-wand"></i>
               		<span class="nav-main-link-name">Giao diện</span>
               </a>
               <ul class="nav-main-submenu">
                  <li class="nav-main-item">
                     <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                     <span class="nav-main-link-name">Page</span>
                     </a>
                     <ul class="nav-main-submenu">
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="be_layout_page_default.html">
                           <span class="nav-main-link-name">Default</span>
                           </a>
                        </li>
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="be_layout_page_flipped.html">
                           <span class="nav-main-link-name">Flipped</span>
                           </a>
                        </li>
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="be_layout_page_native_scrolling.html">
                           <span class="nav-main-link-name">Native Scrolling</span>
                           </a>
                        </li>
                     </ul>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                     <span class="nav-main-link-name">Dark Mode</span>
                     </a>
                     <ul class="nav-main-submenu">
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="be_layout_dark_mode_on.html">
                           <span class="nav-main-link-name">On</span>
                           </a>
                        </li>
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="be_layout_dark_mode_off.html">
                           <span class="nav-main-link-name">Off</span>
                           </a>
                        </li>
                     </ul>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                     <span class="nav-main-link-name">Main Content</span>
                     </a>
                     <ul class="nav-main-submenu">
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="be_layout_content_main_full_width.html">
                           <span class="nav-main-link-name">Full Width</span>
                           </a>
                        </li>
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="be_layout_content_main_narrow.html">
                           <span class="nav-main-link-name">Narrow</span>
                           </a>
                        </li>
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="be_layout_content_main_boxed.html">
                           <span class="nav-main-link-name">Boxed</span>
                           </a>
                        </li>
                     </ul>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                     <span class="nav-main-link-name">Header</span>
                     </a>
                     <ul class="nav-main-submenu">
                        <li class="nav-main-heading">Fixed</li>
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="be_layout_header_fixed_light.html">
                           <span class="nav-main-link-name">Light</span>
                           </a>
                        </li>
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="be_layout_header_fixed_dark.html">
                           <span class="nav-main-link-name">Dark</span>
                           </a>
                        </li>
                        <li class="nav-main-heading">Static</li>
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="be_layout_header_static_light.html">
                           <span class="nav-main-link-name">Light</span>
                           </a>
                        </li>
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="be_layout_header_static_dark.html">
                           <span class="nav-main-link-name">Dark</span>
                           </a>
                        </li>
                     </ul>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                     <span class="nav-main-link-name">Sidebar</span>
                     </a>
                     <ul class="nav-main-submenu">
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="be_layout_sidebar_mini.html">
                           <span class="nav-main-link-name">Mini</span>
                           </a>
                        </li>
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="be_layout_sidebar_light.html">
                           <span class="nav-main-link-name">Light</span>
                           </a>
                        </li>
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="be_layout_sidebar_dark.html">
                           <span class="nav-main-link-name">Dark</span>
                           </a>
                        </li>
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="be_layout_sidebar_hidden.html">
                           <span class="nav-main-link-name">Hidden</span>
                           </a>
                        </li>
                     </ul>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                     <span class="nav-main-link-name">Side Overlay</span>
                     </a>
                     <ul class="nav-main-submenu">
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="be_layout_side_overlay_visible.html">
                           <span class="nav-main-link-name">Visible</span>
                           </a>
                        </li>
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="be_layout_side_overlay_mode_hover.html">
                           <span class="nav-main-link-name">Hover Mode</span>
                           </a>
                        </li>
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="be_layout_side_overlay_no_page_overlay.html">
                           <span class="nav-main-link-name">No Page Overlay</span>
                           </a>
                        </li>
                     </ul>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_layout_api.html">
                     <span class="nav-main-link-name">API</span>
                     </a>
                  </li>
               </ul>
            </li>
            <!-- CAI DAT CHUNG -->
            <li class="nav-main-item">
               <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
               <i class="nav-main-link-icon si si-puzzle"></i>
               <span class="nav-main-link-name">Cài đặt chung</span>
               </a>
               <ul class="nav-main-submenu">
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="#">
                     <span class="nav-main-link-name">Link 1-1</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="#">
                     <span class="nav-main-link-name">Link 1-2</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                     <span class="nav-main-link-name">Sub Level 2</span>
                     </a>
                     <ul class="nav-main-submenu">
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="#">
                           <span class="nav-main-link-name">Link 2-1</span>
                           </a>
                        </li>
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="#">
                           <span class="nav-main-link-name">Link 2-2</span>
                           </a>
                        </li>
                        <li class="nav-main-item">
                           <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                           <span class="nav-main-link-name">Sub Level 3</span>
                           </a>
                           <ul class="nav-main-submenu">
                              <li class="nav-main-item">
                                 <a class="nav-main-link" href="#">
                                 <span class="nav-main-link-name">Link 3-1</span>
                                 </a>
                              </li>
                              <li class="nav-main-item">
                                 <a class="nav-main-link" href="#">
                                 <span class="nav-main-link-name">Link 3-2</span>
                                 </a>
                              </li>
                              <li class="nav-main-item">
                                 <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                                 <span class="nav-main-link-name">Sub Level 4</span>
                                 </a>
                                 <ul class="nav-main-submenu">
                                    <li class="nav-main-item">
                                       <a class="nav-main-link" href="#">
                                       <span class="nav-main-link-name">Link 4-1</span>
                                       </a>
                                    </li>
                                    <li class="nav-main-item">
                                       <a class="nav-main-link" href="#">
                                       <span class="nav-main-link-name">Link 4-2</span>
                                       </a>
                                    </li>
                                    <li class="nav-main-item">
                                       <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                                       <span class="nav-main-link-name">Sub Level 5</span>
                                       </a>
                                       <ul class="nav-main-submenu">
                                          <li class="nav-main-item">
                                             <a class="nav-main-link" href="#">
                                             <span class="nav-main-link-name">Link 5-1</span>
                                             </a>
                                          </li>
                                          <li class="nav-main-item">
                                             <a class="nav-main-link" href="#">
                                             <span class="nav-main-link-name">Link 5-2</span>
                                             </a>
                                          </li>
                                          <li class="nav-main-item">
                                             <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                                             <span class="nav-main-link-name">Sub Level 6</span>
                                             </a>
                                             <ul class="nav-main-submenu">
                                                <li class="nav-main-item">
                                                   <a class="nav-main-link" href="#">
                                                   <span class="nav-main-link-name">Link 6-1</span>
                                                   </a>
                                                </li>
                                                <li class="nav-main-item">
                                                   <a class="nav-main-link" href="#">
                                                   <span class="nav-main-link-name">Link 6-2</span>
                                                   </a>
                                                </li>
                                             </ul>
                                          </li>
                                       </ul>
                                    </li>
                                 </ul>
                              </li>
                           </ul>
                        </li>
                     </ul>
                  </li>
               </ul>
            </li>
            
            <!-- EMAIL -->
            <li class="nav-main-item">
               <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
               <i class="nav-main-link-icon si si-puzzle"></i>
               <span class="nav-main-link-name">Email</span>
               </a>
               <ul class="nav-main-submenu">
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="#">
                     <span class="nav-main-link-name">Link 1-1</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="#">
                     <span class="nav-main-link-name">Link 1-2</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                     <span class="nav-main-link-name">Sub Level 2</span>
                     </a>
                     <ul class="nav-main-submenu">
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="#">
                           <span class="nav-main-link-name">Link 2-1</span>
                           </a>
                        </li>
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="#">
                           <span class="nav-main-link-name">Link 2-2</span>
                           </a>
                        </li>
                        <li class="nav-main-item">
                           <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                           <span class="nav-main-link-name">Sub Level 3</span>
                           </a>
                           <ul class="nav-main-submenu">
                              <li class="nav-main-item">
                                 <a class="nav-main-link" href="#">
                                 <span class="nav-main-link-name">Link 3-1</span>
                                 </a>
                              </li>
                              <li class="nav-main-item">
                                 <a class="nav-main-link" href="#">
                                 <span class="nav-main-link-name">Link 3-2</span>
                                 </a>
                              </li>
                              <li class="nav-main-item">
                                 <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                                 <span class="nav-main-link-name">Sub Level 4</span>
                                 </a>
                                 <ul class="nav-main-submenu">
                                    <li class="nav-main-item">
                                       <a class="nav-main-link" href="#">
                                       <span class="nav-main-link-name">Link 4-1</span>
                                       </a>
                                    </li>
                                    <li class="nav-main-item">
                                       <a class="nav-main-link" href="#">
                                       <span class="nav-main-link-name">Link 4-2</span>
                                       </a>
                                    </li>
                                    <li class="nav-main-item">
                                       <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                                       <span class="nav-main-link-name">Sub Level 5</span>
                                       </a>
                                       <ul class="nav-main-submenu">
                                          <li class="nav-main-item">
                                             <a class="nav-main-link" href="#">
                                             <span class="nav-main-link-name">Link 5-1</span>
                                             </a>
                                          </li>
                                          <li class="nav-main-item">
                                             <a class="nav-main-link" href="#">
                                             <span class="nav-main-link-name">Link 5-2</span>
                                             </a>
                                          </li>
                                          <li class="nav-main-item">
                                             <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                                             <span class="nav-main-link-name">Sub Level 6</span>
                                             </a>
                                             <ul class="nav-main-submenu">
                                                <li class="nav-main-item">
                                                   <a class="nav-main-link" href="#">
                                                   <span class="nav-main-link-name">Link 6-1</span>
                                                   </a>
                                                </li>
                                                <li class="nav-main-item">
                                                   <a class="nav-main-link" href="#">
                                                   <span class="nav-main-link-name">Link 6-2</span>
                                                   </a>
                                                </li>
                                             </ul>
                                          </li>
                                       </ul>
                                    </li>
                                 </ul>
                              </li>
                           </ul>
                        </li>
                     </ul>
                  </li>
               </ul>
            </li>
            
            <!-- TICH HOP -->
            <li class="nav-main-item">
               <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
               <i class="nav-main-link-icon si si-puzzle"></i>
               <span class="nav-main-link-name">Tích hợp</span>
               </a>
               <ul class="nav-main-submenu">
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="#">
                     <span class="nav-main-link-name">Link 1-1</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="#">
                     <span class="nav-main-link-name">Link 1-2</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                     <span class="nav-main-link-name">Sub Level 2</span>
                     </a>
                     <ul class="nav-main-submenu">
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="#">
                           <span class="nav-main-link-name">Link 2-1</span>
                           </a>
                        </li>
                        <li class="nav-main-item">
                           <a class="nav-main-link" href="#">
                           <span class="nav-main-link-name">Link 2-2</span>
                           </a>
                        </li>
                        <li class="nav-main-item">
                           <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                           <span class="nav-main-link-name">Sub Level 3</span>
                           </a>
                           <ul class="nav-main-submenu">
                              <li class="nav-main-item">
                                 <a class="nav-main-link" href="#">
                                 <span class="nav-main-link-name">Link 3-1</span>
                                 </a>
                              </li>
                              <li class="nav-main-item">
                                 <a class="nav-main-link" href="#">
                                 <span class="nav-main-link-name">Link 3-2</span>
                                 </a>
                              </li>
                              <li class="nav-main-item">
                                 <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                                 <span class="nav-main-link-name">Sub Level 4</span>
                                 </a>
                                 <ul class="nav-main-submenu">
                                    <li class="nav-main-item">
                                       <a class="nav-main-link" href="#">
                                       <span class="nav-main-link-name">Link 4-1</span>
                                       </a>
                                    </li>
                                    <li class="nav-main-item">
                                       <a class="nav-main-link" href="#">
                                       <span class="nav-main-link-name">Link 4-2</span>
                                       </a>
                                    </li>
                                    <li class="nav-main-item">
                                       <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                                       <span class="nav-main-link-name">Sub Level 5</span>
                                       </a>
                                       <ul class="nav-main-submenu">
                                          <li class="nav-main-item">
                                             <a class="nav-main-link" href="#">
                                             <span class="nav-main-link-name">Link 5-1</span>
                                             </a>
                                          </li>
                                          <li class="nav-main-item">
                                             <a class="nav-main-link" href="#">
                                             <span class="nav-main-link-name">Link 5-2</span>
                                             </a>
                                          </li>
                                          <li class="nav-main-item">
                                             <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
                                             <span class="nav-main-link-name">Sub Level 6</span>
                                             </a>
                                             <ul class="nav-main-submenu">
                                                <li class="nav-main-item">
                                                   <a class="nav-main-link" href="#">
                                                   <span class="nav-main-link-name">Link 6-1</span>
                                                   </a>
                                                </li>
                                                <li class="nav-main-item">
                                                   <a class="nav-main-link" href="#">
                                                   <span class="nav-main-link-name">Link 6-2</span>
                                                   </a>
                                                </li>
                                             </ul>
                                          </li>
                                       </ul>
                                    </li>
                                 </ul>
                              </li>
                           </ul>
                        </li>
                     </ul>
                  </li>
               </ul>
            </li>
            
            <!-- <li class="nav-main-heading">Pages</li> -->
            
            <!-- BLANK -->
            
            <!-- <li class="nav-main-item">
               <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
               <i class="nav-main-link-icon si si-layers"></i>
               <span class="nav-main-link-name">Generic</span>
               </a>
               <ul class="nav-main-submenu">
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_pages_generic_blank.html">
                     <span class="nav-main-link-name">Blank</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_pages_generic_blank_block.html">
                     <span class="nav-main-link-name">Blank with Block</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_pages_generic_search.html">
                     <span class="nav-main-link-name">Search</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_pages_generic_profile.html">
                     <span class="nav-main-link-name">Profile</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_pages_generic_profile_edit.html">
                     <span class="nav-main-link-name">Profile Edit</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_pages_generic_inbox.html">
                     <span class="nav-main-link-name">Inbox</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_pages_generic_invoice.html">
                     <span class="nav-main-link-name">Invoice</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_pages_generic_pricing_plans.html">
                     <span class="nav-main-link-name">Pricing Plans</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_pages_generic_faq.html">
                     <span class="nav-main-link-name">FAQ</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_pages_generic_team.html">
                     <span class="nav-main-link-name">Team</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_pages_generic_contact.html">
                     <span class="nav-main-link-name">Contact</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_pages_generic_support.html">
                     <span class="nav-main-link-name">Support</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_pages_generic_upgrade_plan.html">
                     <span class="nav-main-link-name">Upgrade Plan</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_pages_dashboard_v1.html">
                     <span class="nav-main-link-name">Dashboard v1</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="op_maintenance.html">
                     <span class="nav-main-link-name">Maintenance</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="op_status.html">
                     <span class="nav-main-link-name">Status</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="op_coming_soon.html">
                     <span class="nav-main-link-name">Coming Soon</span>
                     </a>
                  </li>
               </ul>
            </li> -->
            
            
            <!-- AUTHENTICATION -->
            
            <!-- <li class="nav-main-item">
               <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
               <i class="nav-main-link-icon si si-lock"></i>
               <span class="nav-main-link-name">Authentication</span>
               </a>
               <ul class="nav-main-submenu">
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_pages_auth_all.html">
                     <span class="nav-main-link-name">All</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="op_auth_signin.html">
                     <span class="nav-main-link-name">Sign In</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="op_auth_signin2.html">
                     <span class="nav-main-link-name">Sign In 2</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="op_auth_signin3.html">
                     <span class="nav-main-link-name">Sign In 3</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="op_auth_signup.html">
                     <span class="nav-main-link-name">Sign Up</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="op_auth_signup2.html">
                     <span class="nav-main-link-name">Sign Up 2</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="op_auth_signup3.html">
                     <span class="nav-main-link-name">Sign Up 3</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="op_auth_lock.html">
                     <span class="nav-main-link-name">Lock Screen</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="op_auth_lock2.html">
                     <span class="nav-main-link-name">Lock Screen 2</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="op_auth_lock3.html">
                     <span class="nav-main-link-name">Lock Screen 3</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="op_auth_reminder.html">
                     <span class="nav-main-link-name">Pass Reminder</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="op_auth_reminder2.html">
                     <span class="nav-main-link-name">Pass Reminder 2</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="op_auth_reminder3.html">
                     <span class="nav-main-link-name">Pass Reminder 3</span>
                     </a>
                  </li>
               </ul>
            </li> -->
            
            
            
            <!-- ERROR PAGES -->
            
            <!-- <li class="nav-main-item">
               <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
               <i class="nav-main-link-icon si si-fire"></i>
               <span class="nav-main-link-name">Error Pages</span>
               </a>
               <ul class="nav-main-submenu">
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="be_pages_error_all.html">
                     <span class="nav-main-link-name">All</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="op_error_400.html">
                     <span class="nav-main-link-name">400</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="op_error_401.html">
                     <span class="nav-main-link-name">401</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="op_error_403.html">
                     <span class="nav-main-link-name">403</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="op_error_404.html">
                     <span class="nav-main-link-name">404</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="op_error_500.html">
                     <span class="nav-main-link-name">500</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="op_error_503.html">
                     <span class="nav-main-link-name">503</span>
                     </a>
                  </li>
               </ul>
            </li> -->
            
          
          
            
            <!-- GET STARTED -->
            
            <!-- <li class="nav-main-item">
               <a class="nav-main-link nav-main-link-submenu" data-toggle="submenu" aria-haspopup="true" aria-expanded="false" href="#">
               <i class="nav-main-link-icon si si-cup"></i>
               <span class="nav-main-link-name">Get Started</span>
               </a>
               <ul class="nav-main-submenu">
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="gs_backend.html">
                     <span class="nav-main-link-name">Backend</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="gs_backend_boxed.html">
                     <span class="nav-main-link-name">Backend Boxed</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="gs_landing.html">
                     <span class="nav-main-link-name">Landing</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="gs_rtl_backend.html">
                     <span class="nav-main-link-name">RTL Backend</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="gs_rtl_backend_boxed.html">
                     <span class="nav-main-link-name">RTL Backend Boxed</span>
                     </a>
                  </li>
                  <li class="nav-main-item">
                     <a class="nav-main-link" href="gs_rtl_landing.html">
                     <span class="nav-main-link-name">RTL Landing</span>
                     </a>
                  </li>
               </ul>
            </li> -->
         </ul>
      </div>
   </div>
</nav>