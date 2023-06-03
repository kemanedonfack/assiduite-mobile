import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'widget/input.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  final formKey = GlobalKey<FormState>();

  // controller
  TextEditingController matriculeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  static List<String> listTypePoste = [
    "Emploi",
    "Stage Académique",
    "Stage Professionnel"
  ];
  String typePoste = listTypePoste[0];

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_circle_left_outlined)),
        title: const Text(
          "Justification",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          RotatedBox(
            quarterTurns: 1,
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.attach_file)),
          )
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      InputWidget("Matricule", TextInputType.name,
                          matriculeController, Icons.person),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      InkWell(
                        onTap: () {
                          pickDate();
                        },
                        child: InputWidget(
                            "Date à Justifier",
                            TextInputType.datetime,
                            dateController,
                            Icons.date_range_rounded),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      InputWidget("Description", TextInputType.multiline,
                          messageController, Icons.person),
                      SizedBox(height: size.height * 0.04),
                      Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Theme.of(context).primaryColor,
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {}
                          },
                          child: const Text(
                            "Envoyer",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                    ],
                  ))
            ],
          ),
        )),
      ),
    );
  }

  Future<void> pickDate() async {
    DateTime? choix = DateTime.now();
    choix = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2024),
        initialDatePickerMode: DatePickerMode.day);

    var format = DateFormat('yyyy-MM-dd');
    if (choix != null) {
      setState(() {
        dateController.text = format.format(choix!).toString();
      });
    }
  }

  Future<void> info(String message) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            title: const Text("Info"),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              )
            ],
          );
        });
  }
}
