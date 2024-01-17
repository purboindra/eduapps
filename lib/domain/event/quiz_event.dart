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
