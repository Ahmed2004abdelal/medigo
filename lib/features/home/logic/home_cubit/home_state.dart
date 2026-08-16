import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../search/data/model/doctor_model.dart';

part 'home_state.freezed.dart';

enum HomeStatus { initial, loading, loaded, error }

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default('') String userName,
    @Default(HomeStatus.initial) HomeStatus status,
    @Default([]) List<DoctorModel> doctors,
    @Default(true) bool hasNextPage,
    @Default(false) bool isLoadingMore,
    String? errorMessage,
  }) = _HomeState;
}