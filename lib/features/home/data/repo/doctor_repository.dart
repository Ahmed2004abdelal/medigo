import 'package:dartz/dartz.dart';
import '../../../../core/network/paths.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/network/auth/supabase_auth_services.dart';
import '../../../../core/network/database/supabase_service.dart';
import '../../../../core/network/failure.dart';
import '../../../search/data/model/doctor_model.dart';

class DoctorRepository {
  final SupabaseService _service;
  final SupabaseAuthServices _authServices;

  DoctorRepository(this._service, this._authServices);

  Future<List<DoctorModel>> getDoctors({
    String? specialty,
    String? nameQuery,
    int? page,
    int pageSize = 20,
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

  Future<Either<Failure, User?>> getUserName() async {
    Either<Failure, User> result = _authServices.getCurrentUser() != null
        ? Right(_authServices.getCurrentUser()!)
        : Left(AuthFailure('No user logged in'));

    return result;
  }

  Future<Either<Failure, void>> addFavorite(String doctorId) async {
    try {
      final userId = _authServices.getCurrentUser()?.id;
      if (userId == null) {
        return Left(ServerFailure('User not logged in'));
      }

      await _service.insertData(
        table: Paths.favorite,
        data: {'doctor_id': doctorId, 'user_id': userId},
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> removeFavorite(String doctorId) async {
    try {
      final userId = _authServices.getCurrentUser()?.id;
      if (userId == null) {
        return Left(ServerFailure('User not logged in'));
      }

      await _service.deleteData(
        table: Paths.favorite,
        filters: {'user_id': userId, 'doctor_id': doctorId},
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Stream<bool> isFavoriteStream(String doctorId) {
    final userId = _authServices.getCurrentUser()?.id;

    if (userId == null) return Stream.value(false);

    return _service
        .streamData(
          table: Paths.favorite,
          primaryKey: ['id'],
          filterColumn: 'user_id',
          filterValue: userId,
        )
        .map((rows) => rows.any((row) => row['doctor_id'] == doctorId));
  }
}




// .fold(
//     (failure) {
//       // print('Error fetching user: ${failure.message}');
//       return failure.message; 
//     },
//     (user) {
//       final name = user.userMetadata?['fullName'] as String?;
//       return name;
//     },
//   );