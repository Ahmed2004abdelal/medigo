// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavoriteState {

 FavoriteStatus get status; Set<String> get removingDoctorIds;// بيتشالوا دلوقتي
 List<DoctorModel> get favoriteDoctors; String? get errorMessage;
/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteStateCopyWith<FavoriteState> get copyWith => _$FavoriteStateCopyWithImpl<FavoriteState>(this as FavoriteState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.removingDoctorIds, removingDoctorIds)&&const DeepCollectionEquality().equals(other.favoriteDoctors, favoriteDoctors)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(removingDoctorIds),const DeepCollectionEquality().hash(favoriteDoctors),errorMessage);

@override
String toString() {
  return 'FavoriteState(status: $status, removingDoctorIds: $removingDoctorIds, favoriteDoctors: $favoriteDoctors, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $FavoriteStateCopyWith<$Res>  {
  factory $FavoriteStateCopyWith(FavoriteState value, $Res Function(FavoriteState) _then) = _$FavoriteStateCopyWithImpl;
@useResult
$Res call({
 FavoriteStatus status, Set<String> removingDoctorIds, List<DoctorModel> favoriteDoctors, String? errorMessage
});




}
/// @nodoc
class _$FavoriteStateCopyWithImpl<$Res>
    implements $FavoriteStateCopyWith<$Res> {
  _$FavoriteStateCopyWithImpl(this._self, this._then);

  final FavoriteState _self;
  final $Res Function(FavoriteState) _then;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? removingDoctorIds = null,Object? favoriteDoctors = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FavoriteStatus,removingDoctorIds: null == removingDoctorIds ? _self.removingDoctorIds : removingDoctorIds // ignore: cast_nullable_to_non_nullable
as Set<String>,favoriteDoctors: null == favoriteDoctors ? _self.favoriteDoctors : favoriteDoctors // ignore: cast_nullable_to_non_nullable
as List<DoctorModel>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FavoriteState].
extension FavoriteStatePatterns on FavoriteState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoriteState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoriteState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoriteState value)  $default,){
final _that = this;
switch (_that) {
case _FavoriteState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoriteState value)?  $default,){
final _that = this;
switch (_that) {
case _FavoriteState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FavoriteStatus status,  Set<String> removingDoctorIds,  List<DoctorModel> favoriteDoctors,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoriteState() when $default != null:
return $default(_that.status,_that.removingDoctorIds,_that.favoriteDoctors,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FavoriteStatus status,  Set<String> removingDoctorIds,  List<DoctorModel> favoriteDoctors,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _FavoriteState():
return $default(_that.status,_that.removingDoctorIds,_that.favoriteDoctors,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FavoriteStatus status,  Set<String> removingDoctorIds,  List<DoctorModel> favoriteDoctors,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _FavoriteState() when $default != null:
return $default(_that.status,_that.removingDoctorIds,_that.favoriteDoctors,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _FavoriteState implements FavoriteState {
  const _FavoriteState({this.status = FavoriteStatus.initial, final  Set<String> removingDoctorIds = const <String>{}, final  List<DoctorModel> favoriteDoctors = const [], this.errorMessage}): _removingDoctorIds = removingDoctorIds,_favoriteDoctors = favoriteDoctors;
  

@override@JsonKey() final  FavoriteStatus status;
 final  Set<String> _removingDoctorIds;
@override@JsonKey() Set<String> get removingDoctorIds {
  if (_removingDoctorIds is EqualUnmodifiableSetView) return _removingDoctorIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_removingDoctorIds);
}

// بيتشالوا دلوقتي
 final  List<DoctorModel> _favoriteDoctors;
// بيتشالوا دلوقتي
@override@JsonKey() List<DoctorModel> get favoriteDoctors {
  if (_favoriteDoctors is EqualUnmodifiableListView) return _favoriteDoctors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favoriteDoctors);
}

@override final  String? errorMessage;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteStateCopyWith<_FavoriteState> get copyWith => __$FavoriteStateCopyWithImpl<_FavoriteState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._removingDoctorIds, _removingDoctorIds)&&const DeepCollectionEquality().equals(other._favoriteDoctors, _favoriteDoctors)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_removingDoctorIds),const DeepCollectionEquality().hash(_favoriteDoctors),errorMessage);

@override
String toString() {
  return 'FavoriteState(status: $status, removingDoctorIds: $removingDoctorIds, favoriteDoctors: $favoriteDoctors, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$FavoriteStateCopyWith<$Res> implements $FavoriteStateCopyWith<$Res> {
  factory _$FavoriteStateCopyWith(_FavoriteState value, $Res Function(_FavoriteState) _then) = __$FavoriteStateCopyWithImpl;
@override @useResult
$Res call({
 FavoriteStatus status, Set<String> removingDoctorIds, List<DoctorModel> favoriteDoctors, String? errorMessage
});




}
/// @nodoc
class __$FavoriteStateCopyWithImpl<$Res>
    implements _$FavoriteStateCopyWith<$Res> {
  __$FavoriteStateCopyWithImpl(this._self, this._then);

  final _FavoriteState _self;
  final $Res Function(_FavoriteState) _then;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? removingDoctorIds = null,Object? favoriteDoctors = null,Object? errorMessage = freezed,}) {
  return _then(_FavoriteState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FavoriteStatus,removingDoctorIds: null == removingDoctorIds ? _self._removingDoctorIds : removingDoctorIds // ignore: cast_nullable_to_non_nullable
as Set<String>,favoriteDoctors: null == favoriteDoctors ? _self._favoriteDoctors : favoriteDoctors // ignore: cast_nullable_to_non_nullable
as List<DoctorModel>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
