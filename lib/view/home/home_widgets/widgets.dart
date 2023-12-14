import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContainerWidget extends StatelessWidget {
  const ContainerWidget(
      {super.key, required this.question, required this.questionnumber});

  final String questionnumber;
  final String question;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Text(
            questionnumber,
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w300),
          ),
          Text(
            question,
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
