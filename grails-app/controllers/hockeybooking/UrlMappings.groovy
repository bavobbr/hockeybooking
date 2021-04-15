package hockeybooking


class UrlMappings {

    static mappings = {

        "/overview"(controller:"overview", action: "index")
        "/reservation"(controller:"reservation", action: "index")


        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "reservation")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
