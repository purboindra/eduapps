import 'package:education_app/data/entities/course_entity.dart';
import 'package:education_app/data/entities/quiz_result_entity.dart';
import 'package:equatable/equatable.dart';

sealed class AchivementState extends Equatable {
  const AchivementState();

  @override
  List<Object> get props => [];
}

final class InitialGetAllAchivementQuizState extends AchivementState {}

final class LoadingGetAllAchivementQuizState extends AchivementState {}

final class SuccessGetAllAchivementQuizState extends AchivementState {
  final List<QuizResultEntity> resultQuiz;
  final CourseEntity detailCourse;

  const SuccessGetAllAchivementQuizState(this.resultQuiz, this.detailCourse);

  @override
  List<Object> get props => [resultQuiz, detailCourse];
}
