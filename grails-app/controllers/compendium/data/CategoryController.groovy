package compendium.data

class CategoryController {

  def index = {
  }

  def list = {
    String category = params.category
    def instance = Project.findAllWhere(category1: category)
    [projectInstanceList: instance, projectInstanceTotal: instance.size(), category:category]
  }


}
