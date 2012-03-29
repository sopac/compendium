package compendium.data

class AutoCompleteController {

    def index = { }

    //session no
    def sessionAJAX = {
        def projects = Project.findAllBySessionLike("%${params.query}%")
        //Create XML response
        render(contentType: "text/xml") {
            results() {
                projects.each { p ->
                    result() {
                        name(p.session)
                        id(p.id)
                    }
                }
            }
        }
    }

    //report title
    def titleAJAX = {
        def projects = Link.findAllByTitleIlike("%${params.query}%")
        //Create XML response
        render(contentType: "text/xml") {
            results() {
                projects.each { p ->
                    result() {
                        name(p.title)
                        id(p.id)
                    }
                }
            }
        }
    }

    //report id
    def reportAJAX = {
        def projects = Link.findAllByUrlIlike("%${params.query}%")
        //Create XML response
        render(contentType: "text/xml") {
            results() {
                projects.each { p ->
                    result() {
                        name(p.url.substring(0, p.url.indexOf(".")))
                        id(p.id)
                    }
                }
            }
        }
    }


}
