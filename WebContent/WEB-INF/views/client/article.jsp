<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi" class="no-js">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <script>(function(html){html.className = html.className.replace(/\bno-js\b/,'js')})(document.documentElement);</script>
      <title> ${ post.title } - ${ SettingsData.getSite_name() }</title>
      <meta name='robots' content='max-image-preview:large' />
      <link rel='dns-prefetch' href='//fonts.googleapis.com' />
	  <base href="${APPURL}/" />
      <link href='https://fonts.gstatic.com' crossorigin rel='preconnect' />
      <link rel='stylesheet' id='wi-fonts-css' href='https://fonts.googleapis.com/css?family=Libre+Franklin%3A400%2C400italic%2C900%7CTinos%3A400%2C400italic%2C700%7CLora%3A400&#038;display=swap&#038;ver=4.6.7.1' media='all' />
      <link rel='stylesheet' href="<c:url value='./public/client/vendor/jquery/jquery.min.js'/>"/>
      <meta name="description" content="${ post.excerpt }" />
      <meta property="og:site_name" content="${ SettingsData.getSite_name() }">
      <meta property="og:type" content="website">
      <meta property="og:title" content="${ post.title } - ${ SettingsData.getSite_name() }" />
      <meta property="og:url" content="${APPURL}/article/${ post.id }-${ post.post_slug }" />
      <meta property="og:image" content="${ post.media }" />
      <meta property="og:description" content="${ post.excerpt }" />
      <link rel="icon" href="<c:url value='./public/client/images/favicon.ico'/>" type="image/x-icon">
      <link rel="shortcut icon" href="<c:url value='./public/client/images/favicon.ico'/>" type="image/x-icon">
      <link rel='stylesheet' href="<c:url value='./public/client/vendor/block-library/style.min.css'/>"/>
      <link rel='stylesheet' href="<c:url value='./public/client/style.min.css'/>"/>
      <link rel='stylesheet' href="<c:url value='./public/client/style.css'/>"/>
      <script src="<c:url value='./public/client/vendor/jquery/jquery.min.js' />"></script>
      <script src="<c:url value='./public/client/vendor/jquery/jquery-migrate.min.js' />"></script>
      <script src="https://www.google.com/recaptcha/api.js?hl=vi" async defer></script>
   </head>
   <body class="post-template-default single single-post postid-1395 single-format-standard theme-fox woocommerce-js layout-wide style--dropcap-default dropcap-style-default style--dropcap-font-heading style--tag-plain style--list-widget-1 style--tagcloud-1 style--blockquote-no-icon style--single-heading-border_top style--link-2 elementor-default elementor-kit-11">
      <div id="wi-all" class="fox-outer-wrapper fox-all wi-all">
         <div id="wi-wrapper" class="fox-wrapper wi-wrapper">
            <div class="wi-container">
               <!-- HEADER FRAGMENT -->
               <jsp:include page="./fragments/header.fragment.jsp"/>
               <jsp:include page="./fragments/logo.fragment.jsp"/>
               <div id="wi-main" class="wi-main fox-main">
                  <article id="wi-content" class="wi-content wi-single single-style-1b padding-top-normal post type-post status-publish format-standard has-post-thumbnail hentry category-opinion tag-article tag-breaking-news tag-publishing tag-times tag-travel tag-wp no-sidebar">
                     <div class="single-big-section single-big-section-content">
                        <div class="container">
                           <div id="primary" class="primary content-area">
                              <div class="theiaStickySidebar">
                                 <div class="single-body single-section">
                                    <div class="single-section single-main-content allow-stretch-full allow-stretch-left allow-stretch-right allow-stretch-bigger disable-dropcap">
                                       <div class="entry-container">
                                          <div class="content-main narrow-area">
                                             <header class="hero-meta single-component">
                                                <div class="container">
                                                   <div class="header-main narrow-area">
                                                      <div class="post-item-header">
                                                         <div class="entry-categories meta-categories categories-plain standalone-categories post-header-section">
                                                            <a href="https://timeswriter.xyz/category/giao-duc" rel="tag">Giáo Dục</a>
                                                         </div>
                                                         <div class="title-subtitle">
                                                            <h1 class="post-title post-item-title">${ post.title }</h1>
                                                            <div class="post-item-subtitle post-header-section">
                                                               <p>${ post.excerpt }</p>
                                                            </div>
                                                         </div>
                                                         <div class="post-item-meta wi-meta fox-meta post-header-section ">
                                                            <div class="fox-meta-author entry-author meta-author">
                                                               <span class="byline"> Bởi <span class="author vcard">
                                                               <a class="url fn" href="${APPURL}/author/${post.user.username}">
                                                               <span>${post.user.firstname} ${post.user.lastname}</span></a></span></span>
                                                            </div>
                                                            <div class="entry-date meta-time machine-time time-short">
                                                               <time class="published">${dateFormat.format(post.modified_at) }</time>
                                                            </div>
                                                         </div>
                                                      </div>
                                                   </div>
                                                </div>
                                             </header>
                                             <div class="dropcap-content columnable-content entry-content single-component">
                                                
                                                  ${ post.content }
                                             </div>
                                             <p>Nguồn: <i>${ post.source }</i></p>
                                             <div class="single-component single-component-share">
                                                <div class="fox-share share-style-custom  color-custom background-custom hover-color-custom hover-background-custom share-icons-shape-circle size-small share-layout-stack">
                                                   <span class="share-label"><i class="fa fa-share-alt"></i>Share this</span>
                                                   <ul>
                                                      <li class="li-share-facebook">
                                                         <a href="https://www.facebook.com/sharer/sharer.php?u=${APPURL}/article/${ post.id }-${ post.post_slug }" title="Facebook" class="share share-facebook">
                                                         <i class="fab fa-facebook-f"></i>
                                                         <span>Facebook</span>
                                                         </a>
                                                      </li>
                                                      <li class="li-share-messenger">
                                                         <a href="https://www.facebook.com/dialog/send?app_id=794927004237856&#038;link=${APPURL}/article/${ post.id }-${ post.post_slug }&#038;redirect_uri=${APPURL}" title="Messenger" class="share share-messenger">
                                                         <i class="fab fa-facebook-messenger"></i>
                                                         <span>Messenger</span>
                                                         </a>
                                                      </li>
                                                      <li class="li-share-twitter">
                                                         <a href="https://twitter.com/intent/tweet?url=${APPURL}/article/${ post.id }-${ post.post_slug }&#038;text=${ post.title }" title="Twitter" class="share share-twitter">
                                                         <i class="fab fa-twitter"></i>
                                                         <span>Twitter</span>
                                                         </a>
                                                      </li>
                                                      <li class="li-share-pinterest">
                                                         <a href="https://pinterest.com/pin/create/button/?url=${APPURL}/article/${ post.id }-${ post.post_slug }&#038;description=${ post.title }" title="Pinterest" class="share share-pinterest">
                                                         <i class="fab fa-pinterest-p"></i>
                                                         <span>Pinterest</span>
                                                         </a>
                                                      </li>
                                                      <li class="li-share-linkedin">
                                                         <a href="https://www.linkedin.com/shareArticle?mini=true&#038;url=${APPURL}/article/${ post.id }-${ post.post_slug }&#038;title=${ post.title }" title="Linkedin" class="share share-linkedin">
                                                         <i class="fab fa-linkedin-in"></i>
                                                         <span>Linkedin</span>
                                                         </a>
                                                      </li>
                                                      <li class="li-share-whatsapp">
                                                         <a href="https://api.whatsapp.com/send?phone=&#038;text=${APPURL}/article/${ post.id }-${ post.post_slug }" title="Whatsapp" class="share share-whatsapp">
                                                         <i class="fab fa-whatsapp"></i>
                                                         <span>Whatsapp</span>
                                                         </a>
                                                      </li>
                                                      <li class="li-share-reddit">
                                                         <a href="https://www.reddit.com/submit?url=${APPURL}/article/${ post.id }-${ post.post_slug }&#038;title=${ post.title }" title="Reddit" class="share share-reddit">
                                                         <i class="fab fa-reddit-alien"></i>
                                                         <span>Reddit</span>
                                                         </a>
                                                      </li>
                                                      <li class="li-share-email">
                                                         <a href="mailto:?subject=${ post.title }&amp;body=${APPURL}/article/${ post.id }-${ post.post_slug }" title="Email" class="email-share">
                                                         <i class="feather-mail"></i>
                                                         <span>Email</span>
                                                         </a>
                                                      </li>
                                                   </ul>
                                                </div>
                                             </div>
                                             <div class="single-component single-component-authorbox">
                                                <div class="fox-authorbox authorbox-simple authorbox-narrow">
                                                   <div class="authorbox-inner">
                                                      <div class="user-item-avatar authorbox-avatar avatar-circle">
                                                         <a href="https://timeswriter.xyz/author/poleyi2417">
                                                         <img alt='' src="https://timeswriter.xyz/assets/images/users/no-avatar.png" srcset='http://timeswriter.xyz/assets/images/users/no-avatar.png 2x' class='avatar avatar-300 photo' height='300' width='300' loading='lazy' />
                                                         </a>
                                                      </div>
                                                      <div class="authorbox-text">
                                                         <div class="fox-user-item authorbox-tab active authorbox-content" data-tab="author">
                                                            <div class="user-item-body">
                                                               <h3 class="user-item-name">
                                                                  <a href="https://timeswriter.xyz/author/poleyi2417">Nancy M Seifert</a>
                                                               </h3>
                                                               <div class="user-item-description">
                                                                  <p></p>
                                                               </div>
                                                               <div class="social-list user-item-social shape-circle style-plain">
                                                                  <ul>
                                                                     <li class="li-facebook">
                                                                        <a href="#" target="_blank" rel="noopener" class="tooltipstered">
                                                                        <i class="fab fa-facebook-square"></i>
                                                                        </a>
                                                                     </li>
                                                                     <li class="li-pinterest">
                                                                        <a href="#" target="_blank" rel="noopener" class="tooltipstered">
                                                                        <i class="fab fa-pinterest-p"></i>
                                                                        </a>
                                                                     </li>
                                                                     <li class="li-tumblr">
                                                                        <a href="#" target="_blank" rel="noopener" class="tooltipstered">
                                                                        <i class="fab fa-tumblr"></i>
                                                                        </a>
                                                                     </li>
                                                                     <li class="li-vkontakte">
                                                                        <a href="#" target="_blank" rel="noopener" class="tooltipstered">
                                                                        <i class="fab fa-vk"></i>
                                                                        </a>
                                                                     </li>
                                                                     <li class="li-whatsapp">
                                                                        <a href="#" target="_blank" rel="noopener" class="tooltipstered">
                                                                        <i class="fab fa-whatsapp"></i>
                                                                        </a>
                                                                     </li>
                                                                     <li class="li-telegram">
                                                                        <a href="#" target="_blank" rel="noopener" class="tooltipstered">
                                                                        <i class="fab fa-telegram"></i>
                                                                        </a>
                                                                     </li>
                                                                  </ul>
                                                               </div>
                                                            </div>
                                                         </div>
                                                      </div>
                                                   </div>
                                                </div>
                                             </div>
                                             <c:if test="${ post.comment_status }">
                                             	<jsp:include page="./fragments/comment.fragment.jsp"/>
                                             </c:if>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="single-related-wrapper single-big-section single-bottom-section single-big-section-related">
                        <div class="fox-related-posts">
                           <div class="container">
                              <h3 class="single-heading related-label related-heading">
                                 <span>Tin liên quan</span>
                              </h3>
                              <div class="blog-container blog-container-grid">
                                 <div class="wi-blog fox-blog blog-grid fox-grid blog-card-has-shadow column-4 spacing-small">
                                    <article class="wi-post post-item post-grid fox-grid-item post-align-left post--thumbnail-before post-1396 post type-post status-publish format-standard has-post-thumbnail hentry category-travel tag-article tag-blog tag-gutenberg tag-instagram tag-times no-sidebar">
                                       <div class="post-item-inner grid-inner post-grid-inner">
                                          <figure class="wi-thumbnail fox-thumbnail post-item-thumbnail fox-figure  grid-thumbnail thumbnail-acute  hover-none thumbnail-loading effect-fade">
                                             <div class="thumbnail-inner">
                                                <a href="https://timeswriter.xyz/post/4948-cau-be-14-tuoi-tiem-vac-xin-covid-19-trung-hoc-bong-toan-phan" class="post-link">
                                                <span class="image-element">
                                                <img width="480" height="384" src="https://vnn-imgs-f.vgcloud.vn/2021/05/28/20/cau-be-14-tuoi-tiem-vac-xin-covid-19-trung-hoc-bong-toan-phan-1.jpg" class="attachment-thumbnail-medium size-thumbnail-medium" alt="" loading="lazy" />
                                                </span>
                                                </a>
                                             </div>
                                          </figure>
                                          <div class="post-body post-item-body grid-body post-grid-body">
                                             <div class="post-body-inner">
                                                <div class="post-item-header">
                                                   <div class="post-item-meta wi-meta fox-meta post-header-section ">
                                                      <div class="entry-date meta-time machine-time time-short">
                                                         <time class="published">29 Tháng năm, 2021</time>
                                                      </div>
                                                   </div>
                                                   <h3 class="post-item-title wi-post-title fox-post-title post-header-section size-tiny">
                                                      <a href="https://timeswriter.xyz/post/4948-cau-be-14-tuoi-tiem-vac-xin-covid-19-trung-hoc-bong-toan-phan" rel="bookmark">
                                                      Cậu bé 14 tuổi trúng học bổng toàn phần sau tiêm vắc xin Covid-19 </a>
                                                   </h3>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </article>
                                    <article class="wi-post post-item post-grid fox-grid-item post-align-left post--thumbnail-before post-1396 post type-post status-publish format-standard has-post-thumbnail hentry category-travel tag-article tag-blog tag-gutenberg tag-instagram tag-times no-sidebar">
                                       <div class="post-item-inner grid-inner post-grid-inner">
                                          <figure class="wi-thumbnail fox-thumbnail post-item-thumbnail fox-figure  grid-thumbnail thumbnail-acute  hover-none thumbnail-loading effect-fade">
                                             <div class="thumbnail-inner">
                                                <a href="https://timeswriter.xyz/post/4947-co-gai-tot-nghiep-dh-thanh-hoa-bi-chi-trich-khi-lam-bao-mau" class="post-link">
                                                <span class="image-element">
                                                <img width="480" height="384" src="https://vnn-imgs-f.vgcloud.vn/2021/05/29/08/co-gai-tot-nghiep-dh-thanh-hoa-bi-chi-trich-khi-lam-bao-mau.jpg" class="attachment-thumbnail-medium size-thumbnail-medium" alt="" loading="lazy" />
                                                </span>
                                                </a>
                                             </div>
                                          </figure>
                                          <div class="post-body post-item-body grid-body post-grid-body">
                                             <div class="post-body-inner">
                                                <div class="post-item-header">
                                                   <div class="post-item-meta wi-meta fox-meta post-header-section ">
                                                      <div class="entry-date meta-time machine-time time-short">
                                                         <time class="published">30 Tháng năm, 2021</time>
                                                      </div>
                                                   </div>
                                                   <h3 class="post-item-title wi-post-title fox-post-title post-header-section size-tiny">
                                                      <a href="https://timeswriter.xyz/post/4947-co-gai-tot-nghiep-dh-thanh-hoa-bi-chi-trich-khi-lam-bao-mau" rel="bookmark">
                                                      Cô gái tốt nghiệp ĐH Thanh Hoa bị chỉ trích vì đi làm quản gia </a>
                                                   </h3>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </article>
                                    <article class="wi-post post-item post-grid fox-grid-item post-align-left post--thumbnail-before post-1396 post type-post status-publish format-standard has-post-thumbnail hentry category-travel tag-article tag-blog tag-gutenberg tag-instagram tag-times no-sidebar">
                                       <div class="post-item-inner grid-inner post-grid-inner">
                                          <figure class="wi-thumbnail fox-thumbnail post-item-thumbnail fox-figure  grid-thumbnail thumbnail-acute  hover-none thumbnail-loading effect-fade">
                                             <div class="thumbnail-inner">
                                                <a href="https://timeswriter.xyz/post/4946-trai-nghiem-hoc-van-o-nuoc-my-cua-10x-tung-gianh-giai-nhat-quoc-gia" class="post-link">
                                                <span class="image-element">
                                                <img width="480" height="384" src="https://vnn-imgs-f.vgcloud.vn/2021/05/30/21/ava-2.jpg" class="attachment-thumbnail-medium size-thumbnail-medium" alt="" loading="lazy" />
                                                </span>
                                                </a>
                                             </div>
                                          </figure>
                                          <div class="post-body post-item-body grid-body post-grid-body">
                                             <div class="post-body-inner">
                                                <div class="post-item-header">
                                                   <div class="post-item-meta wi-meta fox-meta post-header-section ">
                                                      <div class="entry-date meta-time machine-time time-short">
                                                         <time class="published">31 Tháng năm, 2021</time>
                                                      </div>
                                                   </div>
                                                   <h3 class="post-item-title wi-post-title fox-post-title post-header-section size-tiny">
                                                      <a href="https://timeswriter.xyz/post/4946-trai-nghiem-hoc-van-o-nuoc-my-cua-10x-tung-gianh-giai-nhat-quoc-gia" rel="bookmark">
                                                      10X từng giành giải Nhất quốc gia kể chuyện học Văn trên đất Mỹ </a>
                                                   </h3>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </article>
                                    <article class="wi-post post-item post-grid fox-grid-item post-align-left post--thumbnail-before post-1396 post type-post status-publish format-standard has-post-thumbnail hentry category-travel tag-article tag-blog tag-gutenberg tag-instagram tag-times no-sidebar">
                                       <div class="post-item-inner grid-inner post-grid-inner">
                                          <figure class="wi-thumbnail fox-thumbnail post-item-thumbnail fox-figure  grid-thumbnail thumbnail-acute  hover-none thumbnail-loading effect-fade">
                                             <div class="thumbnail-inner">
                                                <a href="https://timeswriter.xyz/post/4945-suc-manh-tu-cau-noi-co-khong-biet-cua-nu-gs-dh-duke" class="post-link">
                                                <span class="image-element">
                                                <img width="480" height="384" src="https://vnn-imgs-f.vgcloud.vn/2021/06/04/08/ava.jpg" class="attachment-thumbnail-medium size-thumbnail-medium" alt="" loading="lazy" />
                                                </span>
                                                </a>
                                             </div>
                                          </figure>
                                          <div class="post-body post-item-body grid-body post-grid-body">
                                             <div class="post-body-inner">
                                                <div class="post-item-header">
                                                   <div class="post-item-meta wi-meta fox-meta post-header-section ">
                                                      <div class="entry-date meta-time machine-time time-short">
                                                         <time class="published">04 Tháng sáu, 2021</time>
                                                      </div>
                                                   </div>
                                                   <h3 class="post-item-title wi-post-title fox-post-title post-header-section size-tiny">
                                                      <a href="https://timeswriter.xyz/post/4945-suc-manh-tu-cau-noi-co-khong-biet-cua-nu-gs-dh-duke" rel="bookmark">
                                                      Sức mạnh từ câu nói 'Cô không biết' của nữ GS người Mỹ </a>
                                                   </h3>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </article>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </article>
               </div>
               <!-- FOOTER FRAGMENT -->
               <jsp:include page="./fragments/footer.fragment.jsp"/>
            </div>
            <div class="wrapper-bg-element"></div>
            <div class="wrapper-border-top hand-border-h wrapper-border"></div>
            <div class="wrapper-border-bottom hand-border-h wrapper-border"></div>
            <div class="wrapper-border-left hand-border-v wrapper-border"></div>
            <div class="wrapper-border-right hand-border-v wrapper-border"></div>
         </div>
      </div>
      <div id="offcanvas" class="offcanvas offcanvas-light">
         <div class="offcanvas-inner">
            <div class="offcanvas-search offcanvas-element">
               <div class="searchform">
                  <form role="search" method="get" action="https://timeswriter.xyz/search" class="form">
                     <input type="text" name="q" class="s search-field" value="" placeholder="Nhập và enter" />
                     <button class="submit" role="button" title="Go">
                     <i class="fa fa-search"></i>
                     </button>
                  </form>
               </div>
            </div>
            <nav id="mobilenav" class="offcanvas-nav offcanvas-element">
               <div class="menu">
                  <ul id="menu-primary-1" class="menu">
                     <li class="menu-item menu-item-4 ">
                        <a href="/category/the-gioi">Thế Giới</a>
                     </li>
                     <li class="menu-item menu-item-5 menu-item-has-children">
                        <a href="/category/xa-hoi">Xã Hội</a>
                        <span class="indicator"><i class="indicator-ic"></i></span>
                        <ul class="sub-menu">
                           <li id="menu-item-12" class="menu-item-object-category menu-item menu-item-12">
                              <a href="/category/thoi-su">Thời Sự</a>
                           </li>
                        </ul>
                     </li>
                     <li class="menu-item menu-item-3 menu-item-has-children">
                        <a href="/category/van-hoa">Văn Hoá</a>
                        <span class="indicator"><i class="indicator-ic"></i></span>
                        <ul class="sub-menu">
                           <li id="menu-item-6" class="menu-item-object-category menu-item menu-item-6">
                              <a href="/category/nghe-thuat">Nghệ Thuật</a>
                           </li>
                           <li id="menu-item-28" class="menu-item-object-category menu-item menu-item-28">
                              <a href="/category/am-thuc">Ẩm Thực</a>
                           </li>
                           <li id="menu-item-29" class="menu-item-object-category menu-item menu-item-29">
                              <a href="/category/du-lich">Du Lịch</a>
                           </li>
                        </ul>
                     </li>
                     <li class="menu-item menu-item-13 ">
                        <a href="/category/kinh-te">Kinh Tế</a>
                     </li>
                     <li class="menu-item menu-item-14 menu-item-has-children">
                        <a href="/category/giao-duc">Giáo Dục</a>
                        <span class="indicator"><i class="indicator-ic"></i></span>
                        <ul class="sub-menu">
                           <li id="menu-item-15" class="menu-item-object-category menu-item menu-item-15">
                              <a href="/category/hoc-bong-du-hoc">Học Bổng - Du Học</a>
                           </li>
                           <li id="menu-item-16" class="menu-item-object-category menu-item menu-item-16">
                              <a href="/category/dao-tao-thi-cu">Đào Tạo - Thi Cử</a>
                           </li>
                        </ul>
                     </li>
                     <li class="menu-item menu-item-21 ">
                        <a href="/category/the-thao">Thể Thao</a>
                     </li>
                     <li class="menu-item menu-item-27 ">
                        <a href="/category/phap-luat">Pháp Luật</a>
                     </li>
                     <li class="menu-item menu-item-22 menu-item-has-children">
                        <a href="/category/giai-tri">Giải - Trí</a>
                        <span class="indicator"><i class="indicator-ic"></i></span>
                        <ul class="sub-menu">
                           <li id="menu-item-23" class="menu-item-object-category menu-item menu-item-23">
                              <a href="/category/am-nhac">Âm Nhạc</a>
                           </li>
                           <li id="menu-item-24" class="menu-item-object-category menu-item menu-item-24">
                              <a href="/category/thoi-trang">Thời Trang</a>
                           </li>
                        </ul>
                     </li>
                     <li class="menu-item menu-item-25 menu-item-has-children">
                        <a href="/category/cong-nghe">Công Nghệ</a>
                        <span class="indicator"><i class="indicator-ic"></i></span>
                        <ul class="sub-menu">
                           <li id="menu-item-26" class="menu-item-object-category menu-item menu-item-26">
                              <a href="/category/vien-thong">Viễn Thông</a>
                           </li>
                        </ul>
                     </li>
                  </ul>
               </div>
            </nav>
            <div class="social-list offcanvas-element style-plain shape-circle align-left icon-size-bigger icon-spacing-small style-none">
               <ul>
                  <li class="li-facebook">
                     <a href="#" target="_blank" rel="noopener" title="Facebook">
                     <i class="fab fa-facebook-f"></i>
                     </a>
                  </li>
                  <li class="li-twitter">
                     <a href="#" target="_blank" rel="noopener" title="Twitter">
                     <i class="fab fa-twitter"></i>
                     </a>
                  </li>
                  <li class="li-instagram">
                     <a href="#" target="_blank" rel="noopener" title="Instagram">
                     <i class="fab fa-instagram"></i>
                     </a>
                  </li>
                  <li class="li-youtube">
                     <a href="#" target="_blank" rel="noopener" title="YouTube">
                     <i class="fab fa-youtube"></i>
                     </a>
                  </li>
                  <li class="li-vkontakte">
                     <a href="#" target="_blank" rel="noopener" title="VKontakte">
                     <i class="fab fa-vk"></i>
                     </a>
                  </li>
               </ul>
            </div>
         </div>
      </div>
      </div>
      <div id="offcanvas-bg" class="offcanvas-bg"></div>
      <div class="offcanvas-overlay" id="offcanvas-overlay"></div>
      <div id="backtotop" class="backtotop fox-backtotop scrollup backtotop-circle backtotop-icon">
         <span class="btt-icon"><i class="feather-chevrons-up"></i></span>
      </div>
      <progress value="0" class="reading-progress-wrapper position-top">
         <div class="progress-container">
            <span class="reading-progress-bar"></span>
         </div>
      </progress>
      <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="https://timeswriter.xyz/themes/assets/js/comment-reply.min.js?v=0403013" id='wi-main-js'></script>
      <script id='wi-main-js-extra'>
         var WITHEMES = {"enable_sticky_sidebar":"","enable_sticky_header":"1","tablet_breakpoint":"840","enable_lightbox":"1"};
      </script>
      <script src="<c:url value='./public/client/js/theme.min.js' />"></script>
      <script>
         (function($){
            $("body").on("submit", ".mc4wp-form", function(){
               $form = $(this);
               $form.find(".mc4wp-success").html("<p>Đang thực hiện....</p>");
               $form.find("input#submit").prop('disabled', true);
               $.ajax({
                  url: $form.attr("action"),
                  type: $form.attr("method"),
                  dataType: 'jsonp',
                  data: $form.serialize(),
                  error: function() {
                     $form.find("input#submit").prop('disabled', false);
                     $form.find(".mc4wp-success").html("<p>Oops! Đã xảy ra lỗi. Vui lòng thử lại sau!</p>");
                  },
                  success: function(resp) {
                     if (typeof resp.redirect === "string") {
                           window.location.href = resp.redirect;
                     } else if (typeof resp.msg === "string") {
                           $form.find("input#submit").prop('disabled', false);
                           $form.find(".mc4wp-success").html(resp.msg);
                     } else {
                           $form.find("input#submit").prop('disabled', false);
                           $form.find(".mc4wp-success").html("<p>Oops! Đã xảy ra lỗi. Vui lòng thử lại sau!</p>");
                     }
                  }
               });
               return false;
            })
         })(jQuery);
      </script>
      <jsp:include page="/WEB-INF/views/inc/google-analytics.jsp"/>
   </body>
</html>