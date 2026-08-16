import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'search_state.dart';
import '../data/model/doctor_model.dart';

import '../../home/data/repo/doctor_repository.dart';

class SearchCubit extends Cubit<SearchState> {
  final DoctorRepository _doctorRepository;
  static const int _pageSize = 20;
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  String? _currentSpecialty;

  SearchCubit(this._doctorRepository) : super(const SearchState.initial()) {
    searchController.addListener(_onSearchTextChanged);
  }

  int _currentPage = 0;
  final List<DoctorModel> _doctors = [];

  // ==================== init fectch ====================

  // Future<void> fetchDoctors({required String searchQuery}) async {
  //   _currentSpecialty = searchQuery;
  //   await _fetch(specialty: searchQuery, nameQuery: null);
  // }
  Future<void> fetchDoctors({String? searchQuery}) async {
    _currentSpecialty = (searchQuery == null || searchQuery.isEmpty)
        ? null
        : searchQuery;

    await _fetch(specialty: _currentSpecialty, nameQuery: null);
  }

  // ==================== text change ====================

  void _onSearchTextChanged() {
    _debounce?.cancel();
    final text = searchController.text.trim();
    text == ''
        ? null
        : _debounce = Timer(const Duration(milliseconds: 400), () {
            _fetch(
              specialty: _currentSpecialty,
              nameQuery: text.isEmpty ? null : text,
            );
          });
  }

  // ==================== fetch from repo ====================

  Future<void> _fetch({String? specialty, String? nameQuery}) async {
    _doctors.clear();
    _currentPage = 0;

    emit(const SearchState.loading());
    try {
      final response = await _doctorRepository.getDoctors(
        page: _currentPage,
        pageSize: _pageSize,
        specialty: specialty,
        nameQuery: nameQuery,
      );

      _doctors.addAll(response);
      _currentPage++;

      emit(
        SearchState.loaded(
          doctors: List.unmodifiable(_doctors),
          hasNextPage: response.length == _pageSize,
          searchQuery: specialty ?? '',
          currentSort: null,
        ),
      );
    } catch (e) {
      emit(SearchState.error(e.toString()));
    }
  }

  // ==================== pagination ====================

  Future<void> loadMore() async {
    final loadedData = state.mapOrNull(loaded: (s) => s);
    if (loadedData == null) return;
    if (!loadedData.hasNextPage || loadedData.isLoadingMore) return;

    emit(loadedData.copyWith(isLoadingMore: true));

    try {
      final response = await _doctorRepository.getDoctors(
        page: _currentPage,
        pageSize: _pageSize,
        specialty: _currentSpecialty,
        nameQuery: searchController.text.trim().isEmpty
            ? null
            : searchController.text.trim(),
      );

      _doctors.addAll(response);
      _currentPage++;

      emit(
        SearchState.loaded(
          doctors: _sortList(
            List.unmodifiable(_doctors),
            loadedData.currentSort,
          ),
          hasNextPage: response.length == _pageSize,
          searchQuery: loadedData.searchQuery,
          currentSort: loadedData.currentSort,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      emit(SearchState.error(e.toString()));
    }
  }

  // ==================== order ====================

  void changeSort(String? sortValue) {
    final loadedData = state.mapOrNull(loaded: (s) => s);
    if (loadedData == null) return;

    final sortedDoctors = _sortList(
      List<DoctorModel>.from(loadedData.doctors),
      sortValue,
    );

    emit(loadedData.copyWith(doctors: sortedDoctors, currentSort: sortValue));
  }

  List<DoctorModel> _sortList(List<DoctorModel> list, String? currentSort) {
    if (currentSort == null) return list;

    final sorted = List<DoctorModel>.from(list);

    switch (currentSort) {
      case 'name_asc':
        sorted.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 'experience_desc':
        sorted.sort((a, b) => b.experienceYears.compareTo(a.experienceYears));
        break;
      case 'rating_desc':
        sorted.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'fee_asc':
        sorted.sort((a, b) => a.pricePerHour.compareTo(b.pricePerHour));
        break;
      case 'availability':
        sorted.sort(
          (a, b) => (b.isAvailable ? 1 : 0).compareTo(a.isAvailable ? 1 : 0),
        );
        break;
    }
    return sorted;
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    searchController.removeListener(_onSearchTextChanged);
    searchController.dispose();
    return super.close();
  }
}
