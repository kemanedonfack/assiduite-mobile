import 'package:assiduite/screen/home.dart';
import 'package:flutter/material.dart';

import '../controller/utilisateur_controller.dart';

class UtilisateurProvider extends ChangeNotifier {
  final UtilisateurController _controller = UtilisateurController();
  bool isloading = false;
  bool hidemdp = true;

  tooglePassword() {
    hidemdp = !hidemdp;
    notifyListeners();
  }

  Future<void> login(email, mdp, context) async {
    isloading = true;
    notifyListeners();
    final response = await _controller.login(email, mdp);
    print(response);
    isloading = false;
    notifyListeners();

    if (response == "success") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen()));
    }
  }
}
