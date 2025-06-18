import 'package:flutter/material.dart';

class HomeIconProvider extends ChangeNotifier {
  bool _powerState = false;
  bool _doorState = false;
  bool _windowState = false;
  bool _warringState = false;

  bool get powerState => _powerState;
  bool get doorState => _doorState;
  bool get windowState => _windowState;
  bool get warringState => _warringState;

  void changeState(String name) {
    switch (name) {
      case 'power':
        _powerState = !_powerState;
        break;
      case 'door':
        _doorState = !_doorState;
        break;
      case 'window':
        _windowState = !_windowState;
        break;
      case 'warring':
        _warringState = !_warringState;
        break;
    }

    notifyListeners();
  }
}