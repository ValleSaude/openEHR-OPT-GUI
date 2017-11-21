package com.cabolabs.openehr.opt

import com.cabolabs.openehr.opt.model.*

class OptGuiTagLib {
    //static defaultEncodeAs = [taglib:'html']
    static defaultEncodeAs = [taglib:'raw']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    private def traverse(ObjectNode o, body, definition)
    {
       //println " ".multiply(pad) + o.rmTypeName.padRight(35-pad, '.') + (o.archetypeId ?: o.path)
       out << '<div>'
       out << (o.archetypeId ?: o.path)

       // changes to the object root to get the terminology term text
       // all terms are on the root nodes
       if (o.archetypeId) definition = o

       out << '<div>'
       out << o.rmTypeName
       out << '</div>'

       if (o.nodeId)
       {
          out << '<div>'
          out << definition.getText(o.nodeId) +' ('+ o.nodeId +')'
          out << '</div>'
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
