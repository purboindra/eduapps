import 'package:education_app/app/utils/app_print.dart';
import 'package:education_app/domain/bloc/base_bloc.dart';
import 'package:education_app/domain/event/institution_event.dart';
import 'package:education_app/domain/repositories/institution_repository.dart';
import 'package:education_app/domain/state/instituion_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstituionBloc extends BaseBloc<InstitutionEvent, InstituionState> {
  InstituionBloc(this.institutionRepository) : super(InitialInstituionState()) {
    on<GetAllInstitutionEvent>(_handleGetAllInstitution);
  }

  void _handleGetAllInstitution(
      GetAllInstitutionEvent event, Emitter<InstituionState> emit) async {
    emit(const LoadingGetAllInstitutionState());
    try {
      final result = await institutionRepository.getAllInstitutions();
      emit(SuccessGetAllInstitution(result));
    } catch (e) {
      AppPrint.debugPrint("FAIL GET ALL INSTITUTION $e");
      emit(InitialInstituionState());
    }
  }

  final InstitutionRepository institutionRepository;
}
