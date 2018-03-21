package openehr.opt.gui

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        //"/"(view:"/index")
        "/"(controller:"app")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
