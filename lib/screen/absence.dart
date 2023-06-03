import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'widget/input.dart';

class AbsenceScreen extends StatefulWidget {
  const AbsenceScreen({super.key});

  @override
  State<AbsenceScreen> createState() => _AbsenceScreenState();
}

class _AbsenceScreenState extends State<AbsenceScreen> {
  TextEditingController dateController = TextEditingController();

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
          "Absences",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: size.width / 1.4,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    pickDate();
                  },
                  child: InputWidget("Filtre", TextInputType.datetime,
                      dateController, Icons.date_range_rounded),
                ),
              ),
              Material(
                borderRadius: BorderRadius.circular(10.0),
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: MaterialButton(
                    onPressed: () {},
                    child:
                        const Icon(Icons.search, size: 35, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ],
      )),
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

  Widget getForm(String label, TextEditingController controller,
      [bool enable = true]) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 20,
      child: TextFormField(
        controller: controller,
        enabled: enable,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.calendar_month),
          hintText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.all(20),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.2),
        ),
      ),
    );
  }
}
