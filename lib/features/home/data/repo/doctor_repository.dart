import 'package:medigo/core/network/paths.dart';

import '../../../../core/network/database/supabase_service.dart';
import '../../../search/data/model/doctor_model.dart';

class DoctorRepository {
  final SupabaseService _service;

  DoctorRepository(this._service);

  Future<List<DoctorModel>> getDoctors({
    String? specialty,
    String? nameQuery,
    int? page,
    int pageSize = 6,
  }) async {
    final data = await _service.fetchData(
      table: Paths.docotor,
      filters: specialty != null ? {'specialty': specialty} : null,
      searchColumn: 'name',
      searchQuery: nameQuery,
      page: page,
      pageSize: pageSize,
    );

    return data.map((json) => DoctorModel.fromJson(json)).toList();
  }
}