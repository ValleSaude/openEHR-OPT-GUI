package com.cabolabs.openehr.opt

import grails.transaction.Transactional

import com.cabolabs.openehr.opt.model.*
import com.cabolabs.openehr.opt.serializer.*

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
         def errors = xmlValidationService.getErrors() // Important to keep the correspondence between version index and error reporting.
         res = [status:'error', message:'XML validation errors', errors: errors]
         return res
      }

      return [status:'ok', message:'OPT XML is valid!']
   }

   def validateDocumentInstance(String xml)
   {

   }

   def documentInstanceToHTML(String xml)
   {

   }
}
