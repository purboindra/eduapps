import 'package:education_app/app/route/route_name.dart';
import 'package:education_app/app/utils/app_snackbar.dart';
import 'package:education_app/app/utils/colors.dart';
import 'package:education_app/app/utils/extension.dart';
import 'package:education_app/app/utils/text_style.dart';
import 'package:education_app/app/widgets/custom_button_widget.dart';
import 'package:education_app/data/entities/quiz_result_entity.dart';
import 'package:education_app/domain/bloc/quiz_bloc.dart';
import 'package:education_app/domain/cubit/quiz_cubit.dart';
import 'package:education_app/domain/state/quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    super.key,
    required this.courseTitle,
  });

  final String courseTitle;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int selectedIndex = 99;

  List<int> selectedIndexs = [];
  List<QuizResultEntity> userAnswers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.courseTitle} Quiz",
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<QuizBloc, QuizState>(
          listener: (context, state) async {
            if (state is SuccessGetAllQuiz) {
              final temp = List<int>.filled(state.allQuiz.length, 99);
              selectedIndexs.addAll(temp);

              setState(() {});
            }
          },
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
                      "Maaf, tidak ada quiz untuk kursus ini...",
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
                            // OPTIONS ANSWER
                            Column(
                              children: List.generate(
                                quiz.options!.length,
                                (idx) => Row(
                                  children: [
                                    5.w,
                                    Expanded(
                                      child: InkWell(
                                        onTap: selectedIndexs[index] != 99
                                            ? null
                                            : () {
                                                selectedIndexs[index] = idx;
                                                final body = QuizResultEntity(
                                                  courseId: quiz.courseId,
                                                  isCorrect: quiz.options![idx]
                                                          .toLowerCase()
                                                          .replaceAll(
                                                              '"', "") ==
                                                      quiz.correctAnswer!
                                                          .toLowerCase(),
                                                  question: quiz.question,
                                                  questionId: quiz.quizId,
                                                  score: quiz.options![idx]
                                                              .toLowerCase()
                                                              .replaceAll(
                                                                  '"', "") ==
                                                          quiz.correctAnswer!
                                                              .toLowerCase()
                                                      ? 20
                                                      : 0,
                                                );
                                                userAnswers.add(body);
                                                setState(() {});
                                              },
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          decoration: BoxDecoration(
                                            color: _buildColorOptions(
                                              correctAnswer:
                                                  quiz.correctAnswer!,
                                              indexOption: idx,
                                              indexQuiz: index,
                                              options: quiz.options!,
                                              selectedIndexContainer:
                                                  selectedIndexs,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: _buildColorOptions(
                                                correctAnswer:
                                                    quiz.correctAnswer!,
                                                indexOption: idx,
                                                indexQuiz: index,
                                                options: quiz.options!,
                                                selectedIndexContainer:
                                                    selectedIndexs,
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            quiz.options![idx]
                                                .replaceAll('"', ''),
                                            style: AppTextStyle.subTitleTextStyle.copyWith(
                                                color: quiz.options![idx]
                                                                    .toLowerCase()
                                                                    .replaceAll(
                                                                        '"', "") ==
                                                                quiz.correctAnswer!
                                                                    .toLowerCase() &&
                                                            selectedIndexs[index] !=
                                                                99 ||
                                                        quiz.options![idx]
                                                                    .toLowerCase()
                                                                    .replaceAll(
                                                                        '"',
                                                                        "") !=
                                                                quiz.correctAnswer!
                                                                    .toLowerCase() &&
                                                            selectedIndexs[index] !=
                                                                99
                                                    ? AppColors.primaryWhiteColor
                                                    : AppColors.primaryBlackColor),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    )),
                    20.h,
                    BlocConsumer<QuizCubit, QuizState>(
                      listener: (context, st) async {
                        if (st is SuccessSubmitQuizState) {
                          AppSnakcbar.showSnackbar(context,
                              message: "Anda berhasil mengumpulkan quiz!");
                          await Future.delayed(
                            const Duration(seconds: 1),
                            () => context.pushReplacement(
                              AppRouteName.quizResultScreen,
                            ),
                          );
                        }
                      },
                      builder: (context, st) {
                        return CustomButtonWidget(
                            onPressed:
                                selectedIndexs.any((element) => element == 99)
                                    ? null
                                    : () {
                                        context.read<QuizCubit>().submitQuiz(
                                            userAnswers,
                                            state.allQuiz[0].courseId!);
                                      },
                            title: st is LoadingSubmitQuizState
                                ? "Loading..."
                                : "Submit");
                      },
                    ),
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

  Color _buildColorOptions(
      {required List<String> options,
      required String correctAnswer,
      required List<int> selectedIndexContainer,
      required int indexQuiz,
      required int indexOption}) {
    if (options[indexOption].toLowerCase().replaceAll('"', "") ==
                correctAnswer.toLowerCase() &&
            selectedIndexs[indexQuiz] == indexOption ||
        options[indexOption].toLowerCase().replaceAll('"', "") ==
                correctAnswer.toLowerCase() &&
            selectedIndexs[indexQuiz] != indexOption &&
            selectedIndexs[indexQuiz] != 99) {
      return AppColors.correctAnswerColor;
    } else if (options[indexOption].toLowerCase().replaceAll('"', "") !=
            correctAnswer.toLowerCase() &&
        selectedIndexs[indexQuiz] == indexOption) {
      return AppColors.wrongAnswerColor;
    } else if (selectedIndexs[indexQuiz] != 99) {
      return AppColors.primaryGreyColor;
    }
    return AppColors.primaryWhiteColor;
  }
}
