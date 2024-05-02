class LoginState {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    //create login screen
    print("logged in");
  }

  void logout() {
    _isLoggedIn = false;
    print("logged out");
  }
}
