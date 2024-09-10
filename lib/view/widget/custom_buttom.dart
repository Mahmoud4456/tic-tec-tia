import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    required this.onTap,
    super.key, required this.text,
  });

  final void Function() onTap ;
  final String text ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(text , style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold
        ),
        ),
      ),
    );
  }
}