import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../home/data/models/appointment_model.dart';
import '../../../../core/network/failure.dart';
import '../../../../core/network/paths.dart';

abstract class AppointmentRepository {
  Future<Either<Failure, List<AppointmentModel>>> fetchUpcomingAppointments();

  Future<Either<Failure, List<AppointmentModel>>> fetchCompletedAppointments();

  Future<Either<Failure, List<AppointmentModel>>> fetchCancelledAppointments();

  Future<Either<Failure, Unit>> cancelAppointment(String appointmentId);
}

class AppointmentRepositoryImpl implements AppointmentRepository {
  final SupabaseClient _client;

  AppointmentRepositoryImpl(this._client);

  @override
  Future<Either<Failure, List<AppointmentModel>>> fetchUpcomingAppointments() async {
    try {
      final now = DateTime.now().toUtc().toIso8601String();

      final response = await _client
          .from(Paths.appointment)
          .select('*, doctors(*)')
          .neq('status', 'cancelled')
          .gte('appointment_datetime', now)
          .order('appointment_datetime', ascending: true);

      final appointments = (response as List)
          .map((json) => AppointmentModel.fromJson(json))
          .toList();

      return Right(appointments);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch upcoming appointments: $e'));
    }
  }

  @override
  Future<Either<Failure, List<AppointmentModel>>> fetchCompletedAppointments() async {
    try {
      final now = DateTime.now().toUtc().toIso8601String();

      final response = await _client
          .from(Paths.appointment)
          .select('*, doctors(*)')
          .neq('status', 'cancelled')
          .lt('appointment_datetime', now)
          .order('appointment_datetime', ascending: false);

      final appointments = (response as List)
          .map((json) => AppointmentModel.fromJson(json))
          .toList();

      return Right(appointments);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch completed appointments: $e'));
    }
  }

  @override
  Future<Either<Failure, List<AppointmentModel>>> fetchCancelledAppointments() async {
    try {
      final response = await _client
          .from(Paths.appointment)
          .select('*, doctors(*)')
          .eq('status', 'cancelled')
          .order('appointment_datetime', ascending: false);

      final appointments = (response as List)
          .map((json) => AppointmentModel.fromJson(json))
          .toList();

      return Right(appointments);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch cancelled appointments: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> cancelAppointment(String appointmentId) async {
    try {
      await _client
          .from(Paths.appointment)
          .update({'status': 'cancelled'})
          .eq('id', appointmentId);

      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure('Failed to cancel appointment: $e'));
    }
  }
}