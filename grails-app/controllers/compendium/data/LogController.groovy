package compendium.data

class LogController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [logInstanceList: Log.listOrderById(params, order: "desc"), logInstanceTotal: Log.count()]
    }

    def create = {
        def logInstance = new Log()
        logInstance.properties = params
        return [logInstance: logInstance]
    }

    def save = {
        def logInstance = new Log(params)
        if (logInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'log.label', default: 'Log'), logInstance.id])}"
            redirect(action: "show", id: logInstance.id)
        }
        else {
            render(view: "create", model: [logInstance: logInstance])
        }
    }

    def show = {
        def logInstance = Log.get(params.id)
        if (!logInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'log.label', default: 'Log'), params.id])}"
            redirect(action: "list")
        }
        else {
            [logInstance: logInstance]
        }
    }

    def edit = {
        def logInstance = Log.get(params.id)
        if (!logInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'log.label', default: 'Log'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [logInstance: logInstance]
        }
    }

    def update = {
        def logInstance = Log.get(params.id)
        if (logInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (logInstance.version > version) {

                    logInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'log.label', default: 'Log')] as Object[], "Another user has updated this Log while you were editing")
                    render(view: "edit", model: [logInstance: logInstance])
                    return
                }
            }
            logInstance.properties = params
            if (!logInstance.hasErrors() && logInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'log.label', default: 'Log'), logInstance.id])}"
                redirect(action: "show", id: logInstance.id)
            }
            else {
                render(view: "edit", model: [logInstance: logInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'log.label', default: 'Log'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def logInstance = Log.get(params.id)
        if (logInstance) {
            try {
                logInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'log.label', default: 'Log'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'log.label', default: 'Log'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'log.label', default: 'Log'), params.id])}"
            redirect(action: "list")
        }
    }
}
