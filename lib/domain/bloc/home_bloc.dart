import 'package:education_app/app/utils/app_print.dart';
import 'package:education_app/domain/bloc/base_bloc.dart';
import 'package:education_app/domain/event/home_event.dart';
import 'package:education_app/domain/repositories/home_repository.dart';
import 'package:education_app/domain/state/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc(this.homeRepository) : super(InitialHomeState()) {
    on<GetAllDataEvent>(_handleGetAllDataEvent);
  }

  void _handleGetAllDataEvent(
      GetAllDataEvent event, Emitter<HomeState> emit) async {
    emit(const LoadingGetAllDataState());
    try {
      final result = await homeRepository.getAllInstitutions();
      final resultA = await homeRepository.getAllTeachers();
      emit(SuccessGetAllDataState(result, resultA));
    } catch (e) {
      AppPrint.erroLog("FAIL GET ALL INSTITUTION $e");
      emit(InitialInstituionState());
    }
  }

  final HomeRepository homeRepository;
}
