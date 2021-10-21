<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>

   
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title> ${ SettingsData.getSite_name() } - ${ SettingsData.getSite_slogan() }</title>
    <meta name="description" content="${ SettingsData.getSite_description() }">
    <meta name="author" content="pixelcave">
    <meta name="robots" content="noindex, nofollow">
    <meta property="og:site_name" content="${ SettingsData.getSite_name() }">
    <meta property="og:type" content="website">
    <meta property="og:title" content="${ SettingsData.getSite_name() } - ${ SettingsData.getSite_slogan() }" />
    <meta property="og:url" content="${HOMEURL}" />
    <meta property="og:description" content="${ post.excerpt }" />
    <base href="${APPURL}/" />
    <link rel="shortcut icon" href="./public/admin/media/favicons/favicon.png">
    <link rel="icon" type="image/png" sizes="192x192" href="./public/admin/media/favicons/favicon-192x192.png">
    <link rel="apple-touch-icon" sizes="180x180" href="./public/admin/media/favicons/apple-touch-icon-180x180.png">
      <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap">
  <link rel="stylesheet" id="css-main" href="./public/admin/css/oneui.min.css">
</head>
<body>
<div id="page-container">
          <main id="main-container">
<div class="bg-primary">
  <div class="row g-0 bg-primary-dark-op">
    <div class="hero-static col-lg-4 d-none d-lg-flex flex-column justify-content-center">
      <div class="p-4 p-xl-5 flex-grow-1 d-flex align-items-center">
        <div class="w-100">
          <a class="link-fx fw-semibold fs-2 text-white" href="index.html">
            ${ SettingsData.getSite_name() }
          </a>
          <p class="text-white-75 me-xl-8 mt-2">
            ${ SettingsData.getSite_slogan() }
          </p>
        </div>
      </div>
      <div class="p-4 p-xl-5 d-xl-flex justify-content-between align-items-center fs-sm">
        <p class="fw-medium text-white-50 mb-0">
          <strong> ${ SettingsData.getSite_name() }</strong> &copy; <span data-toggle="year-copy"></span>
        </p>
      </div>
    </div>
    <div class="hero-static col-lg-8 d-flex flex-column align-items-center bg-body-light">
      <div class="p-3 w-100 d-lg-none text-center">
        <a class="link-fx fw-semibold fs-3 text-dark" href="index.html">
           ${ SettingsData.getSite_name() }
        </a>
      </div>
      <div class="p-4 w-100 flex-grow-1 d-flex align-items-center">
        <div class="w-100">
          <div class="text-center mb-5">
            <p class="mb-3">
              <i class="fa fa-2x fa-circle-notch text-primary-light"></i>
            </p>
            <h1 class="fw-bold mb-2">
              Password Reminder
            </h1>
            <p class="fw-medium text-muted">
              Please provide your account’s email and we will send you your password.
            </p>
          </div>
          <div class="row g-0 justify-content-center">
            <div class="col-sm-8 col-xl-4">
              <form class="js-validation-reminder" action="be_pages_auth_all.html" method="POST">
                <div class="mb-4">
                  <input type="text" class="form-control form-control-lg form-control-alt py-3" id="reminder-credential" name="reminder-credential" placeholder="Username or Email">
                </div>
                <div class="text-center">
                  <button type="submit" class="btn btn-lg btn-alt-primary">
                    <i class="fa fa-fw fa-envelope me-1 opacity-50"></i> Send Mail
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <div class="px-4 py-3 w-100 d-lg-none d-flex flex-column flex-sm-row justify-content-between fs-sm text-center text-sm-start">
        <p class="fw-medium text-black-50 py-2 mb-0">
          <strong> ${ SettingsData.getSite_name() }</strong> &copy; <span data-toggle="year-copy"></span>
        </p>
      </div>
    </div>
  </div>
</div>
  </main>
  </div>
<script src="./public/admin/js/oneui.app.min.js"></script>
<script src="./public/admin/js/lib/jquery.min.js"></script>
<script src="./public/admin/js/plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="./public/admin/js/pages/op_auth_signin.min.js"></script>
  </body>
</html>
   