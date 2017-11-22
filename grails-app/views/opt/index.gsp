<!doctype html>
<html lang="en" class="no-js">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title></title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <asset:stylesheet src="font-awesome.min.css"/>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <style>
      label {
        padding-top: 5px;
        padding-bottom: 5px;
      }
      div {
        /*padding: 10px 0 2px 10px;
        border-left: 1px solid #ddd;
        border-bottom: 1px solid #ddd;
        */
        padding-left: 10px;
        padding-top: 5px;
        padding-bottom: 5px;
      }
      .COMPOSITION {
        background-color: lightblue;
      }
      .EVENT_CONTEXT {
        background-color: lightcyan;
      }
      .SECTION {
        background-color: yellow;
      }
      .OBSERVATION, .EVALUATION, .INSTRUCTION, .ACTION, .ADMIN_ENTRY {
        background-color: pink;
      }
      .ITEM_TREE, .ITEM_LIST, .ITEM_TABLE, .ITEM_SINGLE {
        background-color: orange;
      }
      .CLUSTER {
        background-color: greenyellow;
      }
      .ELEMENT {
        background-color: lightgreen;
      }
      .DV_TEXT, .DV_CODED_TEXT, .DV_DATE, .DV_DATE_TIME {
        background-color: gold;
      }
      .fa-stack {
        margin-right: 5px;
        font-size: 0.6em;
        vertical-align: top;
      }
      h3 {
        margin-top: 0;
      }
      h3 > i.fa-caret-up, h3.folded > i.fa-caret-down {
        display: none;
      }
      h3 > i.fa-caret-down, h3.folded > i.fa-caret-up {
       display: inline;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <g:each in="${opts}" var="entry">
        <h1>${entry.key}</h1>

        <g:displayOPT opt="${entry.value}" />

        <h2>Tree</h2>
        <g:displayOPTTree opt="${entry.value}" />
        <hr/>
        <h2>Plain</h2>
        <g:displayOPTNodes opt="${entry.value}" />
      </g:each>
    </div>
    <script>
    $('h3').on('click', function(){

      it = $(this);
      if (!it.hasClass('folded'))
      {
        it.parent().siblings().hide();
        it.addClass('folded');
      }
      else
      {
        /*
        autoHeight = it.parent().siblings().css('height', 'auto').height();
        it.parent().siblings().show().animate({ height: autoHeight }, 1000, function(){
          //$(this).show();
        });
        */
/*
        $.each(it.parent().siblings(), function( i, sib ) {
          sib = $(sib);
          sib.show();
          //autoHeight = sib.css('height', 'auto').height();
          sib.animate({ height: '100%r' }, 1000, function(){
            //$(this).show();
          });
        });
        */
        it.parent().siblings().show();
        it.removeClass('folded');
      }
    });
    </script>
  </body>
</html>
