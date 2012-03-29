package compendium.data

class CleanController {

    def index() {

        Project.executeUpdate("Update Project as p Set p.type='Activity/Task' Where p.type='Activity'")
        render "Finished<br/>"
        Project.executeUpdate("Update Project as p Set p.type='Map/Chart' Where p.type='Map'")
        render "Finished<br/>"
        Project.executeUpdate("Update Project as p Set p.type='Conference/Forum' Where p.type='Conference'")
        render "Finished<br/>"

    }
}
