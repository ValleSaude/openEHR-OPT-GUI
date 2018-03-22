package com.cabolabs.openehr.opt

import grails.transaction.Transactional

import com.cabolabs.openehr.opt.model.*
import com.cabolabs.openehr.opt.serializer.*
import com.cabolabs.openehr.opt.ui_generator.OptUiGenerator
import com.cabolabs.openehr.opt.parser.*

@Transactional
class OptService {

   def xmlValidationService

   def templateToJSON(OperationalTemplate opt)
   {
      def toJson = new JsonSerializer()
      toJson.serialize(opt)
      return toJson.get()
   }

   def clinicalDocumentGeneratorXML(OperationalTemplate opt)
   {

   }

   def clinicalDocumentGeneratorJSON(OperationalTemplate opt)
   {

   }

   def generateHTML(OperationalTemplate opt)
   {

   }

   def validateTemplateInstance(String xml)
   {
      if (!xmlValidationService.validateOPT(xml))
      {
         def errors = xmlValidationService.getErrors()
         return [status:'error', message:'XML validation errors', errors: errors]
      }

      return [status:'ok', message:'OPT XML is valid!']
   }

   def validateDocumentInstance(String xml)
   {
      if (!xmlValidationService.validateVersion(xml))
      {
         def errors = xmlValidationService.getErrors()
         return [status:'error', message:'XML validation errors', errors: errors]
      }

      return [status:'ok', message:'XML instance is valid!']
   }

   def documentInstanceToHTML(String xml)
   {
      def parser = new OperationalTemplateParser()
      def opt = parser.parse(xml)
      def gen = new OptUiGenerator()
      def html = gen.generate(opt)
      return html
   }
}
