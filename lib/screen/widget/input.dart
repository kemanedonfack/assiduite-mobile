import 'package:assiduite/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/utilisateurProvider.dart';

class InputWidget extends StatelessWidget {
  final String label;
  final TextInputType inputType;
  final TextEditingController controller;
  final IconData iconData;
  final String? provider;
  const InputWidget(this.label, this.inputType, this.controller, this.iconData,
      [this.provider]);

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<UtilisateurProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          enabled: inputType == TextInputType.datetime ? false : true,
          minLines: inputType == TextInputType.multiline ? 3 : 1,
          maxLines: inputType == TextInputType.multiline ? 7 : 1,
          obscureText: inputType == TextInputType.visiblePassword
              ? loginProvider.hidemdp
              : false,
          keyboardType: inputType,
          decoration: InputDecoration(
            prefixIcon: inputType == TextInputType.multiline
                ? null
                : Icon(
                    iconData,
                    color: Theme.of(context).primaryColor,
                  ),
            suffixIcon: inputType == TextInputType.visiblePassword
                ? InkWell(
                    onTap: () {
                      loginProvider.tooglePassword();
                    },
                    child: Icon(
                      loginProvider.hidemdp
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : null,
            hintText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.all(20),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.2),
          ),
          validator: inputType == TextInputType.emailAddress
              ? (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre $label';
                  } else if (Regexemail.hasMatch(controller.text)) {
                    return null;
                  } else {
                    return "Veuillez entrer un $label valide";
                  }
                }
              : (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre $label';
                  } else {
                    return null;
                  }
                },
        ),
      ],
    );
  }
}
