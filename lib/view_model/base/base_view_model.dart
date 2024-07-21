import 'package:demo_app/core/enums/view_state_enum.dart';
import 'package:flutter/material.dart';

class BaseViewModel with ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void update() {
    notifyListeners();
  }
}
