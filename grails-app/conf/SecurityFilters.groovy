class SecurityFilters {
  def filters = {
    deleteCheck(controller: '*', action: 'delete') {
      before = {
        if (session.user == null) {
          redirect(controller: 'login', action: 'index')
          return false
        }
      }
    }
    saveCheck(controller: '*', action: 'save') {
      before = {
        if (session.user == null) {
          redirect(controller: 'login', action: 'index')
          return false
        }
      }
    }
    updateCheck(controller: '*', action: 'update') {
      before = {
        if (session.user == null) {
          redirect(controller: 'login', action: 'index')
          return false
        }
      }
    }
    updateCheck(controller: '*', action: 'edit') {
      before = {
        if (session.user == null) {
          redirect(controller: 'login', action: 'index')
          return false
        }
      }
    }    
    createCheck(controller: '*', action: 'create') {
      before = {
        if (session.user == null) {
          redirect(controller: 'login', action: 'index')
          return false
        }
      }
    }
  }
}