// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_appointment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewAppointmentState {

// Step 1 — appointment selection
 DateTime? get appointmentDate; String? get doctorId; DoctorModel? get doctor; String get consultationType; String get availableSlot; int? get selectedHour; int? get consultationFee;// Step 2 — patient details
 String get fullName; String get email; String get phone; String get age; String get detail; Gender? get selectedGender;// Submission
 SubmissionStatus get submissionStatus; String? get submissionErrorMessage; String? get submissionSuccessMessage;
/// Create a copy of NewAppointmentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewAppointmentStateCopyWith<NewAppointmentState> get copyWith => _$NewAppointmentStateCopyWithImpl<NewAppointmentState>(this as NewAppointmentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewAppointmentState&&(identical(other.appointmentDate, appointmentDate) || other.appointmentDate == appointmentDate)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctor, doctor) || other.doctor == doctor)&&(identical(other.consultationType, consultationType) || other.consultationType == consultationType)&&(identical(other.availableSlot, availableSlot) || other.availableSlot == availableSlot)&&(identical(other.selectedHour, selectedHour) || other.selectedHour == selectedHour)&&(identical(other.consultationFee, consultationFee) || other.consultationFee == consultationFee)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.age, age) || other.age == age)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.selectedGender, selectedGender) || other.selectedGender == selectedGender)&&(identical(other.submissionStatus, submissionStatus) || other.submissionStatus == submissionStatus)&&(identical(other.submissionErrorMessage, submissionErrorMessage) || other.submissionErrorMessage == submissionErrorMessage)&&(identical(other.submissionSuccessMessage, submissionSuccessMessage) || other.submissionSuccessMessage == submissionSuccessMessage));
}


@override
int get hashCode => Object.hash(runtimeType,appointmentDate,doctorId,doctor,consultationType,availableSlot,selectedHour,consultationFee,fullName,email,phone,age,detail,selectedGender,submissionStatus,submissionErrorMessage,submissionSuccessMessage);

@override
String toString() {
  return 'NewAppointmentState(appointmentDate: $appointmentDate, doctorId: $doctorId, doctor: $doctor, consultationType: $consultationType, availableSlot: $availableSlot, selectedHour: $selectedHour, consultationFee: $consultationFee, fullName: $fullName, email: $email, phone: $phone, age: $age, detail: $detail, selectedGender: $selectedGender, submissionStatus: $submissionStatus, submissionErrorMessage: $submissionErrorMessage, submissionSuccessMessage: $submissionSuccessMessage)';
}


}

