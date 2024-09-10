import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.controllerPlayer, required this.label,// required this.validator,
  });

  final String label ;
  // final String? Function(String?) validator ;
  final TextEditingController controllerPlayer;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please Enter Your Name";
        }
        return null;
      },
      controller: controllerPlayer,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
         focusedBorder: border( const Color(0xD28974FF)),
        enabledBorder: border( const Color(0xD28974FF)),
        errorBorder: border( const Color(0xF4F52B2B)),
        focusedErrorBorder: border( const Color(0xF4F51A1A)),
      ),
    );
  }

  OutlineInputBorder border(Color color) {
    return  OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
        ),
      );
  }
}