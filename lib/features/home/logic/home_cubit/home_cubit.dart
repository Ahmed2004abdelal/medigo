import 'package:bloc/bloc.dart';
import '../../data/repo/doctor_repository.dart';
import 'home_state.dart';
import '../../../search/data/model/doctor_model.dart';

class HomeCubit extends Cubit<HomeState> {
  final DoctorRepository _repository;
  static const int _pageSize = 20;

  HomeCubit(this._repository) : super(const HomeState()) {
    getUserName();
    loadMore();
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
      // print('Error loading doctors: $e');
      emit(
        state.copyWith(status: HomeStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> refresh() async {
    _doctors.clear();
    _currentPage = 0;
    emit(state.copyWith(status: HomeStatus.loading, hasNextPage: true));
    await loadMore();
  }
}
