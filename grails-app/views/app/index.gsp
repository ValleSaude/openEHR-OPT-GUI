<!doctype html>
<html lang="en" class="no-js">
  <head>
    <meta name="layout" content="main"/>
    <title>App</title>
  </head>
  <body>
    <section>
      <div class="container">
        <h1>CaboLabs openEHR Toolkit (CoT)</h1>
        <!-- ${createLink(uri: '/')} -->
<%--
        <ul>
          <li>*Template Viewer</li>
          <li>Archetype Viewer (soon!)</li>
          <li>*Clinical Document Instance Generator (random data XML)</li>
          <li>Clinical Document Instance Generator (tagged XML)</li>
          <li>*Clinical Document Instance Generator (random data JSON)</li>
          <li>Bulk Clinical Document Instance Generator (soon!)</li>
          <li>*Clinical Document Instance Validator</li>
          <li>*HTML Form Generator</li>
          <li>*Template to JSON</li>
          <li>Template Comparator (soon!)</li>
          <li>Template Repository (soon!)</li>
          <li>*HTML Clinical Document Render</li>
          <li>Sample Templates (soon!)</li>
        </ul>
--%>

        <!-- ICON COLORS https://mozilla.github.io/mofo-bootstrap/demo/ -->

        <div class="card-columns">

          <div class="card">
             <div class="card-img-top center">
               <i class="fa fa-cubes fa-4x fa-fw" style="color: #f26c23" aria-hidden="true"></i>
             </div>
             <div class="card-body no-bottom">
                <h4 class="card-title text-center">
                  <g:link controller="opt" action="template_viewer">Template Viewer</g:link>
                </h4>
                <p class="card-text">
                  This service allows to upload an openEHR Operational Template (OPT), display it's tree structure,
                  and access useful technical information on each node, like Reference Model Class, Archetype ID,
                  Path, and Constraints.
                </p>
                <div class="card-read-more text-center">
                  <g:link class="btn btn-link" controller="opt" action="template_viewer">Read More</g:link>
                </div>
             </div>
          </div>

          <div class="card">
             <div class="card-img-top center">
               <i class="fa fa-file-text-o fa-4x fa-fw" style="color: #ab5da4" aria-hidden="true"></i>
             </div>
             <div class="card-body no-bottom">
                <h4 class="card-title text-center">
                  <g:link controller="opt" action="xml_instance_generator">Clinical Document Instance Generator XML</g:link>
                </h4>
                <p class="card-text">
                  This service generates Clinical Document Instances compliant with the openEHR XML Format,
                  from a given Operational Template (OPT). This is very useful while testing applications.
                </p>
                <div class="card-read-more text-center">
                  <g:link class="btn btn-link" controller="opt" action="xml_instance_generator">Read More</g:link>
                </div>
             </div>
          </div>

          <div class="card">
             <div class="card-img-top center">
               <i class="fa fa-file-text-o fa-4x fa-fw" style="color: #ffcd4f" aria-hidden="true"></i>
             </div>
             <div class="card-body no-bottom">
                <h4 class="card-title text-center">
                  <g:link controller="opt" action="json_instance_generator">Clinical Document Instance Generator JSON</g:link>
                </h4>
                <p class="card-text">
                  This service generates openEHR Clinical Document Instances in JSON,
                  from a given Operational Template (OPT). This is very useful while testing applications.
                </p>
                <div class="card-read-more text-center">
                  <g:link class="btn btn-link" controller="opt" action="json_instance_generator">Read More</g:link>
                </div>
             </div>
          </div>

          <div class="card">
             <div class="card-img-top center">
               <i class="fa fa-check-circle fa-4x fa-fw" style="color: #7dc14c" aria-hidden="true"></i>
             </div>
             <div class="card-body no-bottom">
                <h4 class="card-title text-center">
                  <g:link controller="opt" action="xml_instance_validator">Clinical Document Instance Validator</g:link>
                </h4>
                <p class="card-text">
                  This service allows to upload a clinical document in the openEHR XML Format, and
                  execute a sintactic validation, returning a list of errors if something is not correct.
                </p>
                <div class="card-read-more text-center">
                  <g:link class="btn btn-link" controller="opt" action="xml_instance_validator">Read More</g:link>
                </div>
             </div>
          </div>

          <div class="card">
             <div class="card-img-top center">
               <i class="fa fa-window-maximize fa-4x fa-fw" style="color: #b81d3f" aria-hidden="true"></i>
             </div>
             <div class="card-body no-bottom">
                <h4 class="card-title text-center">
                  <g:link controller="opt" action="html_form_generator">HTML Form Generator</g:link>
                </h4>
                <p class="card-text">
                  This service allows to generate HTML Forms for data input from openEHR Operational Templates (OPT).
                  This is useful for quick prototyping of clinical data recording apps.
                </p>
                <div class="card-read-more text-center">
                <g:link class="btn btn-link" controller="opt" action="html_form_generator">Read More</g:link>
                </div>
             </div>
          </div>

          <div class="card">
             <div class="card-img-top center">
               <i class="fa fa-exchange fa-4x fa-fw" style="color: #ffcd02" aria-hidden="true"></i>
             </div>
             <div class="card-body no-bottom">
                <h4 class="card-title text-center">
                  <g:link controller="opt" action="template_to_json">Template to JSON</g:link>
                </h4>
                <p class="card-text">
                  This service allows to transform openEHR Operational Templates (OPT) in XML to an equivalent
                  JSON structure. This is very useful to work with OPTs in the front-end and JavaScript frameworks.
                </p>
                <div class="card-read-more text-center">
                  <g:link class="btn btn-link" controller="opt" action="template_to_json">Read More</g:link>
                </div>
             </div>
          </div>

          <div class="card">
             <div class="card-img-top center">
               <i class="fa fa-code fa-4x fa-fw" style="color: #5a6ba4" aria-hidden="true"></i>
             </div>
             <div class="card-body no-bottom">
                <h4 class="card-title text-center">
                  <g:link controller="opt" action="html_instance_render">HTML Clinical Document Render</g:link>
                </h4>
                <p class="card-text">
                  This service allows to generate human-readable openEHR Clinical Documents from a valid
                  openEHR XML Instance. This is very useful for testing and sharing with non-technical people.
                </p>
                <div class="card-read-more text-center">
                  <g:link class="btn btn-link" controller="opt" action="html_instance_render">Read More</g:link>
                </div>
             </div>
          </div>

          <div class="card">
             <div class="card-img-top center">
               <i class="fa fa-book fa-4x fa-fw" style="color: #f89c24" aria-hidden="true"></i>
             </div>
             <div class="card-body no-bottom">
                <h4 class="card-title text-center">
                  <a href="https://www.openehr.org/" target="_blank">openEHR Specifications v1.0.2</a>
                </h4>
                <p class="card-text">
                  Direct access to the specifications of the openEHR standard for reference.
                </p>
                <div class="card-read-more text-center">
                  <a class="btn btn-link" href="https://www.openehr.org/" target="_blank">Read More</a>
                </div>
             </div>
          </div>

          <div class="card">
             <div class="card-img-top center">
               <img src="static/CloudEHRServer_alpha_72.png" />
             </div>
             <div class="card-body no-bottom">
                <h4 class="card-title text-center">
                  <a href="https://cloudehrserver.com" target="_blank">CloudEHRServer</a>
                </h4>
                <p class="card-text">
                  Next generation, Clinical Data Management and Sharing Platform, based on open source
                  technologies, and compliant with the openEHR standard. Manage EHRs, store openEHR clinical
                  documents, and query data with ease from a REST API.
                </p>
                <div class="card-read-more text-center">
                  <a class="btn btn-link" href="https://cloudehrserver.com" target="_blank">Read More</a>
                </div>
             </div>
          </div>

        </div>
      </div>
    </section>
  </body>
</html>
