import 'package:bloc/bloc.dart';
import 'package:medigo/features/favorites/data/repo/favorite_repository.dart';
import 'package:medigo/features/favorites/logic/favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteDoctorsRepository _favoriteRepository;

  FavoriteCubit(this._favoriteRepository) : super(const FavoriteState()) {
    fetchFavorites();
  }


Future<void> favoriteRemove(String doctorId) async {
  final removingIds = Set<String>.from(state.removingDoctorIds)..add(doctorId);
  emit(state.copyWith(removingDoctorIds: removingIds));

  final result = await _favoriteRepository.removeFavorite(doctorId);

  result.fold(
    (failure) {
      final revertedIds = Set<String>.from(state.removingDoctorIds)..remove(doctorId);
      emit(
        state.copyWith(
          removingDoctorIds: revertedIds,
          errorMessage: failure.message,
        ),
      );
    },
    (_) {
      final updatedDoctors = state.favoriteDoctors
          .where((doctor) => doctor.id != doctorId)
          .toList();
      final updatedRemovingIds = Set<String>.from(state.removingDoctorIds)..remove(doctorId);
      emit(
        state.copyWith(
          favoriteDoctors: updatedDoctors,
          removingDoctorIds: updatedRemovingIds,
        ),
      );
    },
  );
}

  Future<void> fetchFavorites() async {
    emit(state.copyWith(status: FavoriteStatus.loading));
    try {
      final favoriteDoctors = await _favoriteRepository.getFavoriteDoctors();
      favoriteDoctors.fold(
        (failure) {
          emit(
            state.copyWith(
              status: FavoriteStatus.error,
              errorMessage: failure.message,
            ),
          );
        },
        (doctors) {
          emit(
            state.copyWith(
              status: FavoriteStatus.loaded,
              favoriteDoctors: doctors,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: FavoriteStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
