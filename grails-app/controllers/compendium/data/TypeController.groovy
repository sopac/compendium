package compendium.data

class TypeController {

  def index = {
    [types: Project.executeQuery('select distinct p.type from Project p ')]
  }

  def list = {
    String type = params.type
    params.max = Math.min(params.max ? params.int('max') : 15, 100)
    def instance = Project.findAllWhere(type: type)
    [projectInstanceList: instance, projectInstanceTotal: instance.size(), type:type]
  }
}
