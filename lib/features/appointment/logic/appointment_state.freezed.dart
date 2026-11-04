// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppointmentState {

 AppointmentStatus get upcomingStatus; List<AppointmentModel> get upcomingAppointments; String? get upcomingError; AppointmentStatus get completedStatus; List<AppointmentModel> get completedAppointments; String? get completedError; AppointmentStatus get cancelledStatus; List<AppointmentModel> get cancelledAppointments; String? get cancelledError;
/// Create a copy of AppointmentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentStateCopyWith<AppointmentState> get copyWith => _$AppointmentStateCopyWithImpl<AppointmentState>(this as AppointmentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentState&&(identical(other.upcomingStatus, upcomingStatus) || other.upcomingStatus == upcomingStatus)&&const DeepCollectionEquality().equals(other.upcomingAppointments, upcomingAppointments)&&(identical(other.upcomingError, upcomingError) || other.upcomingError == upcomingError)&&(identical(other.completedStatus, completedStatus) || other.completedStatus == completedStatus)&&const DeepCollectionEquality().equals(other.completedAppointments, completedAppointments)&&(identical(other.completedError, completedError) || other.completedError == completedError)&&(identical(other.cancelledStatus, cancelledStatus) || other.cancelledStatus == cancelledStatus)&&const DeepCollectionEquality().equals(other.cancelledAppointments, cancelledAppointments)&&(identical(other.cancelledError, cancelledError) || other.cancelledError == cancelledError));
}


@override
int get hashCode => Object.hash(runtimeType,upcomingStatus,const DeepCollectionEquality().hash(upcomingAppointments),upcomingError,completedStatus,const DeepCollectionEquality().hash(completedAppointments),completedError,cancelledStatus,const DeepCollectionEquality().hash(cancelledAppointments),cancelledError);

@override
String toString() {
  return 'AppointmentState(upcomingStatus: $upcomingStatus, upcomingAppointments: $upcomingAppointments, upcomingError: $upcomingError, completedStatus: $completedStatus, completedAppointments: $completedAppointments, completedError: $completedError, cancelledStatus: $cancelledStatus, cancelledAppointments: $cancelledAppointments, cancelledError: $cancelledError)';
}


}

