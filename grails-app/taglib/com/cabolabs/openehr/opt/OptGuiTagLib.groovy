package com.cabolabs.openehr.opt

import com.cabolabs.openehr.opt.model.*

class OptGuiTagLib {
    //static defaultEncodeAs = [taglib:'html']
    static defaultEncodeAs = [taglib:'raw']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    // icon for each IM type
    // TODO: more data values
    static typeIcon = [
      'FOLDER': 'folder-open',
      'COMPOSITION': 'file-text-o',
      'SECTION': 'chevron-left',
      'OBSERVATION': 'eye',
      'EVALUATION': 'refresh',
      'INSTRUCTION': 'paper-plane',
      'ACTION': 'flash',
      'ADMIN_ENTRY': 'gear',
      'ITEM_TREE': 'sitemap',
      'ITEM_TABLE': 'table',
      'ITEM_LIST': 'list',
      'ITEM_SINGLE': 'circle-o',
      'CLUSTER': 'sitemap',
      'ELEMENT': 'pencil',
      'DV_DATE': 'calendar',
      'DV_DATE_TIME': 'calendar',
      'DV_TEXT': 'font',
      'DV_CODED_TEXT': 'list-ul'
    ]

    // attributes of the IM that are not in the OPT
    static typeIMAttributes = [:] // TODO

    // names for the IM attributes (in OPT or not in OPT) that don't have a nodeId
    // so those don't have a term in the ontology.
    // TODO: I18N
    static typeIMAttributeName = [
      'COMPOSITION': [
        '/category': 'Category'
      ]
    ]

    // User from datatypes to assign names to internal attributes
    // TODO: complate
    static typeIMAttributeNameEndsWith = [
      '/defining_code': 'Code',
      '/value': 'Value'
    ]

    private def traverse(ObjectNode o, body, definition)
    {
       //println " ".multiply(pad) + o.rmTypeName.padRight(35-pad, '.') + (o.archetypeId ?: o.path)
       out << '<div>'
       out << (o.archetypeId ?: o.path)

       out << '<div>'
       out << o.templatePath
       out << '</div>'

       // changes to the object root to get the terminology term text
       // all terms are on the root nodes
       if (o.archetypeId) definition = o

       out << '<div>'

       if (typeIcon[o.rmTypeName])
       {
         out << '<span class="fa-stack fa-lg">'
         out << '<i class="fa fa-circle fa-stack-2x"></i>'
         out << '<i class="fa fa-'+ typeIcon[o.rmTypeName] +' fa-stack-1x fa-inverse" aria-hidden="true"></i>'
         out << '</span>'
       }

       out << o.rmTypeName
       out << '</div>'

       if (o.nodeId)
       {
          out << '<div>'
          out << definition.getText(o.nodeId) +' ('+ o.nodeId +')'
          out << '</div>'
       }
       else
       {
          def entry = typeIMAttributeNameEndsWith.find { o.path.endsWith(it.key) }
          if (entry)
          {
            out << '<div>'
            out << entry.value
            out << '</div>'
          }
       }


       o.attributes.each{
          traverse(it, body, definition)
       }

       out << '</div>'
    }

    private def traverse(AttributeNode a, body, definition)
    {
       //println " ".multiply(pad) + a.rmAttributeName

       a.children.each{
          traverse(it, body, definition)
       }
    }

    def displayOPT = {attrs, body ->

        traverse(attrs.opt.definition, body, attrs.opt.definition)
    }

    def displayOPTNodes = { attrs, body ->

        attrs.opt.nodes.sort{it.key}.each { path, node ->

          out << '<div>'
          out << path
          out << '</div>'
        }
    }
}
