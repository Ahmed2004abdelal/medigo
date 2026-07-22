import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardinState> {
  final PageController pageController = PageController();
  OnboardingCubit() : super(OnboardinInitial());

  bool isLastPage(int totalPages) => state.index == totalPages - 1;
  bool isFirstPage() => state.index == 0;

  void changeIndex(int newIndex) {
    emit(OnboardinChanged(index: newIndex));
  }

  void nextPage(int totalPages) {
    if (state.index < totalPages - 1) {
      emit(OnboardinChanged(index: state.index + 1));
    }
  }

  void previousPage() {
    if (state.index > 0) {
      emit(OnboardinChanged(index: state.index - 1));
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
