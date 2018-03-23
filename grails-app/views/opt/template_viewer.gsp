<!doctype html>
<html lang="en" class="no-js">
  <head>
    <meta name="layout" content="main"/>
    <title>App</title>
    <style>
      .align-label {
        padding: .375em .75em; /* fixes vertical alignment of label for inline form */
      }


      .results label {
        padding-top: 5px;
        padding-bottom: 5px;
      }
      .results div {
        padding-left: 10px;
        padding-top: 5px;
        padding-bottom: 5px;
      }
      .COMPOSITION {
        background-color: #fabe6e;
      }
      .EVENT_CONTEXT, .HISTORY {
        background-color: #f69c6b;
      }
      .SECTION, .EVENT, .POINT_EVENT, .INTERVAL_EVENT {
        background-color: #ffdc4f;
      }
      .OBSERVATION, .EVALUATION, .INSTRUCTION, .ACTION, .ADMIN_ENTRY {
        background-color: #cdeefa;
      }
      .ITEM_TREE, .ITEM_LIST, .ITEM_TABLE, .ITEM_SINGLE {
        background-color: #dbe7f3;
      }
      .CLUSTER {
        background-color: #eb839a;
      }
      .ELEMENT {
        background-color: #c58fc0;
      }
      .DV_TEXT, .DV_CODED_TEXT, .DV_DATE, .DV_DATE_TIME, .DV_QUANTITY {
        background-color: #a6d585;
      }
      .fa-stack {
        margin-right: 5px;
        font-size: 0.6em;
        vertical-align: top;
      }
      .results h3 {
        margin-top: 0;
      }
      .results h3 i {
        margin-left: 5px;
      }
      .results h3 > i.fa-caret-up,
      .results h3.folded > i.fa-caret-down {
        display: none;
      }
      .results h3 > i.fa-caret-down,
      .results h3.folded > i.fa-caret-up {
        display: inline;
      }
    </style>
  </head>
  <body>
    <section>
      <div class="container">
        <h1>Template Viewer</h1>

        <p>
          This service allows to upload an openEHR Operational Template (OPT), display it's tree structure,
          and access useful technical information on each node, like Reference Model Class, Archetype ID,
          Path, and Constraints.
        </p>

        <g:uploadForm action="template_viewer">

          <div class="form-group row">
            <div class="col-md-3">
              <label class="align-label">Upload an OPT File:</label>
            </div>
            <div class="custom-file col-md-7">
              <input type="file" class="custom-file-input" name="file" id="validatedCustomFile" required>
              <label class="custom-file-label" for="validatedCustomFile">Choose Operational Template File...</label>
              <div class="invalid-feedback">Example invalid custom file feedback</div>
            </div>
            <div class="col-md-2">
              <button class="btn btn-primary mb-2" type="submit" name="doit" value="yeah">Submit</button>
            </div>
          </div>

        </g:uploadForm>

      </div>
    </section>

    <g:if test="${result}">
      <section>
        <div class="container">
          <h2>${result.message}</h2>
          <g:if test="${result.errors}">

            <g:xml_validation_errors errors="${result.errors}" />

          </g:if>
          <g:else>

            <div class="results">
              <g:each in="${result.opts}" var="entry">
                <h3>${entry.key}</h3>

                <g:displayOPT opt="${entry.value}" />
                <g:displayOPTTree opt="${entry.value}" />
              </g:each>
            </div>

            <script>
            $('.row h3').on('click', function(){

              it = $(this);
              if (!it.hasClass('folded'))
              {
                it.parent().siblings().hide();
                it.addClass('folded');
              }
              else
              {
                it.parent().siblings().show();
                it.removeClass('folded');
              }
            });
            </script>

          </g:else>
        </div>
      </section>
    </g:if>

  </body>
</html>
