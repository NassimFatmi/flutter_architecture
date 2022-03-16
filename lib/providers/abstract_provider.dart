import 'package:flutter/material.dart';
import '../models/errors/failure.dart';
import '../models/notifier_state.dart';

// To prevent code duplication (DRY) alors utiliser ce provider
class AbstractProvider with ChangeNotifier {
  NotifierState _state = NotifierState.loading;
  NotifierState get state => _state;

  void setProviderState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  Failure? _failure;
  Failure? get failure => _failure;
  void setProviderFailure(Failure failure) {
    _failure = failure;
    notifyListeners();
  }
}
