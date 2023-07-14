import 'package:flutter/foundation.dart';

class AuthModel extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLogin {
    return _isLoggedIn;
  }

  void loginSuccess() {
    _isLoggedIn = true;
    notifyListeners();
  }
}

