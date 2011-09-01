package compendium.data

class Log {

    String name
    String type //create, update, login
    String project
    Date timeStamp = new Date()

    static constraints = {
        name()
        type()
        project()
        timeStamp()
    }
}
