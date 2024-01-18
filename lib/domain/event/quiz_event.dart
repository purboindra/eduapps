import 'package:equatable/equatable.dart';

sealed class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

final class GetAllQuizEvent extends QuizEvent {
  final int courseId;

  const GetAllQuizEvent(this.courseId);

  @override
  List<Object> get props => [courseId];
}

final class SubmitQuizEvent extends QuizEvent {
  final List<Map<String, dynamic>> data;

  const SubmitQuizEvent(this.data);

  @override
  List<Object> get props => [data];
}

final class GetAllQuizResultEvent extends QuizEvent {
  final int courseId;

  const GetAllQuizResultEvent(this.courseId);

  @override
  List<Object> get props => [courseId];
}
