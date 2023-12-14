import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/providers/provider.dart';
import 'package:quiz_app/utils/spacing/space_sizedbox.dart';
import 'package:quiz_app/view/home/home_widgets/widgets.dart';

class QuizPage extends ConsumerWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xff481450),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LinearProgressIndicator(
                backgroundColor: Color(0xffC353D6),
                value: 0.6,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xff6C2677),
                ),
                minHeight: 35,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Which Plant in our system is known as the red plant?",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              const SizedBox(
                height: 30,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        ref.read(optionProvider.notifier).state = true;
                      },
                      child: ContainerWidget(
                        question: "Alexander Flaming",
                        questionnumber: "${index + 1}. ",
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Space.sizedbox23;
                  },
                  itemCount: 4),
              Space.sizedbox23,
              if (ref.watch(optionProvider))
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(170, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "Next",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