/// @nodoc
abstract mixin class $NewAppointmentStateCopyWith<$Res>  {
  factory $NewAppointmentStateCopyWith(NewAppointmentState value, $Res Function(NewAppointmentState) _then) = _$NewAppointmentStateCopyWithImpl;
@useResult
$Res call({
 DateTime? appointmentDate, String? doctorId, DoctorModel? doctor, String consultationType, String availableSlot, int? selectedHour, int? consultationFee, String fullName, String email, String phone, String age, String detail, Gender? selectedGender, SubmissionStatus submissionStatus, String? submissionErrorMessage, String? submissionSuccessMessage
});




}
/// @nodoc
class _$NewAppointmentStateCopyWithImpl<$Res>
    implements $NewAppointmentStateCopyWith<$Res> {
  _$NewAppointmentStateCopyWithImpl(this._self, this._then);

  final NewAppointmentState _self;
  final $Res Function(NewAppointmentState) _then;

/// Create a copy of NewAppointmentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appointmentDate = freezed,Object? doctorId = freezed,Object? doctor = freezed,Object? consultationType = null,Object? availableSlot = null,Object? selectedHour = freezed,Object? consultationFee = freezed,Object? fullName = null,Object? email = null,Object? phone = null,Object? age = null,Object? detail = null,Object? selectedGender = freezed,Object? submissionStatus = null,Object? submissionErrorMessage = freezed,Object? submissionSuccessMessage = freezed,}) {
  return _then(_self.copyWith(
appointmentDate: freezed == appointmentDate ? _self.appointmentDate : appointmentDate // ignore: cast_nullable_to_non_nullable
as DateTime?,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,doctor: freezed == doctor ? _self.doctor : doctor // ignore: cast_nullable_to_non_nullable
as DoctorModel?,consultationType: null == consultationType ? _self.consultationType : consultationType // ignore: cast_nullable_to_non_nullable
as String,availableSlot: null == availableSlot ? _self.availableSlot : availableSlot // ignore: cast_nullable_to_non_nullable
as String,selectedHour: freezed == selectedHour ? _self.selectedHour : selectedHour // ignore: cast_nullable_to_non_nullable
as int?,consultationFee: freezed == consultationFee ? _self.consultationFee : consultationFee // ignore: cast_nullable_to_non_nullable
as int?,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,selectedGender: freezed == selectedGender ? _self.selectedGender : selectedGender // ignore: cast_nullable_to_non_nullable
as Gender?,submissionStatus: null == submissionStatus ? _self.submissionStatus : submissionStatus // ignore: cast_nullable_to_non_nullable
as SubmissionStatus,submissionErrorMessage: freezed == submissionErrorMessage ? _self.submissionErrorMessage : submissionErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,submissionSuccessMessage: freezed == submissionSuccessMessage ? _self.submissionSuccessMessage : submissionSuccessMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NewAppointmentState].
extension NewAppointmentStatePatterns on NewAppointmentState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewAppointmentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewAppointmentState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewAppointmentState value)  $default,){
final _that = this;
switch (_that) {
case _NewAppointmentState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewAppointmentState value)?  $default,){
final _that = this;
switch (_that) {
case _NewAppointmentState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? appointmentDate,  String? doctorId,  DoctorModel? doctor,  String consultationType,  String availableSlot,  int? selectedHour,  int? consultationFee,  String fullName,  String email,  String phone,  String age,  String detail,  Gender? selectedGender,  SubmissionStatus submissionStatus,  String? submissionErrorMessage,  String? submissionSuccessMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewAppointmentState() when $default != null:
return $default(_that.appointmentDate,_that.doctorId,_that.doctor,_that.consultationType,_that.availableSlot,_that.selectedHour,_that.consultationFee,_that.fullName,_that.email,_that.phone,_that.age,_that.detail,_that.selectedGender,_that.submissionStatus,_that.submissionErrorMessage,_that.submissionSuccessMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? appointmentDate,  String? doctorId,  DoctorModel? doctor,  String consultationType,  String availableSlot,  int? selectedHour,  int? consultationFee,  String fullName,  String email,  String phone,  String age,  String detail,  Gender? selectedGender,  SubmissionStatus submissionStatus,  String? submissionErrorMessage,  String? submissionSuccessMessage)  $default,) {final _that = this;
switch (_that) {
case _NewAppointmentState():
return $default(_that.appointmentDate,_that.doctorId,_that.doctor,_that.consultationType,_that.availableSlot,_that.selectedHour,_that.consultationFee,_that.fullName,_that.email,_that.phone,_that.age,_that.detail,_that.selectedGender,_that.submissionStatus,_that.submissionErrorMessage,_that.submissionSuccessMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? appointmentDate,  String? doctorId,  DoctorModel? doctor,  String consultationType,  String availableSlot,  int? selectedHour,  int? consultationFee,  String fullName,  String email,  String phone,  String age,  String detail,  Gender? selectedGender,  SubmissionStatus submissionStatus,  String? submissionErrorMessage,  String? submissionSuccessMessage)?  $default,) {final _that = this;
switch (_that) {
case _NewAppointmentState() when $default != null:
return $default(_that.appointmentDate,_that.doctorId,_that.doctor,_that.consultationType,_that.availableSlot,_that.selectedHour,_that.consultationFee,_that.fullName,_that.email,_that.phone,_that.age,_that.detail,_that.selectedGender,_that.submissionStatus,_that.submissionErrorMessage,_that.submissionSuccessMessage);case _:
  return null;

}
}

}

/// @nodoc


class _NewAppointmentState implements NewAppointmentState {
  const _NewAppointmentState({this.appointmentDate, this.doctorId, this.doctor, this.consultationType = '', this.availableSlot = '', this.selectedHour, this.consultationFee, this.fullName = '', this.email = '', this.phone = '', this.age = '', this.detail = '', this.selectedGender, this.submissionStatus = SubmissionStatus.idle, this.submissionErrorMessage, this.submissionSuccessMessage});
  

// Step 1 — appointment selection
@override final  DateTime? appointmentDate;
@override final  String? doctorId;
@override final  DoctorModel? doctor;
@override@JsonKey() final  String consultationType;
@override@JsonKey() final  String availableSlot;
@override final  int? selectedHour;
@override final  int? consultationFee;
// Step 2 — patient details
@override@JsonKey() final  String fullName;
@override@JsonKey() final  String email;
@override@JsonKey() final  String phone;
@override@JsonKey() final  String age;
@override@JsonKey() final  String detail;
@override final  Gender? selectedGender;
// Submission
@override@JsonKey() final  SubmissionStatus submissionStatus;
@override final  String? submissionErrorMessage;
@override final  String? submissionSuccessMessage;

/// Create a copy of NewAppointmentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewAppointmentStateCopyWith<_NewAppointmentState> get copyWith => __$NewAppointmentStateCopyWithImpl<_NewAppointmentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewAppointmentState&&(identical(other.appointmentDate, appointmentDate) || other.appointmentDate == appointmentDate)&&(identical(other.doctorId, doctorId) || other.doctorId == doctorId)&&(identical(other.doctor, doctor) || other.doctor == doctor)&&(identical(other.consultationType, consultationType) || other.consultationType == consultationType)&&(identical(other.availableSlot, availableSlot) || other.availableSlot == availableSlot)&&(identical(other.selectedHour, selectedHour) || other.selectedHour == selectedHour)&&(identical(other.consultationFee, consultationFee) || other.consultationFee == consultationFee)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.age, age) || other.age == age)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.selectedGender, selectedGender) || other.selectedGender == selectedGender)&&(identical(other.submissionStatus, submissionStatus) || other.submissionStatus == submissionStatus)&&(identical(other.submissionErrorMessage, submissionErrorMessage) || other.submissionErrorMessage == submissionErrorMessage)&&(identical(other.submissionSuccessMessage, submissionSuccessMessage) || other.submissionSuccessMessage == submissionSuccessMessage));
}


@override
int get hashCode => Object.hash(runtimeType,appointmentDate,doctorId,doctor,consultationType,availableSlot,selectedHour,consultationFee,fullName,email,phone,age,detail,selectedGender,submissionStatus,submissionErrorMessage,submissionSuccessMessage);

@override
String toString() {
  return 'NewAppointmentState(appointmentDate: $appointmentDate, doctorId: $doctorId, doctor: $doctor, consultationType: $consultationType, availableSlot: $availableSlot, selectedHour: $selectedHour, consultationFee: $consultationFee, fullName: $fullName, email: $email, phone: $phone, age: $age, detail: $detail, selectedGender: $selectedGender, submissionStatus: $submissionStatus, submissionErrorMessage: $submissionErrorMessage, submissionSuccessMessage: $submissionSuccessMessage)';
}


}

