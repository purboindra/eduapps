import 'package:equatable/equatable.dart';

sealed class InstitutionEvent extends Equatable {
  const InstitutionEvent();

  @override
  List<Object> get props => [];
}

final class GetAllInstitutionEvent extends InstitutionEvent {}
