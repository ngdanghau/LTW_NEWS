<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
   
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Bài viết - ${ SettingsData.getSite_name() }</title>
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
</head>
<body>
<div id="page-container" class="sidebar-o sidebar-dark enable-page-overlay side-scroll page-header-fixed main-content-narrow">
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
          Bài viết
        </h1>
      </div>
     <a  href="${ ADMINURL }/posts/new.htm" class="btn btn-sm btn-primary">
                <i class="fa fa-plus me-1"></i> Bài viết mới
              </a>
    </div>
  </div>
</div>
<div class="content">
  <div class="block block-rounded">
    <div class="block-header block-header-default">
      <h3 class="block-title">Topics</h3>
      <div class="block-options">
        <button type="button" class="btn-block-option me-2">
         
        </button>
        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="fullscreen_toggle"></button>
        <button type="button" class="btn-block-option" data-toggle="block-option" data-action="state_toggle" data-action-mode="demo">
          <i class="si si-refresh"></i>
        </button>
      </div>
    </div>
    <div class="block-content">
      <table class="table table-striped table-borderless table-vcenter">
        <thead class="border-bottom">
          <tr>
          	<th class="d-none d-md-table-cell text-center" style="width: 50px;">
          		<div class="form-check">
                  <input class="form-check-input" type="checkbox" id="check-all" name="check-all">
                </div>
             </th>
            <th colspan="2">Tiêu đề</th>
            <th class="d-none d-md-table-cell text-center" style="width: 100px;">Tác giả</th>
            <th class="d-none d-md-table-cell text-center" style="width: 100px;">Thể Loại</th>
            <th class="d-none d-md-table-cell" style="width: 200px;">Ngày</th>
          </tr>
        </thead>
        <tfoot class="border-bottom">
          <tr>
          	<th class="d-none d-md-table-cell text-center" style="width: 50px;">
          		<div class="form-check">
                  <input class="form-check-input" type="checkbox" id="check-all" name="check-all">
                </div>
             </th>
            <th colspan="2">Tiêu đề</th>
            <th class="d-none d-md-table-cell text-center" style="width: 100px;">Tác giả</th>
            <th class="d-none d-md-table-cell text-center" style="width: 100px;">Thể Loại</th>
            <th class="d-none d-md-table-cell" style="width: 200px;">Ngày</th>
          </tr>
        </tfoot>
        <tbody>
          <tr>
            <td class="text-center" style="width: 40px;">
              <div class="form-check">
                  <input class="form-check-input" type="checkbox" value="1" id="example-checkbox-default1" name="example-checkbox-default1">
                </div>
            </td>
            <td colspan="2">
              <a class="fw-semibold" href="be_pages_forum_discussion.html">Welcome to our forums!</a>
              <div class="fs-sm text-muted mt-1">
                <a class="fw-medium" href="be_pages_generic_profile.html">Scott Young</a> on May 20, 2019
              </div>
            </td>
            <td class="d-none d-md-table-cell text-center">
              <a class="fw-semibold" href="javascript:void(0)">184</a>
            </td>
            <td class="d-none d-md-table-cell text-center">
              <a class="fw-semibold" href="javascript:void(0)">101</a>
            </td>
            <td class="d-none d-md-table-cell">
              <span class="fs-sm">by <a class="fw-medium" href="be_pages_generic_profile.html">Adam McCoy</a><br>on May 21, 2019</span>
            </td>
          </tr>
         
          <tr>
          <td class="text-center" style="width: 40px;">
             <div class="form-check">
                  <input class="form-check-input" type="checkbox" value="1" id="example-checkbox-default1" name="example-checkbox-default1">
                </div>
            </td>
            <td colspan="2">
              <a class="fw-semibold" href="be_pages_forum_discussion.html">Testing out the API</a>
              <div class="fs-sm text-muted mt-1">
                <a class="fw-medium" href="be_pages_generic_profile.html">Wayne Garcia</a> on April 25, 2019
              </div>
            </td>
            <td class="d-none d-md-table-cell text-center">
              <a class="fw-semibold" href="javascript:void(0)">209</a>
            </td>
            <td class="d-none d-md-table-cell text-center">
              <a class="fw-semibold" href="javascript:void(0)">1701</a>
            </td>
            <td class="d-none d-md-table-cell">
              <span class="fs-sm">by <a class="fw-medium" href="be_pages_generic_profile.html">Barbara Scott</a><br>on May 4, 2019</span>
            </td>
          </tr>
        </tbody>
      </table>
      <nav aria-label="Topics navigation">
        <ul class="pagination justify-content-end">
          <li class="page-item active">
            <a class="page-link" href="javascript:void(0)">1</a>
          </li>
          <li class="page-item">
            <a class="page-link" href="javascript:void(0)">2</a>
          </li>
          <li class="page-item">
            <a class="page-link" href="javascript:void(0)">3</a>
          </li>
          <li class="page-item">
            <a class="page-link" href="javascript:void(0)" aria-label="Next">
              <span aria-hidden="true">
                <i class="fa fa-angle-right"></i>
              </span>
              <span class="visually-hidden">Next</span>
            </a>
          </li>
        </ul>
      </nav>
    </div>
  </div>
</div>
  </main>
  <!-- FOOTER FRAGMENT -->
      <jsp:include page="./fragments/footer.fragment.jsp"/>
      

</div>
		<script src="./public/admin/js/oneui.app.min.js"></script>
  </body>
</html>