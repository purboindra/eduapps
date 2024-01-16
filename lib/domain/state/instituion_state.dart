import 'package:education_app/data/entities/institution_entity.dart';
import 'package:equatable/equatable.dart';

sealed class InstituionState extends Equatable {
  const InstituionState();

  @override
  List<Object> get props => [];
}

final class InitialInstituionState extends InstituionState {}

final class LoadingGetAllInstitutionState extends InstituionState {
  const LoadingGetAllInstitutionState();
}

final class SuccessGetAllInstitution extends InstituionState {
  final List<InstitutionEntity> allInstituions;
  const SuccessGetAllInstitution(this.allInstituions);

  @override
  List<Object> get props => [allInstituions];
}
