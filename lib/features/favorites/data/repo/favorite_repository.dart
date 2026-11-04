import 'package:dartz/dartz.dart';
import '../../../../core/network/database/supabase_service.dart';
import '../../../../core/network/failure.dart';
import '../../../../core/network/paths.dart';
import '../../../search/data/model/doctor_model.dart';

class FavoriteDoctorsRepository {
  final SupabaseService _service;
  FavoriteDoctorsRepository(this._service);

  /// بيجيب كل الدكاترة اللي المستخدم الحالي عملهم favorite
  Future<Either<Failure, List<DoctorModel>>> getFavoriteDoctors() async {
    try {
      final response = await _service.fetchDataWithJoin(
        table: Paths.favorite,
        select: 'doctor_id, doctors(*)',
        orderBy: 'created_at',
        ascending: false,
      );

      final doctors = response
          .where((row) => row['doctors'] != null)
          .map((row) => DoctorModel.fromJson(row['doctors'] as Map<String, dynamic>))
          .toList();

      return Right(doctors);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> removeFavorite(String doctorId) async {
    try {
      await _service.deleteData(
        table: Paths.favorite,
        filters: {'doctor_id': doctorId},
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  /// بديل أخف: الـ IDs بس
  // Future<Either<Failure, Set<String>>> getFavoriteDoctorIds() async {
  //   try {
  //     final response = await _service.fetchData(
  //       table: Paths.favorite,
  //     );

  //     final ids = response
  //         .map((row) => row['doctor_id'] as String)
  //         .toSet();

  //     return Right(ids);
  //   } catch (e) {
  //     return Left(ServerFailure(e.toString()));
  //   }
  // }
}