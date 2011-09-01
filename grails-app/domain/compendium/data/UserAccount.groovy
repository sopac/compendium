package compendium.data

class UserAccount {

  String realName
  String userName
  String password
  boolean administrator = true

  static constraints = {
    realName(blank: false)
    userName(email: true, unique: true, blank: false)
    password(password: true, blank: false)
    administrator()
  }

  String toString() {
    realName
  }

}