/// @nodoc
abstract mixin class $AppointmentStateCopyWith<$Res>  {
  factory $AppointmentStateCopyWith(AppointmentState value, $Res Function(AppointmentState) _then) = _$AppointmentStateCopyWithImpl;
@useResult
$Res call({
 AppointmentStatus upcomingStatus, List<AppointmentModel> upcomingAppointments, String? upcomingError, AppointmentStatus completedStatus, List<AppointmentModel> completedAppointments, String? completedError, AppointmentStatus cancelledStatus, List<AppointmentModel> cancelledAppointments, String? cancelledError
});




}
/// @nodoc
class _$AppointmentStateCopyWithImpl<$Res>
    implements $AppointmentStateCopyWith<$Res> {
  _$AppointmentStateCopyWithImpl(this._self, this._then);

  final AppointmentState _self;
  final $Res Function(AppointmentState) _then;

/// Create a copy of AppointmentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? upcomingStatus = null,Object? upcomingAppointments = null,Object? upcomingError = freezed,Object? completedStatus = null,Object? completedAppointments = null,Object? completedError = freezed,Object? cancelledStatus = null,Object? cancelledAppointments = null,Object? cancelledError = freezed,}) {
  return _then(_self.copyWith(
upcomingStatus: null == upcomingStatus ? _self.upcomingStatus : upcomingStatus // ignore: cast_nullable_to_non_nullable
as AppointmentStatus,upcomingAppointments: null == upcomingAppointments ? _self.upcomingAppointments : upcomingAppointments // ignore: cast_nullable_to_non_nullable
as List<AppointmentModel>,upcomingError: freezed == upcomingError ? _self.upcomingError : upcomingError // ignore: cast_nullable_to_non_nullable
as String?,completedStatus: null == completedStatus ? _self.completedStatus : completedStatus // ignore: cast_nullable_to_non_nullable
as AppointmentStatus,completedAppointments: null == completedAppointments ? _self.completedAppointments : completedAppointments // ignore: cast_nullable_to_non_nullable
as List<AppointmentModel>,completedError: freezed == completedError ? _self.completedError : completedError // ignore: cast_nullable_to_non_nullable
as String?,cancelledStatus: null == cancelledStatus ? _self.cancelledStatus : cancelledStatus // ignore: cast_nullable_to_non_nullable
as AppointmentStatus,cancelledAppointments: null == cancelledAppointments ? _self.cancelledAppointments : cancelledAppointments // ignore: cast_nullable_to_non_nullable
as List<AppointmentModel>,cancelledError: freezed == cancelledError ? _self.cancelledError : cancelledError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppointmentState].
extension AppointmentStatePatterns on AppointmentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentState value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentState value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppointmentStatus upcomingStatus,  List<AppointmentModel> upcomingAppointments,  String? upcomingError,  AppointmentStatus completedStatus,  List<AppointmentModel> completedAppointments,  String? completedError,  AppointmentStatus cancelledStatus,  List<AppointmentModel> cancelledAppointments,  String? cancelledError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentState() when $default != null:
return $default(_that.upcomingStatus,_that.upcomingAppointments,_that.upcomingError,_that.completedStatus,_that.completedAppointments,_that.completedError,_that.cancelledStatus,_that.cancelledAppointments,_that.cancelledError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppointmentStatus upcomingStatus,  List<AppointmentModel> upcomingAppointments,  String? upcomingError,  AppointmentStatus completedStatus,  List<AppointmentModel> completedAppointments,  String? completedError,  AppointmentStatus cancelledStatus,  List<AppointmentModel> cancelledAppointments,  String? cancelledError)  $default,) {final _that = this;
switch (_that) {
case _AppointmentState():
return $default(_that.upcomingStatus,_that.upcomingAppointments,_that.upcomingError,_that.completedStatus,_that.completedAppointments,_that.completedError,_that.cancelledStatus,_that.cancelledAppointments,_that.cancelledError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppointmentStatus upcomingStatus,  List<AppointmentModel> upcomingAppointments,  String? upcomingError,  AppointmentStatus completedStatus,  List<AppointmentModel> completedAppointments,  String? completedError,  AppointmentStatus cancelledStatus,  List<AppointmentModel> cancelledAppointments,  String? cancelledError)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentState() when $default != null:
return $default(_that.upcomingStatus,_that.upcomingAppointments,_that.upcomingError,_that.completedStatus,_that.completedAppointments,_that.completedError,_that.cancelledStatus,_that.cancelledAppointments,_that.cancelledError);case _:
  return null;

}
}

}

/// @nodoc


class _AppointmentState implements AppointmentState {
  const _AppointmentState({this.upcomingStatus = AppointmentStatus.initial, final  List<AppointmentModel> upcomingAppointments = const [], this.upcomingError, this.completedStatus = AppointmentStatus.initial, final  List<AppointmentModel> completedAppointments = const [], this.completedError, this.cancelledStatus = AppointmentStatus.initial, final  List<AppointmentModel> cancelledAppointments = const [], this.cancelledError}): _upcomingAppointments = upcomingAppointments,_completedAppointments = completedAppointments,_cancelledAppointments = cancelledAppointments;
  

@override@JsonKey() final  AppointmentStatus upcomingStatus;
 final  List<AppointmentModel> _upcomingAppointments;
@override@JsonKey() List<AppointmentModel> get upcomingAppointments {
  if (_upcomingAppointments is EqualUnmodifiableListView) return _upcomingAppointments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_upcomingAppointments);
}

@override final  String? upcomingError;
@override@JsonKey() final  AppointmentStatus completedStatus;
 final  List<AppointmentModel> _completedAppointments;
@override@JsonKey() List<AppointmentModel> get completedAppointments {
  if (_completedAppointments is EqualUnmodifiableListView) return _completedAppointments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completedAppointments);
}

@override final  String? completedError;
@override@JsonKey() final  AppointmentStatus cancelledStatus;
 final  List<AppointmentModel> _cancelledAppointments;
@override@JsonKey() List<AppointmentModel> get cancelledAppointments {
  if (_cancelledAppointments is EqualUnmodifiableListView) return _cancelledAppointments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cancelledAppointments);
}

@override final  String? cancelledError;

