package compendium.data

class TypeController {

    def index = {
        [types: Project.executeQuery('select distinct p.type from Project p order by p.type')]
    }

    def list = {
        String type1 = params.type
        //params.max = Math.min(params.max ? params.int('max') : 15, 100)

        def instance = Project.findAllByType(type1, [sort: 'title'])
        [projectInstanceList: instance, projectInstanceTotal: instance.size(), type: type1]
    }
}
