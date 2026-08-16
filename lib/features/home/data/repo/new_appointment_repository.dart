import 'package:dartz/dartz.dart';
import '../models/appointment_model.dart';

import '../../../../core/network/database/supabase_service.dart';
import '../../../../core/network/failure.dart';
import '../../../../core/network/paths.dart';

class NewAppointmentRepository {
  final SupabaseService _service;

  NewAppointmentRepository(this._service);

  Future<Either<Failure, Unit>> bookAppointment(AppointmentModel model) async {
    try {
      await _service.insertData(table: Paths.appointment, data: model.toJson());
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure('Failed to submit appointment: $e'));
    }
  }
}
