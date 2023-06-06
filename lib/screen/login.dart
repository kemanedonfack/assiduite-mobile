import 'package:assiduite/screen/home.dart';
import 'package:assiduite/screen/widget/input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/utilisateurProvider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController mdpController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final loginProvider = Provider.of<UtilisateurProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: size.height),
          child: IntrinsicHeight(
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: size.height * 0.35,
                  child: Image.asset(
                    "assets/images/banner.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Bienvenue!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30)),
                        SizedBox(height: size.height * 0.03),
                        InputWidget("Email MyIUC", TextInputType.emailAddress,
                            emailController, Icons.email),
                        SizedBox(height: size.height * 0.03),
                        InputWidget(
                            "Mot de passe",
                            TextInputType.visiblePassword,
                            mdpController,
                            Icons.lock),
                        SizedBox(height: size.height * 0.05),
                        loginProvider.isloading
                            ? Material(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor,
                                child: MaterialButton(
                                  minWidth: MediaQuery.of(context).size.width,
                                  onPressed: () {},
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : Material(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor,
                                child: MaterialButton(
                                  minWidth: MediaQuery.of(context).size.width,
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      await loginProvider.login(
                                          emailController.text,
                                          mdpController.text,
                                          context);
                                    }
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             HomeScreen()));
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 18),
                                    child: Text(
                                      "Connexion",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
