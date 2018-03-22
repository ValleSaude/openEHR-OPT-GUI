package com.cabolabs.openehr

class HelpersTagLib {

   static defaultEncodeAs = [taglib:'raw']
   //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

   def xml_validation_errors = { attrs, body ->

      def errors = attrs.errors
      if (!errors) throw new Exception('xml_validation_errors: errors is null')

      def parts

      // REF https://getbootstrap.com/docs/4.0/components/list-group/
      out << '<div class="row">'
      out << '  <div class="col-4">'
      out << '   <div class="list-group" id="list-tab" role="tablist">'
      errors.eachWithIndex { error, i ->

         parts = error.split(':',2)

         out << '<a class="list-group-item list-group-item-action'+ (i==0 ? ' active' : '') +'" id="list-menu-'+ i +'" data-toggle="list" href="#list-'+ i +'" role="tab">'
         out << parts[0]
         out << '</a>'
      }
      out << '   </div>'
      out << '  </div>'
      out << '  <div class="col-8">'
      out << '   <div class="tab-content" id="nav-tabContent">'
      errors.eachWithIndex { error, i ->

         parts = error.split(':',2)

         out << '        <div class="tab-pane fade show'+ (i==0 ? ' active' : '') +'" id="list-'+ i +'" role="tabpanel" aria-labelledby="list-menu-'+ i +'">'
         out <<            parts[1]
         out << '          <hr/>'
         out << '          <a href="https://wiki.xmldation.com/Support/Validator/'+ (parts[0] - 'ERROR ').replace('.','-') +'" target="_blank">More info</a>'
         out << '        </div>'
      }
      out << '   </div>'
      out << '  </div>'
      out << '</div>'


   }
}
