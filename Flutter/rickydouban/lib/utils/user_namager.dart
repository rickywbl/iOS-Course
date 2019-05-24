
class UserManager {

  var islogin;

  factory UserManager() => _getInstance();
  static UserManager get instance => _getInstance();
  static UserManager _instance;
  UserManager._internal(){
    islogin = false;
  }

  static UserManager _getInstance () {
    if ( _instance == null){
      _instance = new UserManager._internal();
    }
    return _instance;
  }

}