import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget(
      {super.key,
      required this.question,
      required this.questionnumber,
      this.color});

  final String questionnumber;
  final String question;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color,
          border: Border.all(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(15)),
      child: Text(
        "$questionnumber $question",
        style: const TextStyle(
            color: Colors.white, fontSize: 23, fontWeight: FontWeight.w300),
      ),
    );
  }
}
