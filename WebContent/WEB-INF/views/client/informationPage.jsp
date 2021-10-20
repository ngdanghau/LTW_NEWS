<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vi" class="no-js">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <script>(function(html){html.className = html.className.replace(/\bno-js\b/,'js')})(document.documentElement);</script>
      <title> About &#8211; Times Writer</title>
      <meta name='robots' content='max-image-preview:large' />
      <link rel='dns-prefetch' href='//fonts.googleapis.com' />
      <link href='https://fonts.gstatic.com' crossorigin rel='preconnect' />
      <link rel='stylesheet' id='wi-fonts-css' href='https://fonts.googleapis.com/css?family=Libre+Franklin%3A400%2C400italic%2C900%7CTinos%3A400%2C400italic%2C700%7CLora%3A400&#038;display=swap&#038;ver=4.6.7.1' media='all' />
      <script src="<c:url value='./public/client/vendor/jquery/jquery.min.js' />"></script>
      <meta name="description" content="Get to know more about me" />
      
      <link rel="icon" href="https://timeswriter.xyz/assets/images/favicon.ico" type="image/x-icon">
      <link rel="shortcut icon" href="https://timeswriter.xyz/assets/images/favicon.ico" type="image/x-icon">
      
      <link rel='stylesheet' href="<c:url value='/public/client/vendor/block-library/style.min.css'/>"/>
      <link rel='stylesheet' href="<c:url value='/public/client/style.min.css'/>"/>
      <link rel='stylesheet' href="<c:url value='/public/client/style.css'/>"/>
      
      <script src="<c:url value='./public/client/vendor/jquery/jquery.min.js' />"></script>
      <script src="<c:url value='./public/client/vendor/jquery/jquery-migrate.min.js' />"></script>
   </head>
   <body class="post-template-default single single-post postid-1395 single-format-standard theme-fox woocommerce-js layout-wide style--dropcap-default dropcap-style-default style--dropcap-font-heading style--tag-plain style--list-widget-1 style--tagcloud-1 style--blockquote-no-icon style--single-heading-border_top style--link-2 elementor-default elementor-kit-11">
      <div id="wi-all" class="fox-outer-wrapper fox-all wi-all">
         <div id="wi-wrapper" class="fox-wrapper wi-wrapper">
            <div class="wi-container">
               <!-- HEADER FRAGMENT -->
               <jsp:include page="./fragments/header.fragment.jsp"/>
               <div id="masthead-mobile" class="masthead-mobile">
                  <div class="container">
                     <div class="masthead-mobile-left masthead-mobile-part">
                        <a class="toggle-menu hamburger hamburger-btn">
                        <i class="fa fa-bars ic-hamburger"></i> <i class="feather-x"></i>
                        </a>
                     </div>
                     <h4 id="mobile-logo" class="mobile-logo mobile-logo-image">
                        <a href="https://timeswriter.xyz" rel="home">
                        <img width="744" height="90" src="https://timeswriter.xyz/assets/uploads/1/images/logo/times.png" class="attachment-full size-full" alt="" loading="lazy" srcset="https://timeswriter.xyz/assets/uploads/1/images/logo/times.png" />
                        </a>
                     </h4>
                  </div>
                  <div class="masthead-mobile-bg"></div>
               </div>
               <div id="wi-main" class="wi-main fox-main">
                  <article id="wi-content" class="wi-content wi-single single-style-1b padding-top-normal post type-post status-publish format-standard has-post-thumbnail hentry category-opinion tag-article tag-breaking-news tag-publishing tag-times tag-travel tag-wp no-sidebar">
                     <div class="single-big-section single-big-section-content">
                        <div class="container">
                           <div id="primary" class="primary content-area">
                              <div class="theiaStickySidebar">
                                 <header class="single-header post-header entry-header page-header align-center single-section">
                                    <div class="container">
                                       <div class="header-main">
                                          <div class="post-item-header">
                                             <div class="title-subtitle">
                                                <h1 class="post-title post-item-title"> ${ page.title }</h1>
                                                <div class="post-item-subtitle post-header-section">
                                                   <p> ${ page.excerpt }</p>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </header>
                                 <div class="single-body single-section">
                                    <div class="single-section single-main-content allow-stretch-full disable-dropcap">
                                       <div class="entry-container">
                                          <div class="content-main">
                                             <div class="dropcap-content columnable-content entry-content single-component">
                                                <p>${ page.content }</p>
                                             </div>
                                             <div class="single-component single-component-share">
                                                <div class="fox-share share-style-custom  color-custom background-custom hover-color-custom hover-background-custom share-icons-shape-circle size-small share-layout-stack">
                                                   <span class="share-label"><i class="fa fa-share-alt"></i>Share this</span>
                                                   <ul>
                                                      <li class="li-share-facebook">
                                                         <a href="https://www.facebook.com/sharer/sharer.php?u=http://timeswriter.xyz/post/" title="Facebook" class="share share-facebook">
                                                         <i class="fab fa-facebook-f"></i>
                                                         <span>Facebook</span>
                                                         </a>
                                                      </li>
                                                      <li class="li-share-messenger">
                                                         <a href="https://www.facebook.com/dialog/send?app_id=794927004237856&#038;link=http://timeswriter.xyz/post/&#038;redirect_uri=http://timeswriter.xyz" title="Messenger" class="share share-messenger">
                                                         <i class="fab fa-facebook-messenger"></i>
                                                         <span>Messenger</span>
                                                         </a>
                                                      </li>
                                                      <li class="li-share-twitter">
                                                         <a href="https://twitter.com/intent/tweet?url=http://timeswriter.xyz/post/&#038;text=About" title="Twitter" class="share share-twitter">
                                                         <i class="fab fa-twitter"></i>
                                                         <span>Twitter</span>
                                                         </a>
                                                      </li>
                                                      <li class="li-share-pinterest">
                                                         <a href="https://pinterest.com/pin/create/button/?url=http://timeswriter.xyz/post/&#038;description=About" title="Pinterest" class="share share-pinterest">
                                                         <i class="fab fa-pinterest-p"></i>
                                                         <span>Pinterest</span>
                                                         </a>
                                                      </li>
                                                      <li class="li-share-linkedin">
                                                         <a href="https://www.linkedin.com/shareArticle?mini=true&#038;url=http://timeswriter.xyz/post/&#038;title=About" title="Linkedin" class="share share-linkedin">
                                                         <i class="fab fa-linkedin-in"></i>
                                                         <span>Linkedin</span>
                                                         </a>
                                                      </li>
                                                      <li class="li-share-whatsapp">
                                                         <a href="https://api.whatsapp.com/send?phone=&#038;text=http://timeswriter.xyz/post/" title="Whatsapp" class="share share-whatsapp">
                                                         <i class="fab fa-whatsapp"></i>
                                                         <span>Whatsapp</span>
                                                         </a>
                                                      </li>
                                                      <li class="li-share-reddit">
                                                         <a href="https://www.reddit.com/submit?url=http://timeswriter.xyz/post/&#038;title=About" title="Reddit" class="share share-reddit">
                                                         <i class="fab fa-reddit-alien"></i>
                                                         <span>Reddit</span>
                                                         </a>
                                                      </li>
                                                      <li class="li-share-email">
                                                         <a href="/cdn-cgi/l/email-protection#37084442555d5254430a7952401205076e58455c120574120507435f5e441205075e441205074e5842451205075b564443120507545f56595452111407040f0c5558534e0a5f4343470d1818435e5a524440455e435245194f4e4d184758444318" title="Email" class="email-share">
                                                         <i class="feather-mail"></i>
                                                         <span>Email</span>
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
                           </div>
                        </div>
                     </div>
                  </article>
               </div>
               
               <!-- SIDE BAR FRAGMENT -->
      			<%-- <jsp:include page="./fragments/sidebar.fragment.jsp"/> --%>
               
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
      <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script id='wi-main-js-extra'>
         var WITHEMES = {"enable_sticky_sidebar":"","enable_sticky_header":"1","ajaxurl":"https:\/\/bmtopvn.com\/ajax.php","nonce":"5af06dfff4","tablet_breakpoint":"840","enable_lightbox":"1"};
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
      </script> <script>
         (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
         (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
         m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
         })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
         
         ga('create', 'UA-199495229-1', 'auto');
         ga('send', 'pageview');
      </script>
   </body>
</html>