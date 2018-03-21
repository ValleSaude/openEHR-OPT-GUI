package com.cabolabs.openehr.opt

import com.cabolabs.openehr.opt.manager.*

import grails.converters.JSON

// TODO: move to service
import net.pempek.unicode.UnicodeBOMInputStream
import com.cabolabs.openehr.opt.parser.*
import com.cabolabs.openehr.opt.serializer.*
import com.cabolabs.openehr.opt.ui_generator.OptUiGenerator

class OptController {

   def xmlValidationService
   def optService


   def index()
   {
      String PS = File.separator
      def man = OptManager.getInstance('opts')
      man.loadAll('test_namespace')

      man.getLoadedOpts('test_namespace').each { id, opt ->
        println opt.templateId +' '+ opt.language
      }

      [opts: man.getLoadedOpts('test_namespace')]
   }

   /**
    * Util method to process files uploaded from the UI.
    */
   private Map processUpload(name, request, response, session)
   {
      def errors = []
      def f = request.getFile(name)

      if(f.empty)
      {
         errors << message(code:"opt.upload.error.noOPT")
         res = [status:'error', message:'XML validation errors', errors: errors]
         return res
      }

      // Avoid BOM on OPT files (the Template Designer exports OPTs with BOM and that breaks the XML parser)
      def bytes = f.getBytes()
      def inputStream = new ByteArrayInputStream(bytes)
      def bomInputStream = new UnicodeBOMInputStream(inputStream)
      bomInputStream.skipBOM() // NOP if no BOM is detected

      // Read out
      def isr = new InputStreamReader(bomInputStream)
      def br = new BufferedReader(isr)
      def xml = br.text // getText from Groovy

      return [status:'ok', contents:xml]
   }

   def template_viewer()
   {
      if (params.doit)
      {
         // UPLOAD
         def upload = processUpload('file', request, response, session)
         if (upload.status == 'error')
         {
            render(text: upload as JSON, contentType:"application/json", encoding:"UTF-8")
            return
         }

         def xml = upload.contents


         // VALIDATE
         def validation = optService.validateTemplateInstance(xml)
         if (validation.status == 'error')
         {
            render(text: validation as JSON, contentType:"application/json", encoding:"UTF-8")
            return
         }


         // STORE
         /*
         def opt_repo = grailsApplication.config.getProperty('app.opt_repo', String)

         def destination = opt_repo + '/com.cabolabs.openehr_opt.namespaces.default/' + java.util.UUID.randomUUID() + '.opt'
         File fileDest = new File( destination )
         fileDest << xml
         */


         // REFRESH CACHE
         /*
         def man = OptManager.getInstance(opt_repo)
         man.unloadAll()
         man.loadAll()
         */


         // Parse to get the template id
         //def slurper = new XmlSlurper(false, false)
         //def template = slurper.parseText(xml)


         // RENDER WITH TAGLIB
         render (view: 'index', model: [opts: [(opt.templateId): opt]])
      }
   }

   def template_to_json()
   {
      if (params.doit)
      {
         // UPLOAD
         def upload = processUpload('file', request, response, session)
         if (upload.status == 'error')
         {
            render(text: upload as JSON, contentType:"application/json", encoding:"UTF-8")
            return
         }

         def xml = upload.contents


         // VALIDATE
         def validation = optService.validateTemplateInstance(xml)
         if (validation.status == 'error')
         {
            render(text: validation as JSON, contentType:"application/json", encoding:"UTF-8")
            return
         }


         // OPT2JSON
         def parser = new OperationalTemplateParser()
         def opt = parser.parse(xml)
         def json = optService.templateToJSON(opt)


         render(text: json, contentType:"application/json", encoding:"UTF-8")
         return
      }
   }

   def xml_instance_validator()
   {
      if (params.doit)
      {

      }
   }

   def html_form_generator()
   {
      if (params.doit)
      {
         // UPLOAD
         def upload = processUpload('file', request, response, session)
         if (upload.status == 'error')
         {
            render(text: upload as JSON, contentType:"application/json", encoding:"UTF-8")
            return
         }

         def xml = upload.contents


         // VALIDATE
         def validation = optService.validateTemplateInstance(xml)
         if (validation.status == 'error')
         {
            render(text: validation as JSON, contentType:"application/json", encoding:"UTF-8")
            return
         }


         // HTML FORM - TODO: move to service
         def parser = new OperationalTemplateParser()
         def opt = parser.parse(xml)
         def gen = new OptUiGenerator()
         def html = gen.generate(opt)

         render(text: html, contentType:"text/html", encoding:"UTF-8")
         return
      }
   }
}
