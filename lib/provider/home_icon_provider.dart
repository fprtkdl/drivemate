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
      case 'door':
        _doorState = !_doorState;
      case 'window':
        _windowState = !_windowState;
      case 'warring':
        _warringState = !_warringState;
    }

    notifyListeners();
  }
}

// changePowerState() {
//   _powerState = !_powerState;
//   notifyListeners();
// }
//
// changeDoorState() {
//   _doorState = !_doorState;
//   notifyListeners();
// }
//
// changeWindowState() {
//   _windowState = !_windowState;
//   notifyListeners();
// }