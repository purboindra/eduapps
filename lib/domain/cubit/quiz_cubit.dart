import 'package:education_app/app/utils/app_print.dart';
import 'package:education_app/data/entities/quiz_result_entity.dart';
import 'package:education_app/domain/repositories/quiz_repository.dart';
import 'package:education_app/domain/state/quiz_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// todo implement cubit

class QuizCubit extends Cubit<QuizState> {
  QuizCubit(this.quizRepository) : super(const SelectedAnswerState(99));

  void selectedIndex(int index) {
    emit(SelectedAnswerState(index));
  }

  void submitQuiz(List<QuizResultEntity> body, int courseId) async {
    emit(LoadingSubmitQuizState());
    try {
      await quizRepository.submitQuiz(body, courseId);
      emit(SuccessSubmitQuizState());
    } catch (e, st) {
      AppPrint.erroLog("ERROR FROM SUBMIT QUIZ $e", st: st);
      emit(InitialQuizState());
    }
  }

  final QuizRepository quizRepository;
}
