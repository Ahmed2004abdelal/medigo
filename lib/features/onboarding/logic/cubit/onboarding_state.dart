// onboardin_state.dart
part of 'onboarding_cubit.dart';

@immutable
sealed class OnboardinState {
  final int index;
  const OnboardinState(this.index);
}

final class OnboardinInitial extends OnboardinState {
  const OnboardinInitial() : super(0);
}

final class OnboardinChanged extends OnboardinState {
  const OnboardinChanged({required int index}) : super(index);
}