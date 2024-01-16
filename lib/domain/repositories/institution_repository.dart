import 'package:education_app/data/entities/institution_entity.dart';

abstract class InstitutionRepository {
  Future<List<InstitutionEntity>> getAllInstitutions();
}
