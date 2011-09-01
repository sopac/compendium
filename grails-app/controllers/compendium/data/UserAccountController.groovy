package compendium.data

class UserAccountController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userAccountInstanceList: UserAccount.list(params), userAccountInstanceTotal: UserAccount.count()]
    }

    def create = {
        def userAccountInstance = new UserAccount()
        userAccountInstance.properties = params
        return [userAccountInstance: userAccountInstance]
    }

    def save = {
        def userAccountInstance = new UserAccount(params)
        if (userAccountInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'userAccount.label', default: 'UserAccount'), userAccountInstance.id])}"
            redirect(action: "show", id: userAccountInstance.id)
        }
        else {
            render(view: "create", model: [userAccountInstance: userAccountInstance])
        }
    }

    def show = {
        def userAccountInstance = UserAccount.get(params.id)
        if (!userAccountInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userAccount.label', default: 'UserAccount'), params.id])}"
            redirect(action: "list")
        }
        else {
            [userAccountInstance: userAccountInstance]
        }
    }

    def edit = {
        def userAccountInstance = UserAccount.get(params.id)
        if (!userAccountInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userAccount.label', default: 'UserAccount'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [userAccountInstance: userAccountInstance]
        }
    }

    def update = {
        def userAccountInstance = UserAccount.get(params.id)
        if (userAccountInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userAccountInstance.version > version) {
                    
                    userAccountInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'userAccount.label', default: 'UserAccount')] as Object[], "Another user has updated this UserAccount while you were editing")
                    render(view: "edit", model: [userAccountInstance: userAccountInstance])
                    return
                }
            }
            userAccountInstance.properties = params
            if (!userAccountInstance.hasErrors() && userAccountInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'userAccount.label', default: 'UserAccount'), userAccountInstance.id])}"
                redirect(action: "show", id: userAccountInstance.id)
            }
            else {
                render(view: "edit", model: [userAccountInstance: userAccountInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userAccount.label', default: 'UserAccount'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def userAccountInstance = UserAccount.get(params.id)
        if (userAccountInstance) {
            try {
                userAccountInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'userAccount.label', default: 'UserAccount'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'userAccount.label', default: 'UserAccount'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userAccount.label', default: 'UserAccount'), params.id])}"
            redirect(action: "list")
        }
    }
}
