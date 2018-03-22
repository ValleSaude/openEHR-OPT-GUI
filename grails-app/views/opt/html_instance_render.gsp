<!doctype html>
<html lang="en" class="no-js">
  <head>
    <meta name="layout" content="main"/>
    <title>App</title>
    <style>
      .align-label {
        padding: .375em .75em; /* fixes vertical alignment of label for inline form */
      }
    </style>
  </head>
  <body>
    <section>
      <div class="container">
        <h1>HTML Clinical Document Render</h1>

        <p>
          This service allows to generate human-readable openEHR Clinical Documents from a valid
          openEHR XML Instance. This is very useful for testing and sharing with non-technical people.
        </p>

        <g:uploadForm url="[action: 'html_instance_render']" id="xml_instance_generator_form">

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

            <g:xml_validation_errors errors="${result.errors}" />

          </g:if>
          <g:else>

            <div>${raw(result.html)}</div>

          </g:else>
        </div>
      </section>
    </g:if>

  </body>
</html>
