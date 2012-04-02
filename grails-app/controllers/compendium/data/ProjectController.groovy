package compendium.data

class ProjectController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def listSessions = {
        def projectid = params.session
        String session = Project.get(projectid).session
        def projects = Project.findAllBySession(session)
        [projectInstanceList: projects, projectInstanceTotal: projects.size()]
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        [projectInstanceList: Project.list(params), projectInstanceTotal: Project.count()]
    }

    def create = {
        def projectInstance = new Project()
        projectInstance.properties = params
        return [projectInstance: projectInstance]
    }

    def save = {
        def projectInstance = new Project(params)
        if (projectInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'project.label', default: 'Project'), projectInstance.title])}"

            //log
            def l = new Log()
            l.name = session['user']
            l.type = "Created"
            l.project = projectInstance.id
            l.timeStamp = new Date()
            l.save()

            redirect(action: "show", id: projectInstance.id)
        }
        else {
            render(view: "create", model: [projectInstance: projectInstance])
        }
    }

    def show = {
        def projectInstance = Project.get(params.id)
        if (!projectInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), params.id])}"
            redirect(action: "list")
        }
        else {
            def countries = projectInstance.getCountries().sort()
            String thumbnail = "http://geonetwork.sopac.org/geonetwork/images/spc.png"
            [projectInstance: projectInstance, countries: countries]
        }
    }



    def edit = {
        def projectInstance = Project.get(params.id)
        if (!projectInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), params.id])}"
            redirect(action: "list")
        }
        else {
            //println params.alpha
            def links = compendium.data.Link.listOrderByTitle();
            if (params.alpha != null) {
                def tmp = []
                links.each { l ->
                    if (l.title != null) {
                        if (l.title.length() > 1) {
                            if (l.title.toUpperCase().substring(0, 1).equals(params.alpha)) tmp << l
                        }
                    }
                }
                links = tmp
            }

            if (params.type != null) {
                links = Link.findAllByType(params.type, [sort: 'title'])
            }


            return [projectInstance: projectInstance, links: links]
        }
    }

    def clearLinks = {
        Project p = Project.get(params.id)
        p.setLinks(null)
        flash.message = "Links removed from this project..."
        redirect(action: "show", id: p.id)
    }

    def update = {
        def projectInstance = Project.get(params.id)
        Project tmp = Project.get(params.id)
        ArrayList<Link> linksFinal = new ArrayList<Link>()
        tmp.links.each { linksFinal.add(it) }
        //println "l1: 1 - " + linksFinal.size()


        if (projectInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (projectInstance.version > version) {
                    projectInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'project.label', default: 'Project')] as Object[], "Another user has updated this Project while you were editing")
                    render(view: "edit", model: [projectInstance: projectInstance])
                    return
                }
            }

            projectInstance.properties = params

            if (!projectInstance.hasErrors() && projectInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'project.label', default: 'Project'), projectInstance.title])}"

                //log
                def l = new Log()
                l.name = session['user']
                l.type = "Updated"
                l.project = projectInstance.id
                l.timeStamp = new Date()
                l.save()

                //append links
                //println "l1: 2 - " + linksFinal.size()
                for (Link lx : linksFinal) {
                    //println lx.title
                    if (!projectInstance.links.id.contains(lx.id)) {
                        projectInstance.getLinks().add(lx)
                    }
                }

                projectInstance.save(flush: true)

                redirect(action: "show", id: projectInstance.id)
            }
            else {
                render(view: "edit", model: [projectInstance: projectInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def projectInstance = Project.get(params.id)
        if (projectInstance) {
            try {
                projectInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'project.label', default: 'Project'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'project.label', default: 'Project'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'project.label', default: 'Project'), params.id])}"
            redirect(action: "list")
        }
    }
}
