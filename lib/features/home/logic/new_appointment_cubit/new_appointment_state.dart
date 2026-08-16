import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medigo/features/search/data/model/doctor_model.dart';

import '../../data/models/appointment_model.dart';

part 'new_appointment_state.freezed.dart';

enum SubmissionStatus { idle, loading, success, failure }

@freezed
abstract class NewAppointmentState with _$NewAppointmentState {
  const factory NewAppointmentState({
    // Step 1 — appointment selection
    DateTime? appointmentDate,
    String? doctorId,
    DoctorModel? doctor,
    @Default('') String consultationType,
    @Default('') String availableSlot,

    int? selectedHour,
    int? consultationFee,

    // Step 2 — patient details
    @Default('') String fullName,
    @Default('') String email,
    @Default('') String phone,
    @Default('') String age,
    @Default('') String detail,
    Gender? selectedGender,

    // Submission
    @Default(SubmissionStatus.idle) SubmissionStatus submissionStatus,
    String? submissionErrorMessage,
    String? submissionSuccessMessage,
  }) = _NewAppointmentState;
}