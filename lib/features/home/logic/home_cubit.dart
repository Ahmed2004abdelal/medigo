import 'package:bloc/bloc.dart';
import 'package:medigo/features/home/data/repo/doctor_repository.dart';
import 'package:medigo/features/home/logic/home_state.dart';
import 'package:medigo/features/search/data/model/doctor_model.dart';

class HomeCubit extends Cubit<HomeState> {
  final DoctorRepository _repository;
  static const int _pageSize = 20;

  HomeCubit(this._repository) : super(const HomeState.initial()) {
    loadMore();
  }

  int _currentPage = 0;
  bool _hasNextPage = true;
  bool _isFetching = false;
  final List<DoctorModel> _doctors = [];

  Future<void> loadMore() async {
    if (_isFetching || !_hasNextPage) return;

    _isFetching = true;


    if (_doctors.isNotEmpty) {
      emit(HomeState.loaded(
        doctors: List.unmodifiable(_doctors),
        hasNextPage: _hasNextPage,
        isLoadingMore: true,
      ));
    } else {
      emit(const HomeState.loading());
    }

    try {
      final newDoctors = await _repository.getDoctors(
        page: _currentPage,
      );

      _doctors.addAll(newDoctors);
      _currentPage++;
      _hasNextPage = newDoctors.length == _pageSize;
      _isFetching = false;

      emit(HomeState.loaded(
        doctors: List.unmodifiable(_doctors),
        hasNextPage: _hasNextPage,
        isLoadingMore: false,
      ));
    } catch (e) {
      _isFetching = false;
      emit(HomeState.error(e.toString()));
    }
  }

  Future<void> refresh() async {
    _doctors.clear();
    _currentPage = 0;
    _hasNextPage = true;
    _isFetching = false;
    emit(const HomeState.loading());
    await loadMore();
  }
}