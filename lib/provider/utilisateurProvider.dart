import 'package:assiduite/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/utilisateur_controller.dart';

class UtilisateurProvider extends ChangeNotifier {
  final UtilisateurController _controller = UtilisateurController();
  bool isloading = false;
  bool hidemdp = true;
  String prenom = "";

  tooglePassword() {
    hidemdp = !hidemdp;
    notifyListeners();
  }

  Future<void> login(email, mdp, context) async {
    final prefs = await SharedPreferences.getInstance();
    isloading = true;
    notifyListeners();
    final response = await _controller.login(email, mdp);
    print(response);
    prenom = prefs.getString("prenom").toString();
    isloading = false;
    notifyListeners();

    if (response == "success") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}
