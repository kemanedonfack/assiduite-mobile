import 'package:assiduite/screen/widget/input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/utilisateurProvider.dart';
import 'request.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController matriculeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final loginProvider = Provider.of<UtilisateurProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: size.height),
            child: IntrinsicHeight(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    height: size.height * 0.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 25,
                            ),
                            Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 25,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Hi ${loginProvider.prenom}",
                          style: TextStyle(
                            fontSize: size.width * 0.06,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Good Morning",
                          style: TextStyle(
                            fontSize: size.width * 0.08,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.2),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 30),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RequestScreen()));
                              },
                              child: _buildCircleIcon(
                                  Icons.attach_email_outlined,
                                  "Requêtes",
                                  context,
                                  Colors.red),
                            ),
                            _buildCircleIcon(Icons.qr_code_scanner, "Scanner",
                                context, Colors.blue),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildCircleIcon(Icons.list_alt_outlined,
                                "Absences", context, Colors.blue),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircleIcon(IconData iconData, String text, context, color) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width / 4,
          height: size.width / 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            iconData,
            size: 60,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
