package com.cabolabs.openehr.opt

import com.cabolabs.openehr.opt.manager.*

import grails.converters.JSON

// TODO: move to service
import net.pempek.unicode.UnicodeBOMInputStream
import com.cabolabs.openehr.opt.parser.*
import com.cabolabs.openehr.opt.serializer.*

class OptController {

   def xmlValidationService


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
   private processUpload(name, request, response, session)
   {

   }

   def template_viewer()
   {
      println params
      
      // TODO: move to service
      if (params.doit)
      {
         def f = request.getFile('file')

         if(f.empty)
         {
            errors << message(code:"opt.upload.error.noOPT")
            res = [status:'error', message:'XML validation errors', errors: errors]
            render(text: res as JSON, contentType:"application/json", encoding:"UTF-8")
            return
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

         // Validate XML
         if (!xmlValidationService.validateOPT(xml))
         {
            errors = xmlValidationService.getErrors() // Important to keep the correspondence between version index and error reporting.
            res = [status:'error', message:'XML validation errors', errors: errors]
            render(text: res as JSON, contentType:"application/json", encoding:"UTF-8")
            return
         }


         def opt_repo = grailsApplication.config.getProperty('app.opt_repo', String)

         // Prepare file
         def destination = opt_repo + '/com.cabolabs.openehr_opt.namespaces.default/' + java.util.UUID.randomUUID() + '.opt'
         File fileDest = new File( destination )
         fileDest << xml


         def man = OptManager.getInstance(opt_repo)
         man.unloadAll()
         man.loadAll()

         // TODO: render from loaded in manager

         // Parse to get the template id
         //def slurper = new XmlSlurper(false, false)
         //def template = slurper.parseText(xml)


         def parser = new OperationalTemplateParser()
         def opt = parser.parse(xml)
         def toJson = new JsonSerializer()
         toJson.serialize(opt)
         def json = toJson.get(true)

         render(text: json as JSON, contentType:"application/json", encoding:"UTF-8")
         return
      }
   }

   def template_to_json()
   {
      if (params.doit)
      {

      }
   }

   def xml_instance_validator()
   {
      if (params.doit)
      {

      }
   }
}
