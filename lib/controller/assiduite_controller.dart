import 'dart:convert';
import 'package:assiduite/utils/constant.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AssiduiteController {

  Future<String> present(String matricule) async {
    final prefs = await SharedPreferences.getInstance();
    String email = prefs.getString("email").toString();
    String password = prefs.getString("password").toString();

    try {
      String basicAuth =
          'Basic ${base64.encode(utf8.encode('$email:$password'))}';

      final response = await http.get(
          Uri.parse('$BASE_URL/assiduites/present/$matricule'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': basicAuth
          },);
      print(response.body);
      print(response.statusCode);
      switch (response.statusCode) {
        case 500:
          return "error";
        case 200:
          return "success";
        default:
          return "error";
      }
    } catch (e) {
      print("erreur ${e.toString()}");
      return "error";
    }
  }

Future<String> initDay() async {
    final prefs = await SharedPreferences.getInstance();
    String email = prefs.getString("email").toString();
    String password = prefs.getString("password").toString();

    try {
      String basicAuth =
          'Basic ${base64.encode(utf8.encode('$email:$password'))}';

      final response = await http.get(
          Uri.parse('$BASE_URL/assiduites/initday'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': basicAuth
          },);
      print(response.body);
      print(response.statusCode);
      switch (response.statusCode) {
        case 500:
          return "error";
        case 200:
          return "success";
        default:
          return "error";
      }
    } catch (e) {
      print("erreur ${e.toString()}");
      return "error";
    }
  }
}
