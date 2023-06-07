import 'package:flutter/foundation.dart';

import '../controller/assiduite_controller.dart';

class AssiduiteProvider extends ChangeNotifier {
  bool isFinding = false;
  bool isScaning = true;
  String result = "";

  AssiduiteController _controller = AssiduiteController();

  Future<void> marquerPresent(String matricule) async {
    isFinding = true;
    result = "";
    notifyListeners();
    final response = await _controller.present(matricule);

    print("Result $response");
    result = response;
    isFinding = false;
    notifyListeners();
  }

  Future<void> initDay() async {
    await _controller.initDay();
  }

  toogleScan() {
    isScaning = !isScaning;
    notifyListeners();
  }
}
