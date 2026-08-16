import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/model/doctor_model.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;

  const factory SearchState.loading() = _Loading;

  const factory SearchState.loaded({
    required List<DoctorModel> doctors,
    required bool hasNextPage,
    required String searchQuery,
    @Default(false) bool isLoadingMore,
    String? currentSort,   
  }) = _Loaded;

  const factory SearchState.error(String message) = _Error;
}