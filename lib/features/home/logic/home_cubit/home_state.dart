import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../search/data/model/doctor_model.dart';

part 'home_state.freezed.dart';

enum HomeStatus { initial, loading, loaded, error , languageChanged }

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default('') String userName,
    @Default('en') String languageCode,
    @Default(HomeStatus.initial) HomeStatus status,
    @Default([]) List<DoctorModel> doctors,
    @Default(true) bool hasNextPage,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isFavorite,
    @Default(<String>{}) Set<String> favoriteDoctorIds, // بدل isFavorite
    String? favoriteError, // جديد (اختياري)
    String? errorMessage,
  }) = _HomeState;
}
