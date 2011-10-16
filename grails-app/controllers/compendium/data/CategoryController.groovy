package compendium.data

class CategoryController {

    def index = {
    }

    def list = {
        String category = params.category
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        def instance = Project.findAllByCategory1(category, [sort: params.sort, order: params.order])
        [projectInstanceList: instance, projectInstanceTotal: instance.size(), category: category]
    }


}
