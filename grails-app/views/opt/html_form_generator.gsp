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
        <h1>HTML Form Generator</h1>

        <p>
          This service allows to generate HTML Forms for data input from openEHR Operational Templates (OPT).
          This is useful for quick prototyping of clinical data recording apps. 
        </p>

        <g:uploadForm action="html_form_generator">

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
  </body>
</html>