/// @nodoc
abstract mixin class _$NewAppointmentStateCopyWith<$Res> implements $NewAppointmentStateCopyWith<$Res> {
  factory _$NewAppointmentStateCopyWith(_NewAppointmentState value, $Res Function(_NewAppointmentState) _then) = __$NewAppointmentStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime? appointmentDate, String? doctorId, DoctorModel? doctor, String consultationType, String availableSlot, int? selectedHour, int? consultationFee, String fullName, String email, String phone, String age, String detail, Gender? selectedGender, SubmissionStatus submissionStatus, String? submissionErrorMessage, String? submissionSuccessMessage
});




}
/// @nodoc
class __$NewAppointmentStateCopyWithImpl<$Res>
    implements _$NewAppointmentStateCopyWith<$Res> {
  __$NewAppointmentStateCopyWithImpl(this._self, this._then);

  final _NewAppointmentState _self;
  final $Res Function(_NewAppointmentState) _then;

/// Create a copy of NewAppointmentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appointmentDate = freezed,Object? doctorId = freezed,Object? doctor = freezed,Object? consultationType = null,Object? availableSlot = null,Object? selectedHour = freezed,Object? consultationFee = freezed,Object? fullName = null,Object? email = null,Object? phone = null,Object? age = null,Object? detail = null,Object? selectedGender = freezed,Object? submissionStatus = null,Object? submissionErrorMessage = freezed,Object? submissionSuccessMessage = freezed,}) {
  return _then(_NewAppointmentState(
appointmentDate: freezed == appointmentDate ? _self.appointmentDate : appointmentDate // ignore: cast_nullable_to_non_nullable
as DateTime?,doctorId: freezed == doctorId ? _self.doctorId : doctorId // ignore: cast_nullable_to_non_nullable
as String?,doctor: freezed == doctor ? _self.doctor : doctor // ignore: cast_nullable_to_non_nullable
as DoctorModel?,consultationType: null == consultationType ? _self.consultationType : consultationType // ignore: cast_nullable_to_non_nullable
as String,availableSlot: null == availableSlot ? _self.availableSlot : availableSlot // ignore: cast_nullable_to_non_nullable
as String,selectedHour: freezed == selectedHour ? _self.selectedHour : selectedHour // ignore: cast_nullable_to_non_nullable
as int?,consultationFee: freezed == consultationFee ? _self.consultationFee : consultationFee // ignore: cast_nullable_to_non_nullable
as int?,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,selectedGender: freezed == selectedGender ? _self.selectedGender : selectedGender // ignore: cast_nullable_to_non_nullable
as Gender?,submissionStatus: null == submissionStatus ? _self.submissionStatus : submissionStatus // ignore: cast_nullable_to_non_nullable
as SubmissionStatus,submissionErrorMessage: freezed == submissionErrorMessage ? _self.submissionErrorMessage : submissionErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,submissionSuccessMessage: freezed == submissionSuccessMessage ? _self.submissionSuccessMessage : submissionSuccessMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
