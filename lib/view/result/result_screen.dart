import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/providers/provider.dart';
import 'package:quiz_app/utils/colors/app_colors.dart';
import 'package:quiz_app/utils/spacing/space_sizedbox.dart';
import 'package:quiz_app/view/home/home_page.dart';
import 'package:quiz_app/view/quiz/quiz_page.dart';

class ResultPage extends ConsumerWidget {
  const ResultPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int persentage =
        ((ref.watch(correctAnswerCount) / ref.watch(totalNumberofQestion)) *
                100)
            .toInt();

    return Scaffold(
      backgroundColor: AppColors.scaffolBgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 42),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/congrats 1.png"),
                  const SizedBox(height: 8),
                  Text(
                    "$persentage% Score",
                    style: TextStyle(
                      fontSize: 24,
                      color: persentage > 50
                          ? AppColors.greenColor
                          : AppColors.redColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text("Quiz completed successfully..!"),
                  Space.sizedbox8,
                  SizedBox(
                    width: 200,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "You attempt ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                              text:
                                  "${ref.watch(totalNumberofQestion)} Questions",
                              style:
                                  const TextStyle(color: AppColors.redColor)),
                          const TextSpan(text: " and from that "),
                          TextSpan(
                              text: "${ref.watch(correctAnswerCount)} answer",
                              style:
                                  const TextStyle(color: AppColors.greenColor)),
                          const TextSpan(text: " is correct."),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Space.sizedbox30,
            ElevatedButton(
              onPressed: () {
                // reseting all the provider for fresh start
                ref.invalidate(isOptionSelectedProvider);
                ref.invalidate(selectedButtonIndex);
                ref.invalidate(questionIndex);
                ref.invalidate(timerProvider);
                ref.invalidate(correctAnswerCount);
                ref.invalidate(totalNumberofQestion);

                persentage > 50
                    ? Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                        (route) => false)
                    : Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuizPage()),
                        (route) => false);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                foregroundColor: Colors.white,
                backgroundColor: persentage > 50 ? Colors.green : Colors.red,
              ),
              child: Text(persentage > 50 ? "Back..!" : "Try Again..!"),
            ),
          ],
        ),
      ),
    );
  }
}
