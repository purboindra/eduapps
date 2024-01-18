import 'package:education_app/app/utils/app_print.dart';
import 'package:education_app/domain/bloc/base_bloc.dart';
import 'package:education_app/domain/event/achivement_event.dart';
import 'package:education_app/domain/repositories/achivement_repository.dart';
import 'package:education_app/domain/state/achivement_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AchivementBloc extends BaseBloc<AchivementEvent, AchivementState> {
  AchivementBloc(this.achivementRepository)
      : super(InitialGetAllAchivementQuizState()) {
    on<GetAllAchivementQuizEvent>(_handleGetAllAchivementQuiz);
  }

  void _handleGetAllAchivementQuiz(
      GetAllAchivementQuizEvent event, Emitter<AchivementState> emit) async {
    emit(LoadingGetAllAchivementQuizState());
    try {
      final result = await achivementRepository.getAllCourseQuiz();
      final courseDetail =
          await achivementRepository.getCourseDetail(event.courseId);
      emit(SuccessGetAllAchivementQuizState(result, courseDetail));
    } catch (e, st) {
      AppPrint.erroLog("ERROR FROM GET ALL ACHIVEMENT QUIZ $e", st: st);
    }
  }

  final AchivementRepository achivementRepository;
}
