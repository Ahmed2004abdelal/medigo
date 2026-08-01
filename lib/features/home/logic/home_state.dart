import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medigo/features/search/data/model/doctor_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.loading() = _Loading;

  const factory HomeState.loaded({
    required List<DoctorModel> doctors,
    required bool hasNextPage,
    @Default(false) bool isLoadingMore,
  }) = _Loaded;

  const factory HomeState.error(String message) = _Error;
}