import 'package:equatable/equatable.dart';

sealed class AchivementEvent extends Equatable {
  const AchivementEvent();

  @override
  List<Object> get props => [];
}

final class GetAllAchivementQuizEvent extends AchivementEvent {
  final int courseId;

  const GetAllAchivementQuizEvent(this.courseId);

  @override
  List<Object> get props => [courseId];
}

final class GetAllDetailCourseEvent extends AchivementEvent {
  final List<int> courseIds;

  const GetAllDetailCourseEvent(this.courseIds);

  @override
  List<Object> get props => [courseIds];
}
