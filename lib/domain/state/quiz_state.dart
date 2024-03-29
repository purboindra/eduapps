import 'package:education_app/data/entities/course_entity.dart';
import 'package:education_app/data/entities/quiz_entity.dart';
import 'package:education_app/data/entities/quiz_result_entity.dart';
import 'package:equatable/equatable.dart';

sealed class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

final class InitialQuizState extends QuizState {}

final class LoadingQuizState extends QuizState {}

final class LoadingSubmitQuizState extends QuizState {}

final class LoadingGetAllQuizResultState extends QuizState {}

final class SuccessSubmitQuizState extends QuizState {}

final class SuccessGetAllQuiz extends QuizState {
  final List<QuizEntity> allQuiz;

  const SuccessGetAllQuiz(this.allQuiz);

  @override
  List<Object> get props => [allQuiz];
}

final class SuccessGetAllQuizResultState extends QuizState {
  final QuizResultEntity getResultQuiz;
  final CourseEntity detailCourse;

  const SuccessGetAllQuizResultState(this.getResultQuiz, this.detailCourse);

  @override
  List<Object> get props => [getResultQuiz, detailCourse];
}

class SelectedAnswerState extends QuizState {
  final int index;

  const SelectedAnswerState(this.index);

  @override
  List<Object> get props => [index];
}
