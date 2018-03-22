<!doctype html>
<html lang="en" class="no-js">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
      <g:layoutTitle default="Grails"/>
    </title>

    <%--
    <asset:stylesheet src="application.css"/>
    --%>

    <g:layoutHead/>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

    <style type="text/css">
    h1 {
      margin-bottom: 0.8em;
      padding-bottom: 0.2em;
      border-bottom: 1px solid #D4D4D4;
    }
    .card {
      display: block;
      margin-bottom: 1.2rem !important;
      line-height: 1.42857143;
      background-color: #fff;
      border-radius: 2px;
      box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
      transition: box-shadow .25s;
    }
    .card:hover {
      box-shadow: 0 8px 17px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    }
    .card-img-top {
      width: 100%;
      border-top-left-radius:2px;
      border-top-right-radius:2px;
      display:block;
      overflow: hidden;
    }
    .card-img-top img{
      width: 100%;
      /*height: 200px;*/
      object-fit:cover;
      transition: all .25s ease;
      width: 94px;
    }
    .card-title {
      margin-top:0px;
      font-weight: 700;
      font-size: 1.65em;
    }
    .card-title a {
      color: #000;
      text-decoration: none !important;
    }
    .card-read-more {
      border-top: 1px solid #D4D4D4;
    }
    .card-read-more a {
      text-decoration: none !important;
      padding:10px;
      font-weight:600;
      text-transform: uppercase;
    }


    .card-columns {
        @include media-breakpoint-only(lg) {
          column-count: 4;
      }
      @include media-breakpoint-only(xl) {
          column-count: 5;
      }
    }

    body {
      padding-top: 20px;
    }
    @media (max-width: 980px) {
      body {
        padding-top: 0;
      }
    }

    .card-img-top.center {
      text-align: center;
    }
    .card-img-top i, .card-img-top img {
      display: inline-block;
      margin: 30px 0 5px 0;
    }
    .card-body.no-bottom {
      padding-bottom: 0;
    }
    </style>

    <script
        src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>

  </head>
  <body>
    <header>
      <!--TODO: logo + collapse menu for mobile-->
    </header>
    <main>
      <div class="container">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/"><i class="fa fa-home" aria-hidden="true"></i></a></li>
            <g:if test="${request.forwardURI != '/'}">
              <li class="breadcrumb-item active" aria-current="page">${actionName.split('_').join(' ')}</li>
            </g:if>
          </ol>
        </nav>
      </div>
      <g:layoutBody/>
    </main>

    <%--
    <asset:javascript src="application.js"/>
    --%>

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <script>
    $('.custom-file-input').on('change', function() {
      //console.log($(this).val());
      let filename = $(this).val().split('\\').pop();
      //console.log($(this).next('.custom-file-control'));
      //console.log($('.custom-file-label', $(this).parent()));
      $('.custom-file-label', $(this).parent()).addClass("selected").html( filename );
    });
    </script>

  </body>
</html>
