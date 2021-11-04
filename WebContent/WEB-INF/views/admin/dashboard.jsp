<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
    <link rel="icon" href="${ SettingsData.getLogomark() != '' ? SettingsData.getLogomark() : './public/images/favicon.ico' }" type="image/x-icon">
     <link rel="shortcut icon" href="${ SettingsData.getLogomark() != '' ? SettingsData.getLogomark() : './public/images/favicon.ico' }" type="image/x-icon">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap">
  	<link rel="stylesheet" id="css-main" href="./public/admin/css/oneui.min.css">
</head>
<body>
<div id="page-container" class="sidebar-o sidebar-dark enable-page-overlay side-scroll page-header-fixed main-content-narrow remember-theme ">
    
  <!-- SIDEBAR FRAGMENT -->
  <jsp:include page="./fragments/sidebar.fragment.jsp"/>

  <!-- HEADER FRAGMENT -->
  <jsp:include page="./fragments/header.fragment.jsp"/>
  
  
  <main id="main-container">
<div class="content">
  <div class="d-flex flex-column flex-md-row justify-content-md-between align-items-md-center py-2 text-center text-md-start">
    <div class="flex-grow-1 mb-1 mb-md-0">
      <h1 class="h3 fw-bold mb-2">
        Dashboard
      </h1>
      <h2 class="h6 fw-medium fw-medium text-muted mb-0">
        Welcome <a class="fw-semibold" href="be_pages_generic_profile.html">John</a>, everything looks great.
      </h2>
    </div>
    <div class="mt-3 mt-md-0 ms-md-3 space-x-1">
      <a class="btn btn-sm btn-alt-secondary space-x-1" href="be_pages_generic_profile_edit.html">
        <i class="fa fa-cogs opacity-50"></i>
        <span>Settings</span>
      </a>
      <div class="dropdown d-inline-block">
        <button type="button" class="btn btn-sm btn-alt-secondary space-x-1" id="dropdown-analytics-overview" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fa fa-fw fa-calendar-alt opacity-50"></i>
          <span>All time</span>
          <i class="fa fa-fw fa-angle-down"></i>
        </button>
        <div class="dropdown-menu dropdown-menu-end fs-sm" aria-labelledby="dropdown-analytics-overview">
          <a class="dropdown-item fw-medium" href="javascript:void(0)">Last 30 days</a>
          <a class="dropdown-item fw-medium" href="javascript:void(0)">Last month</a>
          <a class="dropdown-item fw-medium" href="javascript:void(0)">Last 3 months</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item fw-medium" href="javascript:void(0)">This year</a>
          <a class="dropdown-item fw-medium" href="javascript:void(0)">Last Year</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item fw-medium d-flex align-items-center justify-content-between" href="javascript:void(0)">
            <span>All time</span>
            <i class="fa fa-check"></i>
          </a>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="content">
  <div class="row items-push">
    <div class="col-sm-6 col-xxl-3">
      <div class="block block-rounded d-flex flex-column h-100 mb-0">
        <div class="block-content block-content-full flex-grow-1 d-flex justify-content-between align-items-center">
          <dl class="mb-0">
            <dt class="fs-3 fw-bold">32</dt>
            <dd class="fs-sm fw-medium fs-sm fw-medium text-muted mb-0">Pending Orders</dd>
          </dl>
          <div class="item item-rounded-lg bg-body-light">
            <i class="far fa-gem fs-3 text-primary"></i>
          </div>
        </div>
        <div class="bg-body-light rounded-bottom">
          <a class="block-content block-content-full block-content-sm fs-sm fw-medium d-flex align-items-center justify-content-between" href="javascript:void(0)">
            <span>View all orders</span>
            <i class="fa fa-arrow-alt-circle-right ms-1 opacity-25 fs-base"></i>
          </a>
        </div>
      </div>
    </div>
    <div class="col-sm-6 col-xxl-3">
      <div class="block block-rounded d-flex flex-column h-100 mb-0">
        <div class="block-content block-content-full flex-grow-1 d-flex justify-content-between align-items-center">
          <dl class="mb-0">
            <dt class="fs-3 fw-bold">124</dt>
            <dd class="fs-sm fw-medium fs-sm fw-medium text-muted mb-0">New Customers</dd>
          </dl>
          <div class="item item-rounded-lg bg-body-light">
            <i class="far fa-user-circle fs-3 text-primary"></i>
          </div>
        </div>
        <div class="bg-body-light rounded-bottom">
          <a class="block-content block-content-full block-content-sm fs-sm fw-medium d-flex align-items-center justify-content-between" href="javascript:void(0)">
            <span>View all customers</span>
            <i class="fa fa-arrow-alt-circle-right ms-1 opacity-25 fs-base"></i>
          </a>
        </div>
      </div>
    </div>
    <div class="col-sm-6 col-xxl-3">
      <div class="block block-rounded d-flex flex-column h-100 mb-0">
        <div class="block-content block-content-full flex-grow-1 d-flex justify-content-between align-items-center">
          <dl class="mb-0">
            <dt class="fs-3 fw-bold">45</dt>
            <dd class="fs-sm fw-medium fs-sm fw-medium text-muted mb-0">Messages</dd>
          </dl>
          <div class="item item-rounded-lg bg-body-light">
            <i class="far fa-paper-plane fs-3 text-primary"></i>
          </div>
        </div>
        <div class="bg-body-light rounded-bottom">
          <a class="block-content block-content-full block-content-sm fs-sm fw-medium d-flex align-items-center justify-content-between" href="javascript:void(0)">
            <span>View all messages</span>
            <i class="fa fa-arrow-alt-circle-right ms-1 opacity-25 fs-base"></i>
          </a>
        </div>
      </div>
    </div>
    <div class="col-sm-6 col-xxl-3">
      <div class="block block-rounded d-flex flex-column h-100 mb-0">
        <div class="block-content block-content-full flex-grow-1 d-flex justify-content-between align-items-center">
          <dl class="mb-0">
            <dt class="fs-3 fw-bold">4.5%</dt>
            <dd class="fs-sm fw-medium fs-sm fw-medium text-muted mb-0">Conversion Rate</dd>
          </dl>
          <div class="item item-rounded-lg bg-body-light">
            <i class="fa fa-chart-bar fs-3 text-primary"></i>
          </div>
        </div>
        <div class="bg-body-light rounded-bottom">
          <a class="block-content block-content-full block-content-sm fs-sm fw-medium d-flex align-items-center justify-content-between" href="javascript:void(0)">
            <span>View statistics</span>
            <i class="fa fa-arrow-alt-circle-right ms-1 opacity-25 fs-base"></i>
          </a>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-xl-8 col-xxl-9 d-flex flex-column">
      <div class="block block-rounded flex-grow-1 d-flex flex-column">
        <div class="block-header block-header-default">
          <h3 class="block-title">Earnings Summary</h3>
          <div class="block-options">
            <button type="button" class="btn-block-option" data-toggle="block-option" data-action="state_toggle" data-action-mode="demo">
              <i class="si si-refresh"></i>
            </button>
            <button type="button" class="btn-block-option">
              <i class="si si-settings"></i>
            </button>
          </div>
        </div>
        <div class="block-content block-content-full flex-grow-1 d-flex align-items-center">
          <canvas id="js-chartjs-earnings"></canvas>
        </div>
        <div class="block-content bg-body-light">
          <div class="row items-push text-center w-100">
            <div class="col-sm-4">
              <dl class="mb-0">
                <dt class="fs-3 fw-bold d-inline-flex align-items-center space-x-2">
                  <i class="fa fa-caret-up fs-base text-success"></i>
                  <span>2.5%</span>
                </dt>
                <dd class="fs-sm fw-medium text-muted mb-0">Customer Growth</dd>
              </dl>
            </div>
            <div class="col-sm-4">
              <dl class="mb-0">
                <dt class="fs-3 fw-bold d-inline-flex align-items-center space-x-2">
                  <i class="fa fa-caret-up fs-base text-success"></i>
                  <span>3.8%</span>
                </dt>
                <dd class="fs-sm fw-medium text-muted mb-0">Page Views</dd>
              </dl>
            </div>
            <div class="col-sm-4">
              <dl class="mb-0">
                <dt class="fs-3 fw-bold d-inline-flex align-items-center space-x-2">
                  <i class="fa fa-caret-down fs-base text-danger"></i>
                  <span>1.7%</span>
                </dt>
                <dd class="fs-sm fw-medium text-muted mb-0">New Products</dd>
              </dl>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-xl-4 col-xxl-3 d-flex flex-column">
      <div class="row items-push flex-grow-1">
        <div class="col-md-6 col-xl-12">
          <div class="block block-rounded d-flex flex-column h-100 mb-0">
            <div class="block-content flex-grow-1 d-flex justify-content-between">
              <dl class="mb-0">
                <dt class="fs-3 fw-bold">570</dt>
                <dd class="fs-sm fw-medium text-muted mb-0">Total Orders</dd>
              </dl>
              <div>
                <div class="d-inline-block px-2 py-1 rounded-3 fs-xs fw-semibold text-danger bg-danger-light">
                  <i class="fa fa-caret-down me-1"></i>
                  2.2%
                </div>
              </div>
            </div>
            <div class="block-content p-1 text-center overflow-hidden">
              <canvas id="js-chartjs-total-orders" style="height: 90px;"></canvas>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-xl-12">
          <div class="block block-rounded d-flex flex-column h-100 mb-0">
            <div class="block-content flex-grow-1 d-flex justify-content-between">
              <dl class="mb-0">
                <dt class="fs-3 fw-bold">$5,234.21</dt>
                <dd class="fs-sm fw-medium text-muted mb-0">Total Earnings</dd>
              </dl>
              <div>
                <div class="d-inline-block px-2 py-1 rounded-3 fs-xs fw-semibold text-success bg-success-light">
                  <i class="fa fa-caret-up me-1"></i>
                  4.2%
                </div>
              </div>
            </div>
            <div class="block-content p-1 text-center overflow-hidden">
              <canvas id="js-chartjs-total-earnings" style="height: 90px;"></canvas>
            </div>
          </div>
        </div>
        <div class="col-xl-12">
          <div class="block block-rounded d-flex flex-column h-100 mb-0">
            <div class="block-content flex-grow-1 d-flex justify-content-between">
              <dl class="mb-0">
                <dt class="fs-3 fw-bold">264</dt>
                <dd class="fs-sm fw-medium text-muted mb-0">New Customers</dd>
              </dl>
              <div>
                <div class="d-inline-block px-2 py-1 rounded-3 fs-xs fw-semibold text-success bg-success-light">
                  <i class="fa fa-caret-up me-1"></i>
                  9.3%
                </div>
              </div>
            </div>
            <div class="block-content p-1 text-center overflow-hidden">
              <canvas id="js-chartjs-new-customers" style="height: 90px;"></canvas>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
  </main>
  
  <!-- FOOTER FRAGMENT -->
  <jsp:include page="./fragments/footer.fragment.jsp"/>
  
</div>
		<script src="./public/admin/js/oneui.app.min.js"></script>
		<script src="./public/admin/js/lib/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"></script>
		<script src="./public/admin/js/pages/be_pages_dashboard.min.js"></script>
		<script src="./public/admin/js/pages/core.js"></script>
  </body>
</html>