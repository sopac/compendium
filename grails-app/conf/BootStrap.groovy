import compendium.data.Link
import compendium.data.UserAccount

class BootStrap {

    def init = { servletContext ->
        if (UserAccount.list().size() == 0) {
            println "Saving UserAccount..."
            UserAccount u = new UserAccount()
            u.setRealName("Sachindra Singh")
            u.setUserName("sachindra@sopac.org")
            u.setPassword("123")
            u.setAdministrator(true)
            u.save(flush: true, failOnError: true)
        }
        Link.list().each {
            if (it.type == null) it.type = "Report"
            if (it.url != null)
                it.url = it.url.replace("http://dev.sopac.org.fj/VirLib/", "")
            it.save(flush: true)
        }

    }
    def destroy = {
    }
}
