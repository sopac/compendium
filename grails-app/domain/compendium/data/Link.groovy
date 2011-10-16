package compendium.data

class Link {

  String title
  String url
  String type

  //static belongsTo = [project: Project]
  //documents - upload
  //imagery - uuid - http://geonetwork.sopac.org/geonetwork/srv/en/iso19139.xml?uuid=0741a46e-9f7f-4e61-9a98-73ac6e39c6d6
                     //http://geonetwork.sopac.org/geonetwork/srv/en/main.home?uuid=6ecbfd5f-b706-4444-8528-5e2903c5a73b

   static constraints = {
    title(nullable: true)
    type(inList:['Report', 'Imagery', 'Document'], maxSize:20)
    url(nullable: true, maxSize:1250)
  }

  String toString() {
    if (title.toString().trim().equals("") || title == null) {
      "(" + type + ") " + url
    } else {
      "(" + type + ") "+ title
    }
  }

}
