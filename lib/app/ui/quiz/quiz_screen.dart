import 'package:education_app/app/utils/app_print.dart';
import 'package:education_app/app/utils/colors.dart';
import 'package:education_app/app/utils/extension.dart';
import 'package:education_app/app/utils/text_style.dart';
import 'package:education_app/domain/bloc/quiz_bloc.dart';
import 'package:education_app/domain/state/quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key, required this.courseTitle});

  final String courseTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$courseTitle Quiz",
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<QuizBloc, QuizState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LoadingQuizState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is SuccessGetAllQuiz) {
              if (state.allQuiz.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Sorry, there is no quiz for this course",
                      style: AppTextStyle.titleTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.h,
                    Expanded(
                        child: ListView.builder(
                      itemCount: state.allQuiz.length,
                      itemBuilder: (context, index) {
                        final quiz = state.allQuiz[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                quiz.question!,
                                style: AppTextStyle.titleTextStyle,
                              ),
                            ),
                            10.h,
                            Column(
                              children: [
                                ...quiz.options!.map((e) => Row(
                                      children: [
                                        5.w,
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              AppPrint.debugLog(
                                                  "RADIO VALUE $e");
                                              if (e.toLowerCase() ==
                                                  quiz.correctAnswer!
                                                      .toLowerCase()) {
                                                AppPrint.debugLog("CORRECT");
                                              }
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: AppColors
                                                      .primaryBlackColor,
                                                ),
                                              ),
                                              child: Text(
                                                e.toLowerCase() ==
                                                        quiz.correctAnswer!
                                                            .toLowerCase()
                                                    ? "BENAR"
                                                    : e.replaceAll('"', ''),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              ],
                            ),
                          ],
                        );
                      },
                    ))
                  ],
                ),
              );
            }
            return const Text("ERROR");
          },
        ),
      ),
    );
  }
}
