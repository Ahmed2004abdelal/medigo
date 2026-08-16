import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medigo/features/search/data/model/doctor_model.dart';

import '../../data/models/appointment_model.dart';
import '../../data/repo/new_appointment_repository.dart';
import 'new_appointment_state.dart';

class NewAppointmentCubit extends Cubit<NewAppointmentState> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  final NewAppointmentRepository _newAppointmentRepository;
  // final DoctorRepository _doctorRepository;
  NewAppointmentCubit({required this._newAppointmentRepository})
    : super(const NewAppointmentState());

  void setDoctorId(String doctorId) {
    emit(state.copyWith(doctorId: doctorId));
  }

  void setSelectedDoctor(DoctorModel doctor) {
    emit(state.copyWith(doctor: doctor));
  }

  void setSelectedDate(DateTime date) {
    emit(state.copyWith(appointmentDate: date));
  }

  void setSelectedConsultationType(String type) {
    emit(state.copyWith(consultationType: type));
  }

  void setSelectedAvailableSlot(String slot) {
    emit(state.copyWith(availableSlot: slot));
  }

  void setSelectedHour(int hour) {
    emit(state.copyWith(selectedHour: hour));
  }

  void setSelectedFee(int fee) {
    emit(state.copyWith(consultationFee: fee));
  }

  void setSelectedGender(Gender gender) {
    emit(state.copyWith(selectedGender: gender));
  }

  void setFullName(String name) {
    emit(state.copyWith(fullName: name));
  }

  void setEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void setPhone(String phone) {
    emit(state.copyWith(phone: phone));
  }

  void setAge(String age) {
    emit(state.copyWith(age: age));
  }

  void setDetail(String detail) {
    emit(state.copyWith(detail: detail));
  }

  bool get firstDone =>
      state.appointmentDate != null &&
      state.consultationType.isNotEmpty &&
      state.availableSlot.isNotEmpty &&
      state.selectedHour != null &&
      state.consultationFee != null;

  bool get secondDone =>
      state.fullName.isNotEmpty &&
      state.email.isNotEmpty &&
      state.phone.isNotEmpty &&
      state.age.isNotEmpty &&
      state.selectedGender != null;


  DateTime combineDateAndTime(DateTime date, int hour) {
  return DateTime(date.year, date.month, date.day, hour);
}

  // Future<String> getUserName() 

  Future<void> bookAppointment() async {
    emit(state.copyWith(submissionStatus: SubmissionStatus.loading));

    final result = await _newAppointmentRepository.bookAppointment(
      AppointmentModel(
        doctorId: state.doctorId,
        age: state.age,
        consultationFee: state.consultationFee,
        consultationType: state.consultationType,
        detail: state.detail,
        patientEmail: state.email,
        patientName: state.fullName,
        patientPhone: state.phone,
        appointmentDatetime: combineDateAndTime(state.appointmentDate!, state.selectedHour!),
        availableSlot: state.availableSlot,
        patientGender: state.selectedGender,
      ),
    );

    result.fold(
      (failure) {
        debugPrint('BOOKING FAILED: ${failure.message}');
        emit(
          state.copyWith(
            submissionStatus: SubmissionStatus.failure,
            submissionErrorMessage: failure.message,
          ),
        );
      },
      (_) {
        debugPrint('BOOKING SUCCESS');
        emit(
          state.copyWith(
            submissionStatus: SubmissionStatus.success,
            submissionSuccessMessage: 'Appointment booked successfully',
          ),
        );
      },
    );
  }
}
