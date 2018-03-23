package com.cabolabs.openehr.opt

import com.cabolabs.openehr.opt.manager.*

import grails.converters.JSON

// TODO: move to service
import net.pempek.unicode.UnicodeBOMInputStream
import com.cabolabs.openehr.opt.parser.*
import com.cabolabs.openehr.opt.serializer.*


import javax.xml.transform.TransformerFactory
import javax.xml.transform.stream.StreamResult
import javax.xml.transform.stream.StreamSource


class OptController {

   def xmlValidationService
   def optService

   /*
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
   */

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
         def validation = optService.templateValidator(xml)
         if (validation.status == 'error')
         {
            return [result: validation]
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

         def parser = new OperationalTemplateParser()
         def opt = parser.parse(xml)


         // RENDER WITH TAGLIB
         return [result: [status:'ok', message:'Take a look at the template!', opts: [(opt.templateId): opt]]]
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
         def validation = optService.templateValidator(xml)
         if (validation.status == 'error')
         {
            return [result: validation]
         }


         // OPT2JSON
         def parser = new OperationalTemplateParser()
         def opt = parser.parse(xml)
         def json = optService.templateToJSON(opt)

         return [result: [status:'ok', message:'Your template is ready!', json:json]]
      }
   }

   def xml_instance_validator()
   {
      if (params.doit)
      {
         // UPLOAD
         def upload = processUpload('file', request, response, session)
         if (upload.status == 'error')
         {
            //render(text: upload as JSON, contentType:"application/json", encoding:"UTF-8")

            return [result: upload]
         }

         def xml = upload.contents


         // VALIDATE
         def validation = optService.validateDocumentInstance(xml)
         return [result: validation]
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
         def validation = optService.templateValidator(xml)
         if (validation.status == 'error')
         {
            return [result: validation]
         }


         // HTML FORM - TODO: move to service
         def html = optService.templateToHTML(xml)
         return [result: [status:'ok', message:'Your HTML Form is ready!', html:html]]
      }
   }

   def xml_instance_generator()
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
         def validation = optService.templateValidator(xml)
         if (validation.status == 'error')
         {
            return [result: validation]
         }


         // XML INSTANCE WITH RANDOM DATA
         def instance = optService.clinicalDocumentGeneratorXML(xml)
         return [result: [status:'ok', message:'Your instance is ready!', instance:instance]]
      }
   }

   def json_instance_generator()
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
         def validation = optService.templateValidator(xml)
         if (validation.status == 'error')
         {
            return [result: validation]
         }


         // JSON INSTANCE WITH RANDOM DATA
         def instance = optService.clinicalDocumentGeneratorJSON(xml)
         return [result: [status:'ok', message:'Your instance is ready!', instance:instance]]
      }
   }

   def html_instance_render()
   {
      if (params.doit)
      {
         // UPLOAD
         def upload = processUpload('file', request, response, session)
         if (upload.status == 'error')
         {
            //render(text: upload as JSON, contentType:"application/json", encoding:"UTF-8")

            return [result: upload]
         }

         def xml = upload.contents


         // VALIDATE
         def validation = optService.validateDocumentInstance(xml)

         if (validation.status == 'error')
         {
            return [result: validation]
            return
         }

         // TODO: move to service
         def xslt = new File('xsd/openEHR_RMtoHTML.xsl')
         def xslt_content
         if (!xslt.exists()) // try to load from resources
         {
            xslt_content = grailsApplication.parentContext.getResource('xsd/openEHR_RMtoHTML.xsl').inputStream.text
         }
         else
         {
            xslt_content = xslt.text
         }

         // Create transformer
         def transformer = TransformerFactory.newInstance().newTransformer(new StreamSource(new StringReader(xslt_content)))

         def html = new StringWriter()

         // Perform transformation
         transformer.transform(new StreamSource(new StringReader(xml)), new StreamResult(html))

         return [result: [status:'ok', message:'Your HTML is ready!', html:html.toString()]]
      }
   }
}
