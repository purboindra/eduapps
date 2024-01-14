import 'package:education_app/data/entities/course_entity.dart';
import 'package:education_app/domain/event/introduction_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseProgrammingCubit extends Cubit<ChooseProgrammingLanguageEvent> {
  ChooseProgrammingCubit()
      : super(ChooseProgrammingLanguageEvent(const <CourseEntity>[]));

  List<CourseEntity> tempCourse = [];

  void chooseProgrammingLanguage(CourseEntity courseEntity) {
    tempCourse.add(courseEntity);
    emit(ChooseProgrammingLanguageEvent(tempCourse.toList()));
  }

  void removeProgrammingLanguage(CourseEntity courseEntity) {
    tempCourse.remove(courseEntity);
    emit(ChooseProgrammingLanguageEvent(tempCourse.toList()));
  }
}
