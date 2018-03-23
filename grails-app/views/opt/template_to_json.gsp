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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/vs.min.css" integrity="sha256-w6kCMnFvhY2tI1OnsYR/rb5DG9yFGodJknvFZOkp51E=" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js" integrity="sha256-/BfiIkHlHoVihZdc6TFuj7MmJ0TWcWsMXkeDFwhi0zw=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/languages/json.min.js" integrity="sha256-tTizFdjdqBNNTjhOdrSB4jSoCiSZjbtQBdsUSl+P+PQ=" crossorigin="anonymous"></script>
  </head>
  <body>
    <section>
      <div class="container">
        <h1>Template to JSON</h1>

        <p>
          This service allows to transform openEHR Operational Templates (OPT) in XML to an equivalent
          JSON structure. This is very useful to work with OPTs in the front-end and JavaScript frameworks.
        </p>

        <g:uploadForm action="template_to_json">

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

            <pre><code class="json">${result.json}</code></pre>

            <script>
            $(document).ready(function() {
              $('pre code').each(function(i, block) {
                hljs.highlightBlock(block);
              });
            });
            </script>

          </g:else>
        </div>
      </section>
    </g:if>

  </body>
</html>
