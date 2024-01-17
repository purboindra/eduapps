import 'package:education_app/app/utils/app_print.dart';
import 'package:education_app/domain/bloc/base_bloc.dart';
import 'package:education_app/domain/event/quiz_event.dart';
import 'package:education_app/domain/repositories/quiz_repository.dart';
import 'package:education_app/domain/state/quiz_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizBloc extends BaseBloc<QuizEvent, QuizState> {
  QuizBloc(this.quizRepository) : super(InitialQuizState()) {
    on<GetAllQuizEvent>(_handleGetAllQuiz);
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
