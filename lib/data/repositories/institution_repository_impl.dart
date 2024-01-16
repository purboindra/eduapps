import 'package:education_app/data/entities/institution_entity.dart';
import 'package:education_app/domain/repositories/institution_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class InstitutionRepositoryImpl implements InstitutionRepository {
  @override
  Future<List<InstitutionEntity>> getAllInstitutions() async {
    List<InstitutionEntity> tempInstitution = [];
    final response =
        await Supabase.instance.client.from("institution").select("*");
    for (final institution in response) {
      tempInstitution.add(InstitutionEntity.fromJson(institution));
    }
    return tempInstitution;
  }
}
