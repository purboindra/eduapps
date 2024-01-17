import 'package:education_app/app/utils/app_print.dart';
import 'package:education_app/domain/bloc/base_bloc.dart';
import 'package:education_app/domain/event/introduction_event.dart';
import 'package:education_app/domain/repositories/introduction_repository.dart';
import 'package:education_app/domain/state/introduction_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroductionBloc extends BaseBloc<IntroductionEvent, IntroductionState> {
  IntroductionBloc(this.introductionRepository)
      : super(IntroductionInitialState()) {
    on<GetAllCourseEvent>(_handleGetAllCourse);
  }

  void _handleGetAllCourse(
      GetAllCourseEvent event, Emitter<IntroductionState> emit) async {
    emit(LoadingGetAllCourseState());
    try {
      final response = await introductionRepository.getAllCourse();
      emit(SuccessGetAllCourseState(response));
    } catch (e) {
      AppPrint.erroLog("ERROR GET ALL COURSE $e");
      emit(IntroductionInitialState());
    }
  }

  final IntroductionRepository introductionRepository;
}
