import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/providers/api_provider.dart';
import 'package:quiz_app/providers/provider.dart';
import 'package:quiz_app/utils/spacing/space_sizedbox.dart';
import 'package:quiz_app/view/quiz/widgets/widgets.dart';

class QuizPage extends ConsumerStatefulWidget {
  const QuizPage({super.key});

  @override
  ConsumerState<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends ConsumerState<QuizPage> {
  int _time = 60;
  Timer? _timer;
  void startTimer() async {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_time == 0) {
        _timer!.cancel();
      } else {
        setState(() {
          _time -= 1;
        });
      }
    });
  }

  void puaseTimer() {
    _timer!.cancel();
  }

  void restartTimer() {
    _time = 60;
    startTimer();
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff481450),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ref.watch(getDataProvider).when(
            data: (data) {
              if (data == null) {
                return const Center(
                  child: Text("Somthing Went Wrong"),
                );
              }

              final qnIndex = ref.watch(questionIndex);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      RotatedBox(
                        quarterTurns: 2,
                        child: LinearProgressIndicator(
                          backgroundColor: const Color(0xff6C2677),
                          value: ((60 - _time) / 60),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            _time < 11 ? Colors.red : const Color(0xffC353D6),
                          ),
                          minHeight: 35,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "$_time",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    data[qnIndex].question,
                    style: const TextStyle(color: Colors.white, fontSize: 26),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: data[qnIndex].options.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: ref.watch(isOptionSelectedProvider) || _time == 0
                            ? null
                            : () {
                                ref
                                    .read(isOptionSelectedProvider.notifier)
                                    .state = true;
                                ref.read(selectedButtonIndex.notifier).state =
                                    index;
                                puaseTimer();
                              },
                        child: ContainerWidget(
                          question: data[qnIndex].options[index].text,
                          questionnumber: "${index + 1}. ",
                          color:
                              ref.read(isOptionSelectedProvider) || _time == 0
                                  ? data[qnIndex].options[index].isCorrect
                                      ? Colors.green
                                      : ref.watch(selectedButtonIndex) == index
                                          ? Colors.red
                                          : null
                                  : null,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Space.sizedbox23;
                    },
                  ),
                  Space.sizedbox23,
                  if (ref.watch(isOptionSelectedProvider) || _time == 0)
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (qnIndex < data.length - 1) {
                            ref.read(questionIndex.notifier).state += 1;
                            // reseting providers
                            ref.invalidate(isOptionSelectedProvider);
                            ref.invalidate(selectedButtonIndex);
                            restartTimer();
                          } else {
                            // navigate to congrates screen
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(170, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "Next",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                ],
              );
            },
            error: (error, stackTrace) {
              return Center(
                child: Text("Error Occured : $error"),
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
