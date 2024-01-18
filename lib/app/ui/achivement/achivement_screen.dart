import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:education_app/app/route/route_name.dart';
import 'package:education_app/app/utils/colors.dart';
import 'package:education_app/app/utils/extension.dart';
import 'package:education_app/app/utils/text_style.dart';
import 'package:education_app/domain/bloc/achivement_bloc.dart';
import 'package:education_app/domain/bloc/auth_bloc.dart';
import 'package:education_app/domain/event/achivement_event.dart';
import 'package:education_app/domain/state/achivement_state.dart';
import 'package:education_app/domain/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AchievementScreen extends StatefulWidget {
  const AchievementScreen({super.key});

  @override
  State<AchievementScreen> createState() => _AchievementScreenState();
}

class _AchievementScreenState extends State<AchievementScreen> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);

  @override
  void initState() {
    final authState = context.read<AuthBloc>().state;
    if (authState is SuccessGetCurrentUserState) {
      context.read<AchivementBloc>().add(const GetAllAchivementQuizEvent(3));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = context.watch<AuthBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Achievement",
          style: AppTextStyle.subTitleTextStyle.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: ListView(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.blackColor4,
                  ),
                ),
                child: Center(
                  child: Row(
                    children: [
                      BlocBuilder<AchivementBloc, AchivementState>(
                        builder: (context, state) {
                          if (state is LoadingGetAllAchivementQuizState) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          } else if (state
                              is SuccessGetAllAchivementQuizState) {
                            return DashedCircularProgressBar(
                              width: 100,
                              height: 100,
                              backgroundColor: AppColors.primaryGreyColor,
                              foregroundColor: AppColors.progressColor,
                              corners: StrokeCap.butt,
                              valueNotifier: _valueNotifier,
                              progress: 2,
                              maxProgress: 3,
                              foregroundStrokeWidth: 15,
                              backgroundStrokeWidth: 15,
                              child: Center(
                                child: ValueListenableBuilder(
                                  valueListenable: _valueNotifier,
                                  builder: (_, double value, __) => Text(
                                    '${(state.resultQuiz.length / (authBloc is SuccessGetCurrentUserState ? authBloc.user.userMetadata!["courses"].length : 0) * 100).toInt()}%',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 24),
                                  ),
                                ),
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                      10.w,
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Achievement",
                              style: AppTextStyle.subTitleTextStyle,
                            ),
                            Text(
                              "Great job! Complete your achievements now",
                              style: AppTextStyle.commonTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              10.h,
              BlocBuilder<AchivementBloc, AchivementState>(
                buildWhen: (previous, current) {
                  return previous != current &&
                      current is SuccessGetAllAchivementQuizState;
                },
                builder: (context, state) {
                  if (state is LoadingGetAllAchivementQuizState) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
                  } else if (state is SuccessGetAllAchivementQuizState) {
                    return Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.resultQuiz.length,
                          itemBuilder: (context, index) {
                            final course = state.resultQuiz[index];
                            return Card(
                              child: InkWell(
                                onTap: () async => await context.push(
                                    AppRouteName.quizResultScreen,
                                    extra: {"course_id": course.courseId}),
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 17,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                course.courseImage!),
                                          ),
                                        ),
                                      ),
                                      5.w,
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              course.courseTitle!,
                                              style: AppTextStyle
                                                  .subTitleTextStyle
                                                  .copyWith(
                                                color:
                                                    AppColors.primaryBlackColor,
                                              ),
                                            ),
                                            3.h,
                                            Text(
                                              "You have completed this quiz with score: ${course.totalScore}",
                                              style: AppTextStyle
                                                  .commonTextStyle
                                                  .copyWith(
                                                color:
                                                    AppColors.primaryBlackColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: Text("Terjadi Kesalahan..."),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
