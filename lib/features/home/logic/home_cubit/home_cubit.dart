import 'package:bloc/bloc.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/network/paths.dart';
import '../../data/repo/doctor_repository.dart';
import '../../data/repo/favorite_toggle_repository.dart';
import 'home_state.dart';
import '../../../search/data/model/doctor_model.dart';

class HomeCubit extends Cubit<HomeState> {
  final DoctorRepository _repository;
  final FavoriteToggleRepository _favoriteRepository;
  static const int _pageSize = 20;

  HomeCubit(this._repository, this._favoriteRepository)
    : super(const HomeState()) {
    getUserName();
    loadMore();
    fetchFavorites();
    getSavedLanguage(); 
  }

  int _currentPage = 0;
  final List<DoctorModel> _doctors = [];

  Future<void> getUserName() async {
    final result = await _repository.getUserName();

    result.fold(
      (failure) {
        emit(state.copyWith(errorMessage: failure.message));
      },
      (user) {
        final name = user?.userMetadata?['fullName'] as String? ?? '';
        emit(state.copyWith(userName: name));
      },
    );
  }

  Future<void> loadMore() async {
    if (state.isLoadingMore || !state.hasNextPage) return;

    if (_doctors.isEmpty) {
      emit(state.copyWith(status: HomeStatus.loading));
    } else {
      emit(state.copyWith(isLoadingMore: true));
    }

    try {
      final newDoctors = await _repository.getDoctors(page: _currentPage);
      _doctors.addAll(newDoctors);
      _currentPage++;

      emit(
        state.copyWith(
          status: HomeStatus.loaded,
          doctors: List.unmodifiable(_doctors),
          hasNextPage: newDoctors.length == _pageSize,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: HomeStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode = await SharedPrefHelper.getString(
      Paths.local,
    );
    final languageCode = cachedLanguageCode.isEmpty ? 'en' : cachedLanguageCode;
    emit(state.copyWith(languageCode: languageCode));
    // emit(state.copyWith(languageCode: languageCode, status: HomeStatus.languageChanged));
  }

  Future<void> changeLanguage(String newLanguageCode) async {
    await SharedPrefHelper.setData(Paths.local, newLanguageCode);
    // emit(state.copyWith(languageCode: newLanguageCode, status: HomeStatus.languageChanged));
    emit(state.copyWith(languageCode: newLanguageCode));
  }

  Future<void> fetchFavorites() async {
    final response = await _favoriteRepository.fetchFavoritesDoctor();
    response.fold(
      (failure) {
        emit(state.copyWith(favoriteError: failure.message));
      },
      (favoriteDoctorIds) {
        emit(
          state.copyWith(
            favoriteDoctorIds: Set<String>.from(favoriteDoctorIds),
          ),
        );
      },
    );
  }

  Future<void> toggleFavorite(String doctorId) async {
    final currentFavorites = Set<String>.from(state.favoriteDoctorIds);
    final wasAlreadyFavorite = currentFavorites.contains(doctorId);

    if (wasAlreadyFavorite) {
      currentFavorites.remove(doctorId);
    } else {
      currentFavorites.add(doctorId);
    }
    emit(
      state.copyWith(favoriteDoctorIds: currentFavorites, favoriteError: null),
    );

    final response = await _favoriteRepository.toggleFavorite(doctorId);

    response.fold(
      (failure) {
        final revertedFavorites = Set<String>.from(state.favoriteDoctorIds);
        if (wasAlreadyFavorite) {
          revertedFavorites.add(doctorId);
        } else {
          revertedFavorites.remove(doctorId);
        }
        emit(
          state.copyWith(
            favoriteDoctorIds: revertedFavorites,
            favoriteError: failure.message,
          ),
        );
      },
      (isFavorite) {
        final confirmedFavorites = Set<String>.from(state.favoriteDoctorIds);
        if (isFavorite) {
          confirmedFavorites.add(doctorId);
        } else {
          confirmedFavorites.remove(doctorId);
        }
        emit(state.copyWith(favoriteDoctorIds: confirmedFavorites));
      },
    );
  }

  Future<void> refresh() async {
    _doctors.clear();
    _currentPage = 0;
    emit(state.copyWith(status: HomeStatus.loading, hasNextPage: true));
    await loadMore();
  }
}
