import 'package:education_app/app/utils/extension.dart';
import 'package:education_app/app/utils/text_style.dart';
import 'package:education_app/domain/bloc/quiz_bloc.dart';
import 'package:education_app/domain/state/quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<QuizBloc, QuizState>(builder: (context, state) {
        if (state is LoadingGetAllQuizResultState) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is SuccessGetAllQuizResultState) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Text(
                        "${state.detailCourse.title}",
                        style: AppTextStyle.titleTextStyle.copyWith(
                          fontSize: 28,
                        ),
                      ),
                      const Text(
                        "Quiz Result",
                        style: AppTextStyle.titleTextStyle,
                      ),
                      20.h,
                      Image.network(
                        state.detailCourse.imageUrl ?? "",
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      10.h,
                      const Text(
                        "Congratulations!",
                        style: AppTextStyle.titleTextStyle,
                      ),
                      5.h,
                      Text(
                        "Your Score: ${state.getResultQuiz.totalScore}",
                        style: AppTextStyle.subTitleTextStyle,
                      ),
                      Text(
                        "${state.getResultQuiz.totalCorrectAnswer} / ${state.getResultQuiz.totalQuestion ?? 1 - 1}",
                        style: AppTextStyle.subTitleTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      }),
    );
  }
}
