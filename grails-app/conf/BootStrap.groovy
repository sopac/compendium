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
  }
  def destroy = {
  }
}
