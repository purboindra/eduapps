import 'package:education_app/app/route/route_name.dart';
import 'package:education_app/app/utils/colors.dart';
import 'package:education_app/app/utils/extension.dart';
import 'package:education_app/app/utils/text_style.dart';
import 'package:education_app/app/widgets/custom_button_widget.dart';
import 'package:education_app/domain/bloc/introduction_bloc.dart';
import 'package:education_app/domain/cubit/choose_programming_cubit.dart';
import 'package:education_app/domain/event/introduction_event.dart';
import 'package:education_app/domain/state/introduction_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  @override
  void initState() {
    context.read<IntroductionBloc>().add(GetAllCourseEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final programmingLanguageCourses =
        context.watch<ChooseProgrammingCubit>().state;
    return BlocConsumer<IntroductionBloc, IntroductionState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoadingGetAllCourseState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }
        if (state is SuccessGetAllCourseState) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Please choose at least 2 programming language",
                      style: AppTextStyle.titleTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    20.h,
                    Wrap(
                      children: List.generate(state.allCourses.length, (index) {
                        return Container(
                          margin: const EdgeInsets.all(3),
                          child: InkWell(
                            onTap: programmingLanguageCourses.course
                                    .contains(state.allCourses[index])
                                ? null
                                : () {
                                    context
                                        .read<ChooseProgrammingCubit>()
                                        .chooseProgrammingLanguage(
                                            state.allCourses[index]);
                                  },
                            child: Ink(
                              color: AppColors.primaryWhiteColor,
                              child: Chip(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                labelPadding: const EdgeInsets.all(3),
                                side: programmingLanguageCourses.course
                                        .contains(state.allCourses[index])
                                    ? null
                                    : const BorderSide(
                                        color: AppColors.secondaryBlueColor,
                                        width: 2,
                                      ),
                                color: MaterialStatePropertyAll(
                                    programmingLanguageCourses.course
                                            .contains(state.allCourses[index])
                                        ? AppColors.primaryGreyColor
                                        : AppColors.primaryColor),
                                labelStyle:
                                    AppTextStyle.subTitleTextStyle.copyWith(
                                  color: AppColors.primaryWhiteColor,
                                ),
                                label: Text(state.allCourses[index].title!),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    20.h,
                    BlocBuilder<ChooseProgrammingCubit,
                        ChooseProgrammingLanguageEvent>(
                      builder: (context, state) {
                        if (state.course.isNotEmpty) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Programming language you are interested in",
                                style: AppTextStyle.subTitleTextStyle,
                              ),
                              Wrap(
                                children:
                                    List.generate(state.course.length, (index) {
                                  return Container(
                                    margin: const EdgeInsets.all(3),
                                    child: Chip(
                                      deleteIcon: const Icon(
                                        Icons.cancel,
                                        color: AppColors.primaryWhiteColor,
                                      ),
                                      onDeleted: () {
                                        context
                                            .read<ChooseProgrammingCubit>()
                                            .removeProgrammingLanguage(
                                                state.course[index]);
                                      },
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      labelPadding: const EdgeInsets.all(3),
                                      side: const BorderSide(
                                        color: AppColors.secondaryBlueColor,
                                        width: 2,
                                      ),
                                      color: const MaterialStatePropertyAll(
                                          AppColors.primaryColor),
                                      labelStyle: AppTextStyle.subTitleTextStyle
                                          .copyWith(
                                        color: AppColors.primaryWhiteColor,
                                      ),
                                      label: Text(state.course[index].title!),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                    15.h,
                    const Spacer(),
                    CustomButtonWidget(
                      onPressed: programmingLanguageCourses.course.length < 2
                          ? null
                          : () {
                              List<int> data = [];
                              for (final course
                                  in programmingLanguageCourses.course) {
                                data.add(course.id!);
                              }
                              context.pushReplacement(AppRouteName.signUpScreen,
                                  extra: {
                                    "courses_id": data,
                                  });
                            },
                      title: "Next",
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const Scaffold(body: Center(child: Text("NO DATA ")));
      },
    );
  }
}
