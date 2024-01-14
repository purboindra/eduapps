import 'package:education_app/app/utils/app_print.dart';
import 'package:education_app/domain/bloc/base_bloc.dart';
import 'package:education_app/domain/event/home_event.dart';
import 'package:education_app/domain/repositories/home_repository.dart';
import 'package:education_app/domain/state/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc(this.homeRepository) : super(InitialHomeState()) {
    on<GetAllTeacherEvent>(_handleGetAllTeacher);
  }

  void _handleGetAllTeacher(
      GetAllTeacherEvent event, Emitter<HomeState> emit) async {
    emit(LoadingGetTeacherState());
    try {
      final result = await homeRepository.getAllTeachers();
      emit(SuccessGetTeacherState(result));
    } catch (e) {
      AppPrint.debugPrint("ERROR FROM GET ALL TEACHER $e");
      emit(FailedGetTeacherState(e.toString()));
    }
  }

  final HomeRepository homeRepository;
}
