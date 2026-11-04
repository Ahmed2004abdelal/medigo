import 'package:freezed_annotation/freezed_annotation.dart';

import '../../search/data/model/doctor_model.dart';

part 'favorite_state.freezed.dart';

enum FavoriteStatus { initial, loading, loaded, error }

@freezed
abstract class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    @Default(FavoriteStatus.initial) FavoriteStatus status,
    @Default(<String>{}) Set<String> removingDoctorIds,
    @Default([]) List<DoctorModel> favoriteDoctors,
    String? errorMessage,
  })=_FavoriteState;
}
