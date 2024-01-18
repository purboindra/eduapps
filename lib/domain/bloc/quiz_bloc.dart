import 'package:education_app/app/utils/app_print.dart';
import 'package:education_app/data/entities/quiz_result_entity.dart';
import 'package:education_app/domain/bloc/base_bloc.dart';
import 'package:education_app/domain/event/quiz_event.dart';
import 'package:education_app/domain/repositories/quiz_repository.dart';
import 'package:education_app/domain/state/quiz_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizBloc extends BaseBloc<QuizEvent, QuizState> {
  QuizBloc(this.quizRepository) : super(InitialQuizState()) {
    on<GetAllQuizEvent>(_handleGetAllQuiz);
    on<GetAllQuizResultEvent>(_handleGetAllResultQuiz);
  }

  void _handleGetAllResultQuiz(
      GetAllQuizResultEvent event, Emitter<QuizState> emit) async {
    emit(LoadingGetAllQuizResultState());
    try {
      await Future.delayed(const Duration(milliseconds: 1500));
      final result = await quizRepository.getQuizResult(event.courseId);
      emit(SuccessGetAllQuizResultState(result));
    } catch (e) {
      AppPrint.erroLog("ERROR FROM GET ALL QUIZ $e");
      emit(SuccessGetAllQuizResultState(QuizResultEntity()));
    }
  }

  void _handleGetAllQuiz(GetAllQuizEvent event, Emitter<QuizState> emit) async {
    emit(LoadingQuizState());
    try {
      final result = await quizRepository.getAllQuiz(event.courseId);
      emit(SuccessGetAllQuiz(result));
    } catch (e) {
      AppPrint.erroLog("ERROR FROM GET ALL QUIZ $e");
      emit(const SuccessGetAllQuiz([]));
    }
  }

  final QuizRepository quizRepository;
}
