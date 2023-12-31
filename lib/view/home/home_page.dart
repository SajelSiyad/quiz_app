import 'package:flutter/material.dart';
import 'package:quiz_app/utils/spacing/space_sizedbox.dart';
import 'package:quiz_app/view/quiz/quiz_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff481450),
      body: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          Center(
            child: Image.asset(
                "assets/images/pngtree-quiz-time-speech-bubble-isolated-design-png-image_6579430 1.png"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QuizPage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff8514E1),
              fixedSize: const Size(180, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "Start Quiz",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Image.asset("assets/images/powered by www.artifitia.com.png"),
          Space.sizedbox23
        ],
      ),
    );
  }
}
