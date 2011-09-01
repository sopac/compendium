package compendium.data

class Link {

  String title
  String url

  //static belongsTo = [project: Project]

  static constraints = {
    title(nullable: true)
    url(nullable: true)
  }

  String toString() {
    if (title.toString().trim().equals("") || title == null) {
      url
    } else {
      title
    }
  }

}
