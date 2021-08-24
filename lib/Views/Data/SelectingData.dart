import 'package:flutter/widgets.dart';

class SelectingData<T> extends ChangeNotifier {
  bool _isSelectingMode = false;
  List<T> _selections = [];

  bool get isSelectingMode => _isSelectingMode;

  set isSelectingMode(bool select) {
    _isSelectingMode = select;
    notifyListeners();
  }

  bool isSelecting(T element) {
    return _selections.contains(element);
  }

  void add(T element) {
    _selections.add(element);
    notifyListeners();
  }

  void remove(T element) {
    _selections.remove(element);
    notifyListeners();
  }
}
