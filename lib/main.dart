import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/utilisateurProvider.dart';
import 'screen/absence.dart';
import 'screen/home.dart';
import 'screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: const Color.fromRGBO(136, 14, 79, .1),
      100: const Color.fromRGBO(136, 14, 79, .2),
      200: const Color.fromRGBO(136, 14, 79, .3),
      300: const Color.fromRGBO(136, 14, 79, .4),
      400: const Color.fromRGBO(136, 14, 79, .5),
      500: const Color.fromRGBO(136, 14, 79, .6),
      600: const Color.fromRGBO(136, 14, 79, .7),
      700: const Color.fromRGBO(136, 14, 79, .8),
      800: const Color.fromRGBO(136, 14, 79, .9),
      900: const Color.fromRGBO(136, 14, 79, 1),
    };

    MaterialColor primary = MaterialColor(0xFF33A944, color);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UtilisateurProvider()),
      ],
      child: MaterialApp(
        title: 'Assiduité',
        theme: ThemeData(
          fontFamily: 'Gilroy',
          primarySwatch: primary,
        ),
        home: LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
