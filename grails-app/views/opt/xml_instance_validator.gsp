<!doctype html>
<html lang="en" class="no-js">
  <head>
    <meta name="layout" content="main"/>
    <title>App</title>
    <style>
      .align-label {
        padding: .375em .75em; /* fixes vertical alignment of label for inline form */
      }


      /*
       Heart animation when there are no errors.
       ref https://codepen.io/team/css-tricks/pen/MKqgEE
       alt https://codepen.io/Qanser/pen/pwzgyW
       alt http://papermashup.com/periscope-style-heart-effect-with-css-and-js/
       alt https://codepen.io/mathiesjanssen/pen/jmRyxx
       alt https://codepen.io/arcs/pen/XKKYZW
       */
      #no-errors {
        text-align: center;
        padding: 2em;
      }
      .heart {
        fill: red;
        position: relative;
        top: 5px;
        width: 50px;
        animation: pulse 1s ease infinite;
      }
      @keyframes pulse {
        0% { transform: scale(1); }
        50% { transform: scale(1.3); }
        100% { transform: scale(1); }
      }
    </style>
  </head>
  <body>
    <section>
      <div class="container">
        <h1>Clinical Document Instance Validator</h1>

        <p>
          This service allows to upload a clinical document in the openEHR XML Format, and execute
          a sintactic validation, returning a list of errors if something is not correct.
        </p>

        <g:uploadForm url="[action: 'xml_instance_validator']" id="xml_instance_validator_form">

          <div class="form-group row">
            <div class="col-md-3">
              <label class="align-label">Upload an openEHR instance:</label>
            </div>
            <div class="custom-file col-md-7">
              <input type="file" class="custom-file-input" name="file" id="validatedCustomFile" required="true">
              <label class="custom-file-label" for="validatedCustomFile">Choose Clinical Document XML File...</label>
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
            <%-- REF https://getbootstrap.com/docs/4.0/components/list-group/ --%>
            <div class="row">
              <div class="col-4">
                <div class="list-group" id="list-tab" role="tablist">
                  <g:each in="${result.errors}" var="error" status="i">
                    <a class="list-group-item list-group-item-action ${i==0 ? 'active' : ''}" id="list-menu-${i}" data-toggle="list" href="#list-${i}" role="tab">
                    ${error.split(':',2)[0]}
                    </a>
                  </g:each>
                </div>
              </div>
              <div class="col-8">
                <div class="tab-content" id="nav-tabContent">
                  <g:each in="${result.errors}" var="error" status="i">
                    <div class="tab-pane fade show ${i==0 ? 'active' : ''}" id="list-${i}" role="tabpanel" aria-labelledby="list-menu-${i}">
                      ${error.split(':',2)[1]}
                      <hr/>
                      <a href="https://wiki.xmldation.com/Support/Validator/${(error.split(':',2)[0] - 'ERROR ').replace('.','-')}" target="_blank">More info</a>
                    </div>
                  </g:each>
                </div>
              </div>
            </div>
          </g:if>
          <g:else>

            <div id="no-errors">
              <svg class="heart" viewBox="0 0 32 29.6">
                <path d="M23.6,0c-3.4,0-6.3,2.7-7.6,5.6C14.7,2.7,11.8,0,8.4,0C3.8,0,0,3.8,0,8.4c0,9.4,9.5,11.9,16,21.2c6.1-9.3,16-12.1,16-21.2C32,3.8,28.2,0,23.6,0z"/>
              </svg>
            </div>

          </g:else>
        </div>
      </section>
    </g:if>

    <%-- TODO: ajax file upload http://blog.teamtreehouse.com/uploading-files-ajax
    <script>
    $('#xml_instance_validator_form').on('submit', function(e){
      console.log('submit');
      e.preventDefault();
      return false;
    });
    </script>
    --%>

  </body>
</html>