/// Create a copy of AppointmentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentStateCopyWith<_AppointmentState> get copyWith => __$AppointmentStateCopyWithImpl<_AppointmentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentState&&(identical(other.upcomingStatus, upcomingStatus) || other.upcomingStatus == upcomingStatus)&&const DeepCollectionEquality().equals(other._upcomingAppointments, _upcomingAppointments)&&(identical(other.upcomingError, upcomingError) || other.upcomingError == upcomingError)&&(identical(other.completedStatus, completedStatus) || other.completedStatus == completedStatus)&&const DeepCollectionEquality().equals(other._completedAppointments, _completedAppointments)&&(identical(other.completedError, completedError) || other.completedError == completedError)&&(identical(other.cancelledStatus, cancelledStatus) || other.cancelledStatus == cancelledStatus)&&const DeepCollectionEquality().equals(other._cancelledAppointments, _cancelledAppointments)&&(identical(other.cancelledError, cancelledError) || other.cancelledError == cancelledError));
}


@override
int get hashCode => Object.hash(runtimeType,upcomingStatus,const DeepCollectionEquality().hash(_upcomingAppointments),upcomingError,completedStatus,const DeepCollectionEquality().hash(_completedAppointments),completedError,cancelledStatus,const DeepCollectionEquality().hash(_cancelledAppointments),cancelledError);

@override
String toString() {
  return 'AppointmentState(upcomingStatus: $upcomingStatus, upcomingAppointments: $upcomingAppointments, upcomingError: $upcomingError, completedStatus: $completedStatus, completedAppointments: $completedAppointments, completedError: $completedError, cancelledStatus: $cancelledStatus, cancelledAppointments: $cancelledAppointments, cancelledError: $cancelledError)';
}


}

/// @nodoc
abstract mixin class _$AppointmentStateCopyWith<$Res> implements $AppointmentStateCopyWith<$Res> {
  factory _$AppointmentStateCopyWith(_AppointmentState value, $Res Function(_AppointmentState) _then) = __$AppointmentStateCopyWithImpl;
@override @useResult
$Res call({
 AppointmentStatus upcomingStatus, List<AppointmentModel> upcomingAppointments, String? upcomingError, AppointmentStatus completedStatus, List<AppointmentModel> completedAppointments, String? completedError, AppointmentStatus cancelledStatus, List<AppointmentModel> cancelledAppointments, String? cancelledError
});




}
/// @nodoc
class __$AppointmentStateCopyWithImpl<$Res>
    implements _$AppointmentStateCopyWith<$Res> {
  __$AppointmentStateCopyWithImpl(this._self, this._then);

  final _AppointmentState _self;
  final $Res Function(_AppointmentState) _then;

/// Create a copy of AppointmentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? upcomingStatus = null,Object? upcomingAppointments = null,Object? upcomingError = freezed,Object? completedStatus = null,Object? completedAppointments = null,Object? completedError = freezed,Object? cancelledStatus = null,Object? cancelledAppointments = null,Object? cancelledError = freezed,}) {
  return _then(_AppointmentState(
upcomingStatus: null == upcomingStatus ? _self.upcomingStatus : upcomingStatus // ignore: cast_nullable_to_non_nullable
as AppointmentStatus,upcomingAppointments: null == upcomingAppointments ? _self._upcomingAppointments : upcomingAppointments // ignore: cast_nullable_to_non_nullable
as List<AppointmentModel>,upcomingError: freezed == upcomingError ? _self.upcomingError : upcomingError // ignore: cast_nullable_to_non_nullable
as String?,completedStatus: null == completedStatus ? _self.completedStatus : completedStatus // ignore: cast_nullable_to_non_nullable
as AppointmentStatus,completedAppointments: null == completedAppointments ? _self._completedAppointments : completedAppointments // ignore: cast_nullable_to_non_nullable
as List<AppointmentModel>,completedError: freezed == completedError ? _self.completedError : completedError // ignore: cast_nullable_to_non_nullable
as String?,cancelledStatus: null == cancelledStatus ? _self.cancelledStatus : cancelledStatus // ignore: cast_nullable_to_non_nullable
as AppointmentStatus,cancelledAppointments: null == cancelledAppointments ? _self._cancelledAppointments : cancelledAppointments // ignore: cast_nullable_to_non_nullable
as List<AppointmentModel>,cancelledError: freezed == cancelledError ? _self.cancelledError : cancelledError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
