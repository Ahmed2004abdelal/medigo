import 'package:dartz/dartz.dart';

import '../../../../core/network/database/supabase_service.dart';
import '../../../../core/network/failure.dart';
import '../../../../core/network/paths.dart';

class FavoriteToggleRepository {
  final SupabaseService _service;
  FavoriteToggleRepository(this._service);

  Future<Either<Failure, List<String>>> fetchFavoritesDoctor() async {
    try {
      final response = await _service.fetchData(table: Paths.favorite);
      final favoriteDoctorIds = response.map((item) => item['doctor_id'] as String).toList();
      return Right(favoriteDoctorIds);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, bool>> toggleFavorite(String doctorId) async {
    try {
      final existingFavorite = await _service.fetchData(
        table: Paths.favorite,
        filters: {'doctor_id': doctorId},
      );

      if (existingFavorite.isNotEmpty) {
        await _service.deleteData(
          table: Paths.favorite,
          filters: {'doctor_id': doctorId},
        );
        return const Right(false);
      } else {
        await _service.insertData(
          table: Paths.favorite,
          data: {'doctor_id': doctorId},
        );
        return const Right(true);
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
