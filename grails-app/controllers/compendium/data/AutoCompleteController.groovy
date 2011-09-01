package compendium.data

class AutoCompleteController {

    def index = { }

    def searchAJAX = {
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


}
