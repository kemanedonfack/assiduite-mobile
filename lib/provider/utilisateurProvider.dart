import 'package:flutter/material.dart';

class UtilisateurProvider extends ChangeNotifier {
  bool hideMatricule = true;
  Future<void> loginUser(email, matricule) async {}
  tooglePassword() {
    hideMatricule = !hideMatricule;
    notifyListeners();
  }
  // final UtilisateurController _controller = UtilisateurController();
  // bool isloading = false;
  // bool isloadingotp = false;
  // String getOperateur(String phoneNumber) {
  //   if (Regexorangemoney.hasMatch(phoneNumber)) {
  //     return "ORANGE";
  //   } else if (Regexmtnmoney.hasMatch(phoneNumber)) {
  //     return "MTN";
  //   } else {
  //     return "INCONNU";
  //   }
  // }

  // Future<void> createUser(phoneNumber, username, context) async {
  //   isloading = true;
  //   notifyListeners();
  //   final response = await _controller.createUser(
  //     phoneNumber,
  //     getOperateur(phoneNumber),
  //     username,
  //   );
  //   print(response);
  //   isloading = false;
  //   notifyListeners();

  //   if (response == "success") {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => OPTScreen(
  //                   number: phoneNumber,
  //                 )));
  //   }
  // }
}
