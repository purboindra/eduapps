import 'package:education_app/app/utils/app_print.dart';
import 'package:education_app/domain/bloc/base_bloc.dart';
import 'package:education_app/domain/event/course_event.dart';
import 'package:education_app/domain/repositories/home_repository.dart';
import 'package:education_app/domain/state/course_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseBloc extends BaseBloc<CourseEvent, CourseState> {
  CourseBloc(this.homeRepository) : super(const InitialCourseState()) {
    on<CourseEvent>(_handleGetAllCourse);
  }

  void _handleGetAllCourse(CourseEvent event, Emitter<CourseState> emit) async {
    emit(const LoadingGetAllCourseState());
    try {
      final response = await homeRepository.getAllCourse(event.allCourse);
      emit(SuccessGetAllCourseState(response));
    } catch (e) {
      AppPrint.erroLog("ERROR FROM FETCH COURSE $e");
      emit(const InitialCourseState());
    }
  }

  final HomeRepository homeRepository;
}
