package compendium.data

class Country {

    String name
    String code
    String membership

    static belongsTo = Project
    static hasMany = [projects: Project]

    static constraints = {
        name()
        code()
        membership()
    }


    String toString() {
        name
    }
}
