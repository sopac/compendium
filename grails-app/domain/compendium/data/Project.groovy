package compendium.data

class Project {

    String title
    String projectYear
    String type
    String session
    String description
    String category1
    String category2
    String proposedYear
    String startDate
    String endDate
    String scope //National | Regional
    String partnerOrganisation
    String partnerAssistance
    String projectOutput
    String contactDetails
    String keywords
    String reference
    String comments

    //has many countries
    //has many links

    static hasMany = [links: Link, countries: Country]

    static Mapping = {
        id generator: 'increment'

    }

    static constraints = {
        title()
        projectYear()
        type(inList: ["", "Programme", "Cruise", "Workshop", "Activity/Task", "Study", "Event", "Report", "Proposal", "Training", "Meeting", "Project", "Map/Chart", "Mapping", "Seminar", "Imagery",
                "Conference/Forum",
                "Assessment",
                "Equipment",
                "Survey",
                "Technical Review",
                "Technical Assistance",
                "Bulletin/Newsletter",
                "Network",
                "Policy and Governance"
        ].sort())
        session()
        description(maxSize: 1250)
        category1(maxSize: 1250, nullable: true, blank: false)
        category2(maxSize: 1250, nullable: true)
        proposedYear()
        startDate()
        endDate()
        scope(inList: ["", "National", "Regional"])
        partnerOrganisation()
        partnerAssistance(maxSize: 1250)
        projectOutput(maxSize: 1250)
        keywords()
        contactDetails(maxSize: 1250)
        reference(maxSize: 1250)
        comments(maxSize: 1250)
        links(nullable: true)
        countries(nullable: true)
    }

    static searchable = true

    String toString() {
        title
    }
}
