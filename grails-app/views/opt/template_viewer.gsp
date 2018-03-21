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
  </body>
</html>
