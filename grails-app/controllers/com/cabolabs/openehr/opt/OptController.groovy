package com.cabolabs.openehr.opt

import com.cabolabs.openehr.opt.manager.*

class OptController {

   def index() {
      String PS = File.separator
      def man = OptManager.getInstance('opts')
      man.loadAll('test_namespace')
      
      man.getLoadedOpts('test_namespace').each { id, opt ->
        println opt.templateId +' '+ opt.language
      }

      [opts: man.getLoadedOpts('test_namespace')]
   }
}
