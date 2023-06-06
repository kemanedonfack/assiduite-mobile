import 'dart:convert';
import 'package:assiduite/utils/constant.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UtilisateurController {
  Future<String> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    // prefs.setString("phoneNumber", phoneNumber);

    try {
      final response =
          await http.post(Uri.parse('$BASE_URL/utilisateurs/login'),
              headers: {
                'Content-Type': 'application/json',
                // 'Authorization': 'Bearer $token'
              },
              body: jsonEncode({"email": email, "password": password}));
      print(response.body);
      print(response.statusCode);
      switch (response.statusCode) {
        case 500:
          return "error";
        case 200:
          prefs.setString("email", email);
          prefs.setString("password", password);
          prefs.setString("matricule", jsonDecode(response.body)["matricule"]);
          prefs.setString("prenom", jsonDecode(response.body)["prenom"]);
          return "success";
        default:
          return "error";
      }
    } catch (e) {
      print("erreur ${e.toString()}");
      return "error";
    }
  }

  Future<String> checkOTP(otp, userId) async {
    try {
      final response = await http.get(
        Uri.parse('$BASE_URL/users/numero/base/$userId/opt/$otp'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(response.body);
      print(response.statusCode);
      switch (response.statusCode) {
        case 200:
          return "success";
        default:
          return "error";
      }
    } catch (e) {
      print("error ${e.toString()}");
      return "error";
    }
  }
}
